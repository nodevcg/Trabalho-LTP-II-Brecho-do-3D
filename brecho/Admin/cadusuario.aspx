<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadusuario.aspx.vb" Inherits="brecho.cadusuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDUsuario</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nome Login</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtLogin" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Senha</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtSenha" runat="server" CssClass="form-input" Width="102%" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Perfil</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPerfil" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Usuarios]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Usuarios] WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))"
                InsertCommand="INSERT INTO [Usuarios] ([NomeLogin], [Senha], [Perfil]) VALUES (@NomeLogin, @Senha, @Perfil)"
                UpdateCommand="UPDATE [Usuarios] SET [NomeLogin] = @NomeLogin, [Senha] = @Senha, [Perfil] = @Perfil WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDUsuario" Type="Int32" />
                    <asp:Parameter Name="original_NomeLogin" Type="String" />
                    <asp:Parameter Name="original_Senha" Type="String" />
                    <asp:Parameter Name="original_Perfil" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtLogin" Name="NomeLogin" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtSenha" Name="Senha" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPerfil" Name="Perfil" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NomeLogin" Type="String" />
                    <asp:Parameter Name="Senha" Type="String" />
                    <asp:Parameter Name="Perfil" Type="String" />
                    <asp:Parameter Name="original_IDUsuario" Type="Int32" />
                    <asp:Parameter Name="original_NomeLogin" Type="String" />
                    <asp:Parameter Name="original_Senha" Type="String" />
                    <asp:Parameter Name="original_Perfil" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDUsuario"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDUsuario" HeaderText="IDUsuario" ReadOnly="True" SortExpression="IDUsuario" />
                    <asp:BoundField DataField="NomeLogin" HeaderText="NomeLogin" SortExpression="NomeLogin" />
                    <asp:BoundField DataField="Senha" HeaderText="Senha" SortExpression="Senha" />
                    <asp:BoundField DataField="Perfil" HeaderText="Perfil" SortExpression="Perfil" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>