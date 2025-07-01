Imports System.Data.SqlClient

Partial Class registro
    Inherits System.Web.UI.Page

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        Dim conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("trabalho_ltp_raluca").ConnectionString)
        Dim verifica As New SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE NomeLogin = @NomeLogin", conexao)
        verifica.Parameters.AddWithValue("@NomeLogin", txtNomeLogin.Text)

        SqlDataSource1.InsertParameters("NomeLogin").DefaultValue = txtNomeLogin.Text
        SqlDataSource1.InsertParameters("Senha").DefaultValue = txtSenha.Text
        SqlDataSource1.InsertParameters("Perfil").DefaultValue = txtPerfil.Text

        Try
            conexao.Open()
            Dim existe As Integer = Convert.ToInt32(verifica.ExecuteScalar())
            conexao.Close()

            If existe > 0 Then
                lblMensagem.ForeColor = Drawing.Color.Red
                lblMensagem.Text = "Esse email já está cadastrado."
            Else
                SqlDataSource1.Insert()
                lblMensagem.ForeColor = Drawing.Color.LightGreen
                lblMensagem.Text = "Usuário cadastrado com sucesso!"
                Response.Redirect("Login.aspx")
            End If
        Catch ex As Exception
            lblMensagem.ForeColor = Drawing.Color.Red
            lblMensagem.Text = "Erro ao salvar: " & ex.Message
        End Try
    End Sub
End Class
