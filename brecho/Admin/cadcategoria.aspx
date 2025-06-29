<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadcategoria.aspx.vb" Inherits="brecho.cadcategoria" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Categoria</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDCategoria</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nome</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-input" Width="113%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Descrição</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-input" Width="113%" Height="16px"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [CategoriasItem]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [CategoriasItem] WHERE [IDCategoria] = @original_IDCategoria AND (([NomeCategoria] = @original_NomeCategoria) OR ([NomeCategoria] IS NULL AND @original_NomeCategoria IS NULL)) AND (([DescricaoCategoria] = @original_DescricaoCategoria) OR ([DescricaoCategoria] IS NULL AND @original_DescricaoCategoria IS NULL))"
                InsertCommand="INSERT INTO [CategoriasItem] ([IDCategoria], [NomeCategoria], [DescricaoCategoria]) VALUES (@IDCategoria, @NomeCategoria, @DescricaoCategoria)"
                UpdateCommand="UPDATE [CategoriasItem] SET [NomeCategoria] = @NomeCategoria, [DescricaoCategoria] = @DescricaoCategoria WHERE [IDCategoria] = @original_IDCategoria AND (([NomeCategoria] = @original_NomeCategoria) OR ([NomeCategoria] IS NULL AND @original_NomeCategoria IS NULL)) AND (([DescricaoCategoria] = @original_DescricaoCategoria) OR ([DescricaoCategoria] IS NULL AND @original_DescricaoCategoria IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDCategoria" Type="Int32" />
                    <asp:Parameter Name="original_NomeCategoria" Type="String" />
                    <asp:Parameter Name="original_DescricaoCategoria" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtId" Name="IDCategoria" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNome" Name="NomeCategoria" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDesc" Name="DescricaoCategoria" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NomeCategoria" Type="String" />
                    <asp:Parameter Name="DescricaoCategoria" Type="String" />
                    <asp:Parameter Name="original_IDCategoria" Type="Int32" />
                    <asp:Parameter Name="original_NomeCategoria" Type="String" />
                    <asp:Parameter Name="original_DescricaoCategoria" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDCategoria"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDCategoria" HeaderText="IDCategoria" ReadOnly="True" SortExpression="IDCategoria" />
                    <asp:BoundField DataField="NomeCategoria" HeaderText="NomeCategoria" SortExpression="NomeCategoria" />
                    <asp:BoundField DataField="DescricaoCategoria" HeaderText="DescricaoCategoria" SortExpression="DescricaoCategoria" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
