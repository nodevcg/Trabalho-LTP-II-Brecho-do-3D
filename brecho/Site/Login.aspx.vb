Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        If txtLogin.Text.ToLower() = "admin" AndAlso txtSenha.Text = "admin123" Then
            Session("usuarioLogado") = "admin"
            Session("isAdmin") = True
            Response.Redirect("../Admin/Default-admin.aspx")
            Return
        End If

        Dim conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("trabalho_ltp_raluca").ConnectionString)
        Dim comando As New SqlCommand("SELECT * FROM USUARIOS WHERE NomeLogin = @login AND Senha = @senha", conexao)

        comando.Parameters.AddWithValue("@login", txtLogin.Text)
        comando.Parameters.AddWithValue("@senha", txtSenha.Text)

        Try
            conexao.Open()
            Dim leitor As SqlDataReader = comando.ExecuteReader()
            If leitor.HasRows Then
                leitor.Read()
                Session("usuarioLogado") = txtLogin.Text
                Session("isAdmin") = False
                Response.Redirect("Default.aspx")
            Else
                lblMensagem.Text = "Email ou senha inválidos."
            End If
        Catch ex As Exception
            lblMensagem.Text = "Erro ao conectar: " & ex.Message
        Finally
            conexao.Close()
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class