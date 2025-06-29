Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class EnviarItem
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("trabalho_ltp_raluca").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("usuarioLogado") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            CarregarCategorias()
        End If
    End Sub

    Private Sub CarregarCategorias()
        Try
            Using conn As New SqlConnection(connectionString)
                conn.Open()
                Dim cmd As New SqlCommand("SELECT IDCategoria, NomeCategoria FROM CategoriasItem ORDER BY NomeCategoria", conn)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                ddlCategoria.Items.Clear()
                ddlCategoria.Items.Add(New ListItem("Selecione uma categoria", ""))

                While reader.Read()
                    ddlCategoria.Items.Add(New ListItem(reader("NomeCategoria").ToString(), reader("IDCategoria").ToString()))
                End While
            End Using
        Catch ex As Exception
            ExibirMensagem("Erro ao carregar categorias: " & ex.Message, False)
        End Try
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs)
        Try
            If ValidarFormulario() Then
                Dim nomeArquivo As String = ""

                If fuFoto.HasFile Then
                    nomeArquivo = SalvarFoto()
                    If String.IsNullOrEmpty(nomeArquivo) Then
                        Exit Sub
                    End If
                End If

                SqlDataSource1.InsertParameters("NomeItem").DefaultValue = txtNome.Text.Trim()
                SqlDataSource1.InsertParameters("Descricao").DefaultValue = txtDescricao.Text.Trim()
                SqlDataSource1.InsertParameters("EstadoConservacao").DefaultValue = ddlEstado.SelectedValue
                SqlDataSource1.InsertParameters("IDCategoria").DefaultValue = ddlCategoria.SelectedValue
                SqlDataSource1.InsertParameters("FotoItem").DefaultValue = nomeArquivo
                SqlDataSource1.InsertParameters("Preco").DefaultValue = Convert.ToDecimal(txtPreco.Text.Replace(",", ".")).ToString()

                SqlDataSource1.Insert()

                LimparFormulario()
                ExibirMensagem("Item enviado com sucesso para o brechó!", True)
            End If
        Catch ex As Exception
            ExibirMensagem("Erro ao enviar item: " & ex.Message, False)
        End Try
    End Sub

    Private Function ValidarFormulario() As Boolean
        If String.IsNullOrEmpty(txtNome.Text.Trim()) Then
            ExibirMensagem("Por favor, informe o nome do item.", False)
            Return False
        End If

        If String.IsNullOrEmpty(ddlCategoria.SelectedValue) Then
            ExibirMensagem("Por favor, selecione uma categoria.", False)
            Return False
        End If

        If String.IsNullOrEmpty(ddlEstado.SelectedValue) Then
            ExibirMensagem("Por favor, selecione o estado de conservação.", False)
            Return False
        End If

        Dim preco As Decimal
        If Not Decimal.TryParse(txtPreco.Text.Replace(",", "."), preco) OrElse preco <= 0 Then
            ExibirMensagem("Por favor, informe um preço válido.", False)
            Return False
        End If

        If fuFoto.HasFile Then
            Dim extensao As String = Path.GetExtension(fuFoto.FileName).ToLower()
            If Not (extensao = ".jpg" Or extensao = ".jpeg" Or extensao = ".png" Or extensao = ".gif") Then
                ExibirMensagem("Por favor, selecione uma imagem válida (JPG, PNG, GIF).", False)
                Return False
            End If

            If fuFoto.PostedFile.ContentLength > 5 * 1024 * 1024 Then
                ExibirMensagem("A imagem deve ter no máximo 5MB.", False)
                Return False
            End If
        End If

        Return True
    End Function

    Private Function SalvarFoto() As String
        Try
            Dim nomeArquivo As String = Guid.NewGuid().ToString() & Path.GetExtension(fuFoto.FileName)
            Dim caminhoCompleto As String = Server.MapPath("~/Uploads/") & nomeArquivo

            If Not Directory.Exists(Server.MapPath("~/Uploads/")) Then
                Directory.CreateDirectory(Server.MapPath("~/Uploads/"))
            End If

            fuFoto.SaveAs(caminhoCompleto)
            Return "Uploads/" & nomeArquivo
        Catch ex As Exception
            ExibirMensagem("Erro ao salvar a foto: " & ex.Message, False)
            Return ""
        End Try
    End Function

    Private Function InserirItem(nomeArquivo As String) As Boolean
        Try
            Using conn As New SqlConnection(connectionString)
                conn.Open()

                Dim sql As String = "INSERT INTO Itens (NomeItem, Descricao, EstadoConservacao, IDCategoria, DataCadastro, FotoItem, Preco) " &
                                  "VALUES (@Nome, @Descricao, @Estado, @Categoria, @Data, @Foto, @Preco)"

                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@Nome", txtNome.Text.Trim())
                    cmd.Parameters.AddWithValue("@Descricao", If(String.IsNullOrEmpty(txtDescricao.Text.Trim()), DBNull.Value, txtDescricao.Text.Trim()))
                    cmd.Parameters.AddWithValue("@Estado", ddlEstado.SelectedValue)
                    cmd.Parameters.AddWithValue("@Categoria", Convert.ToInt32(ddlCategoria.SelectedValue))
                    cmd.Parameters.AddWithValue("@Data", DateTime.Now)
                    cmd.Parameters.AddWithValue("@Foto", If(String.IsNullOrEmpty(nomeArquivo), DBNull.Value, nomeArquivo))
                    cmd.Parameters.AddWithValue("@Preco", Convert.ToDecimal(txtPreco.Text.Replace(",", ".")))

                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return True
        Catch ex As Exception
            ExibirMensagem("Erro ao inserir item no banco de dados: " & ex.Message, False)
            Return False
        End Try
    End Function

    Private Sub LimparFormulario()
        txtNome.Text = ""
        txtDescricao.Text = ""
        txtPreco.Text = ""
        ddlCategoria.SelectedIndex = 0
        ddlEstado.SelectedIndex = 0
    End Sub

    Private Sub ExibirMensagem(mensagem As String, sucesso As Boolean)
        lblMensagem.Text = mensagem
        If sucesso Then
            messageDiv.Attributes("class") = "message success"
        Else
            messageDiv.Attributes("class") = "message error"
        End If
        pnlMensagem.Visible = True
    End Sub

    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs)
        Response.Redirect("Default.aspx")
    End Sub
End Class