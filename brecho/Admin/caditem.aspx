<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="caditem.aspx.vb" Inherits="brecho.caditem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Item</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css"/>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDItem</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nome Item</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Descrição</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-input" Width="148%" Height="56px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Estado Conservação</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEstado" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Preço</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPreco" runat="server" CssClass="form-input" Width="102%" placeholder="0,00"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Categoria</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Data Cadastro</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtData" runat="server" CssClass="form-input" Width="102%" TextMode="Date"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Foto Item</td>
                    <td class="auto-style2">
                        <asp:FileUpload ID="fileUploadFoto" runat="server" CssClass="form-input" Width="102%" />
                        <asp:TextBox ID="txtFoto" runat="server" CssClass="form-input" Width="102%" Visible="false"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblStatusUpload" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="imgPreview" runat="server" Width="100px" Height="100px" Visible="false" />
                    </td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Itens]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Itens] WHERE [IDItem] = @original_IDItem"
                InsertCommand="INSERT INTO [Itens] ([IDItem], [NomeItem], [Descricao], [EstadoConservacao], [Preco], [IDCategoria], [DataCadastro], [FotoItem]) VALUES (@IDItem, @NomeItem, @Descricao, @EstadoConservacao, @Preco, @IDCategoria, @DataCadastro, @FotoItem)"
                UpdateCommand="UPDATE [Itens] SET [NomeItem] = @NomeItem, [Descricao] = @Descricao, [EstadoConservacao] = @EstadoConservacao, [Preco] = @Preco, [IDCategoria] = @IDCategoria, [DataCadastro] = @DataCadastro, [FotoItem] = @FotoItem WHERE [IDItem] = @original_IDItem">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDItem" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtId" Name="IDItem" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNome" Name="NomeItem" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDesc" Name="Descricao" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEstado" Name="EstadoConservacao" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPreco" Name="Preco" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="txtCategoria" Name="IDCategoria" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtData" Name="DataCadastro" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtFoto" Name="FotoItem" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NomeItem" Type="String" />
                    <asp:Parameter Name="Descricao" Type="String" />
                    <asp:Parameter Name="EstadoConservacao" Type="String" />
                    <asp:Parameter Name="Preco" Type="Decimal" />
                    <asp:Parameter Name="IDCategoria" Type="Int32" />
                    <asp:Parameter Name="DataCadastro" Type="DateTime" />
                    <asp:Parameter Name="FotoItem" Type="String" />
                    <asp:Parameter Name="original_IDItem" Type="Int32" />
                    <asp:Parameter Name="original_NomeItem" Type="String" />
                    <asp:Parameter Name="original_Descricao" Type="String" />
                    <asp:Parameter Name="original_EstadoConservacao" Type="String" />
                    <asp:Parameter Name="original_Preco" Type="Decimal" />
                    <asp:Parameter Name="original_IDCategoria" Type="Int32" />
                    <asp:Parameter Name="original_DataCadastro" Type="DateTime" />
                    <asp:Parameter Name="original_FotoItem" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDItem"
                DataSourceID="SqlDataSource1"
                OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="IDItem" HeaderText="IDItem" ReadOnly="True" SortExpression="IDItem" />
                    <asp:BoundField DataField="NomeItem" HeaderText="NomeItem" SortExpression="NomeItem" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:BoundField DataField="EstadoConservacao" HeaderText="EstadoConservacao" SortExpression="EstadoConservacao" />
                    <asp:BoundField DataField="Preco" HeaderText="Preço" SortExpression="Preco" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="IDCategoria" HeaderText="IDCategoria" SortExpression="IDCategoria" />
                    <asp:BoundField DataField="DataCadastro" HeaderText="DataCadastro" SortExpression="DataCadastro" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Foto" SortExpression="FotoItem">
                        <ItemTemplate>
                            <asp:Image ID="imgItem" runat="server" 
                                ImageUrl='<%# If(String.IsNullOrEmpty(Eval("FotoItem").ToString()), "~/Imagens/sem-imagem.jpg", "~/" + Eval("FotoItem").ToString()) %>' 
                                Width="50px" Height="50px" 
                                onerror="this.src='../Imagens/sem-imagem.jpg'" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FotoItem") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>