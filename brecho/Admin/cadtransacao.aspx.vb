Public Class cadtransacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCadastrar_Click(sender As Object, e As EventArgs) Handles btnCadastrar.Click
        SqlDataSource1.Insert()
        txtData.Text = ""
        txtDoador.Text = ""
        txtId.Text = ""
        txtItem.Text = ""
        txtReceptor.Text = ""
        txtTipo.Text = ""
    End Sub
End Class