Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class _Default
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("trabalho_ltp_raluca").ConnectionString
    Private categoriaAtual As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("usuarioLogado") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If

        lblUsuarioLogado.Text = Session("usuarioLogado").ToString()

        If Not IsPostBack Then
            CarregarCategorias()
            CarregarProdutos()
        End If
    End Sub

    Private Sub CarregarCategorias()
        Try
            Using conn As New SqlConnection(connectionString)
                conn.Open()
                Dim cmd As New SqlCommand("SELECT IDCategoria, NomeCategoria, DescricaoCategoria FROM CategoriasItem ORDER BY NomeCategoria", conn)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                rptCategorias.DataSource = reader
                rptCategorias.DataBind()
            End Using
        Catch ex As Exception
            lblMensagem.Text = "Erro ao carregar categorias: " & ex.Message
            lblMensagem.Visible = True
        End Try
    End Sub

    Private Sub CarregarProdutos(Optional categoriaId As Integer = 0, Optional termoBusca As String = "")
        Try
            Using conn As New SqlConnection(connectionString)
                conn.Open()

                Dim sql As String = "SELECT i.IDItem, i.NomeItem, i.Descricao, i.EstadoConservacao, i.Preco, " &
                                  "i.DataCadastro, i.FotoItem, c.NomeCategoria " &
                                  "FROM Itens i " &
                                  "INNER JOIN CategoriasItem c ON i.IDCategoria = c.IDCategoria " &
                                  "WHERE 1=1 "

                Dim parametros As New List(Of SqlParameter)

                If categoriaId > 0 Then
                    sql += "AND i.IDCategoria = @CategoriaId "
                    parametros.Add(New SqlParameter("@CategoriaId", categoriaId))
                End If

                If Not String.IsNullOrEmpty(termoBusca) Then
                    sql += "AND (i.NomeItem LIKE @Termo OR i.Descricao LIKE @Termo OR c.NomeCategoria LIKE @Termo) "
                    parametros.Add(New SqlParameter("@Termo", "%" & termoBusca & "%"))
                End If

                sql += "ORDER BY i.DataCadastro DESC"

                Dim cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddRange(parametros.ToArray())

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                Dim dt As New DataTable()
                dt.Load(reader)

                If dt.Rows.Count > 0 Then
                    rptProdutos.DataSource = dt
                    rptProdutos.DataBind()
                    lblMensagem.Visible = False
                Else
                    rptProdutos.DataSource = Nothing
                    rptProdutos.DataBind()
                    lblMensagem.Text = "Nenhum produto encontrado."
                    lblMensagem.Visible = True
                End If
            End Using
        Catch ex As Exception
            lblMensagem.Text = "Erro ao carregar produtos: " & ex.Message
            lblMensagem.Visible = True
        End Try
    End Sub

    Protected Sub FilterCategory_Click(sender As Object, e As EventArgs)
        Try
            Dim btn As Button = CType(sender, Button)
            Dim categoriaId As Integer = Convert.ToInt32(btn.CommandArgument)

            categoriaAtual = categoriaId
            ViewState("CategoriaAtual") = categoriaId

            AtualizarBotoesCategoria(categoriaId)

            CarregarProdutos(categoriaId, txtSearch.Text.Trim())

        Catch ex As Exception
            lblMensagem.Text = "Erro ao filtrar categoria: " & ex.Message
            lblMensagem.Visible = True
        End Try
    End Sub

    Protected Sub txtSearch_TextChanged(sender As Object, e As EventArgs)
        Try
            Dim termoBusca As String = txtSearch.Text.Trim()
            Dim categoriaId As Integer = If(ViewState("CategoriaAtual") IsNot Nothing, Convert.ToInt32(ViewState("CategoriaAtual")), 0)

            CarregarProdutos(categoriaId, termoBusca)
        Catch ex As Exception
            lblMensagem.Text = "Erro na busca: " & ex.Message
            lblMensagem.Visible = True
        End Try
    End Sub

    Protected Sub btnUsuario_Click(sender As Object, e As EventArgs)
        Response.Redirect("Usuario.aspx")
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub

    Private Sub AtualizarBotoesCategoria(categoriaIdSelecionada As Integer)
        Try
            If categoriaIdSelecionada = 0 Then
                btnTodos.CssClass = "category-card selected"
            Else
                btnTodos.CssClass = "category-card"
            End If

            For Each item As RepeaterItem In rptCategorias.Items
                Dim btn As Button = CType(item.FindControl("btnCategoria"), Button)
                If btn IsNot Nothing Then
                    Dim btnCategoriaId As Integer = Convert.ToInt32(btn.CommandArgument)
                    If btnCategoriaId = categoriaIdSelecionada Then
                        btn.CssClass = "category-card selected"
                    Else
                        btn.CssClass = "category-card"
                    End If
                End If
            Next
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If ViewState("CategoriaAtual") IsNot Nothing Then
            Dim categoriaId As Integer = Convert.ToInt32(ViewState("CategoriaAtual"))
            AtualizarBotoesCategoria(categoriaId)
        End If
    End Sub

    Protected Sub btnEnviarItem_Click(sender As Object, e As EventArgs)
        Response.Redirect("EnviarItem.aspx")
    End Sub
End Class