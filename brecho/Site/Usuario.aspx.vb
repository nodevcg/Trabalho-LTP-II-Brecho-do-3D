Imports System.Data.SqlClient

Partial Class Usuario
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("trabalho_ltp_raluca").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("usuarioLogado") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            CarregarDadosUsuario()
            CarregarEstatisticas()
            CarregarHistoricoTransacoes()
        End If
    End Sub

    Private Sub CarregarDadosUsuario()
        Try
            Dim nomeUsuario As String = Session("usuarioLogado").ToString()
            lblNomeUsuario.Text = nomeUsuario
            txtUsuarioAtual.Text = nomeUsuario

            Dim iniciais As String = ""
            Dim palavras() As String = nomeUsuario.Split(" "c)
            For Each palavra As String In palavras
                If palavra.Length > 0 Then
                    iniciais += palavra.Substring(0, 1).ToUpper()
                    If iniciais.Length >= 2 Then Exit For
                End If
            Next
            If iniciais.Length = 0 Then iniciais = nomeUsuario.Substring(0, 1).ToUpper()
            lblIniciais.Text = iniciais

            lblDataCadastro.Text = "Julho 2025"

        Catch ex As Exception
            ExibirMensagem("Erro ao carregar dados do usuário: " & ex.Message, False)
        End Try
    End Sub

    Private Function ObterIDUsuario() As Integer
        Try
            Using conn As New SqlConnection(connectionString)
                conn.Open()
                Dim cmd As New SqlCommand("SELECT IDUsuario FROM Usuarios WHERE NomeLogin = @nomeLogin", conn)
                cmd.Parameters.AddWithValue("@nomeLogin", Session("usuarioLogado").ToString())

                Dim resultado As Object = cmd.ExecuteScalar()
                If resultado IsNot Nothing AndAlso Not IsDBNull(resultado) Then
                    Return Convert.ToInt32(resultado)
                Else
                    Return 0
                End If
            End Using
        Catch ex As Exception
            Return 0
        End Try
    End Function

    Private Sub CarregarEstatisticas()
        Try
            Dim idUsuario As Integer = ObterIDUsuario()

            If idUsuario = 0 Then
                lblTotalCompras.Text = "0"
                lblTotalVendas.Text = "0"
                lblEventosParticipados.Text = "0"
                Return
            End If

            Using conn As New SqlConnection(connectionString)
                conn.Open()

                Dim cmdCompras As New SqlCommand("SELECT COUNT(*) FROM Transacoes WHERE IDAlunoReceptor = @userId AND TipoTransacao = 'Compra'", conn)
                cmdCompras.Parameters.AddWithValue("@userId", idUsuario)
                lblTotalCompras.Text = cmdCompras.ExecuteScalar().ToString()

                Dim cmdVendas As New SqlCommand("SELECT COUNT(*) FROM Transacoes WHERE IDAlunoDoador = @userId", conn)
                cmdVendas.Parameters.AddWithValue("@userId", idUsuario)
                lblTotalVendas.Text = cmdVendas.ExecuteScalar().ToString()

                Dim cmdEventos As New SqlCommand("SELECT COUNT(*) FROM ConvitesEvento WHERE IDAlunoConvidado = @userId AND StatusConvite = 'Aceito'", conn)
                cmdEventos.Parameters.AddWithValue("@userId", idUsuario)
                lblEventosParticipados.Text = cmdEventos.ExecuteScalar().ToString()

            End Using
        Catch ex As Exception
            lblTotalCompras.Text = "0"
            lblTotalVendas.Text = "0"
            lblEventosParticipados.Text = "0"
        End Try
    End Sub

    Private Sub CarregarHistoricoTransacoes()
        Try
            Dim idUsuario As Integer = ObterIDUsuario()

            If idUsuario = 0 Then
                Return
            End If

            Using conn As New SqlConnection(connectionString)
                conn.Open()

                Dim sql As String = "SELECT t.DataTransacao, i.NomeItem, t.TipoTransacao, i.Preco " &
                                    "FROM Transacoes t " &
                                    "INNER JOIN Itens i ON t.IDItem = i.IDItem " &
                                    "WHERE t.IDAlunoReceptor = @userId OR t.IDAlunoDoador = @userId " &
                                    "ORDER BY t.DataTransacao DESC"
                Dim cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@userId", idUsuario)
                Dim adapter As New SqlDataAdapter(cmd)
                Dim dt As New DataTable()
                adapter.Fill(dt)
                gvHistorico.DataSource = dt
                gvHistorico.DataBind()

            End Using
        Catch ex As Exception
            ExibirMensagem("Erro ao carregar histórico: " & ex.Message, False)
        End Try
    End Sub

    Protected Sub btnSalvarSenha_Click(sender As Object, e As EventArgs)
        Try
            Dim senhaAtual As String = txtSenhaAtual.Text.Trim()
            Dim novaSenha As String = txtNovaSenha.Text.Trim()
            Dim confirmarSenha As String = txtConfirmarSenha.Text.Trim()

            If String.IsNullOrEmpty(senhaAtual) Then
                ExibirMensagem("Digite a senha atual.", False)
                Return
            End If

            If String.IsNullOrEmpty(novaSenha) Then
                ExibirMensagem("Digite a nova senha.", False)
                Return
            End If

            If novaSenha.Length < 4 Then
                ExibirMensagem("A nova senha deve ter pelo menos 4 caracteres.", False)
                Return
            End If

            If novaSenha <> confirmarSenha Then
                ExibirMensagem("A confirmação da senha não confere.", False)
                Return
            End If

            Using conn As New SqlConnection(connectionString)
                conn.Open()
                Dim cmdVerificar As New SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE NomeLogin = @login AND Senha = @senhaAtual", conn)
                cmdVerificar.Parameters.AddWithValue("@login", Session("usuarioLogado").ToString())
                cmdVerificar.Parameters.AddWithValue("@senhaAtual", senhaAtual)

                Dim senhaCorreta As Integer = Convert.ToInt32(cmdVerificar.ExecuteScalar())

                If senhaCorreta = 0 Then
                    ExibirMensagem("Senha atual incorreta.", False)
                    Return
                End If

                Dim cmdAtualizar As New SqlCommand("UPDATE Usuarios SET Senha = @novaSenha WHERE NomeLogin = @login", conn)
                cmdAtualizar.Parameters.AddWithValue("@novaSenha", novaSenha)
                cmdAtualizar.Parameters.AddWithValue("@login", Session("usuarioLogado").ToString())

                Dim linhasAfetadas As Integer = cmdAtualizar.ExecuteNonQuery()

                If linhasAfetadas > 0 Then
                    ExibirMensagem("Senha alterada com sucesso!", True)
                    LimparCamposSenha()
                Else
                    ExibirMensagem("Erro ao alterar a senha.", False)
                End If
            End Using

        Catch ex As Exception
            ExibirMensagem("Erro ao alterar senha: " & ex.Message, False)
        End Try
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        LimparCamposSenha()
        pnlMensagem.Visible = False
    End Sub

    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs)
        Response.Redirect("Default.aspx")
    End Sub

    Private Sub LimparCamposSenha()
        txtSenhaAtual.Text = ""
        txtNovaSenha.Text = ""
        txtConfirmarSenha.Text = ""
    End Sub

    Private Sub ExibirMensagem(mensagem As String, sucesso As Boolean)
        lblMensagem.Text = mensagem
        pnlMensagem.Visible = True

        If sucesso Then
            alertDiv.Attributes("class") = "alert alert-success"
        Else
            alertDiv.Attributes("class") = "alert alert-error"
        End If
    End Sub

End Class
