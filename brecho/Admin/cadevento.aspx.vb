Public Class cadevento
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub btnCadastrar_Click(sender As Object, e As EventArgs) Handles btnCadastrar.Click
        SqlDataSource1.Insert()
        txtNome.Text = ""
        txtDesc.Text = ""
        txtData.Text = ""
        txtLocal.Text = ""
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

    End Sub
End Class