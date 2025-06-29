Imports System.IO
Imports System.Globalization

Public Class caditem
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtData.Text = DateTime.Now.ToString("yyyy-MM-dd")
        End If
    End Sub

    Protected Sub btnCadastrar_Click(sender As Object, e As EventArgs) Handles btnCadastrar.Click
        Try
            ' Validação do preço
            Dim preco As Decimal
            If Not Decimal.TryParse(txtPreco.Text.Replace(".", ","), preco) Then
                lblStatusUpload.Text = "Por favor, digite um preço válido (ex: 10,50)"
                lblStatusUpload.ForeColor = Drawing.Color.Red
                Return
            End If

            If preco < 0 Then
                lblStatusUpload.Text = "O preço não pode ser negativo"
                lblStatusUpload.ForeColor = Drawing.Color.Red
                Return
            End If

            ' Processamento da imagem
            If fileUploadFoto.HasFile Then
                Dim extensoesPermitidas As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp"}
                Dim extensaoArquivo As String = Path.GetExtension(fileUploadFoto.FileName).ToLower()

                If Array.IndexOf(extensoesPermitidas, extensaoArquivo) = -1 Then
                    lblStatusUpload.Text = "Apenas arquivos de imagem são permitidos (jpg, jpeg, png, gif, bmp)"
                    lblStatusUpload.ForeColor = Drawing.Color.Red
                    Return
                End If

                If fileUploadFoto.PostedFile.ContentLength > 5242880 Then
                    lblStatusUpload.Text = "O arquivo deve ter no máximo 5MB"
                    lblStatusUpload.ForeColor = Drawing.Color.Red
                    Return
                End If

                Dim nomeArquivo As String = Guid.NewGuid().ToString() & extensaoArquivo
                Dim pastaImagens As String = Server.MapPath("~/Imagens/")

                If Not Directory.Exists(pastaImagens) Then
                    Directory.CreateDirectory(pastaImagens)
                End If

                Dim caminhoCompleto As String = Path.Combine(pastaImagens, nomeArquivo)
                fileUploadFoto.SaveAs(caminhoCompleto)

                Dim caminhoImagem As String = "Imagens/" & nomeArquivo
                txtFoto.Text = caminhoImagem
                imgPreview.ImageUrl = "~/" & caminhoImagem
                imgPreview.Visible = True

                lblStatusUpload.Text = "Imagem carregada com sucesso!"
                lblStatusUpload.ForeColor = Drawing.Color.Green
            End If

            ' Formatação do preço para inserção no banco
            txtPreco.Text = preco.ToString("F2", CultureInfo.InvariantCulture)

            SqlDataSource1.Insert()
            LimparFormulario()

            lblStatusUpload.Text = "Item cadastrado com sucesso!"
            lblStatusUpload.ForeColor = Drawing.Color.Green

        Catch ex As Exception
            lblStatusUpload.Text = "Erro ao processar: " & ex.Message
            lblStatusUpload.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            Dim caminhoImagem As String = GridView1.DataKeys(e.RowIndex).Values("FotoItem")
            If Not String.IsNullOrEmpty(caminhoImagem) Then
                Dim caminhoCompleto As String = Server.MapPath("~/" & caminhoImagem)
                If File.Exists(caminhoCompleto) Then
                    File.Delete(caminhoCompleto)
                End If
            End If
        Catch ex As Exception
            ' Erro silencioso ao deletar imagem
        End Try
    End Sub

    Private Sub LimparFormulario()
        txtId.Text = ""
        txtNome.Text = ""
        txtDesc.Text = ""
        txtEstado.Text = ""
        txtPreco.Text = ""
        txtCategoria.Text = ""
        txtData.Text = DateTime.Now.ToString("yyyy-MM-dd")
        txtFoto.Text = ""
        imgPreview.Visible = False
    End Sub

End Class