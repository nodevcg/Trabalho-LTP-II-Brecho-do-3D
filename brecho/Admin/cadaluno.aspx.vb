Public Class cadaluno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCadastrar_Click(sender As Object, e As EventArgs) Handles btnCadastrar.Click
        SqlDataSource1.Insert()
        txtId.Text = ""
        txtEmail.Text = ""
        txtNome.Text = ""
        txtTelefone.Text = ""
        txtTurma.Text = ""
    End Sub
End Class