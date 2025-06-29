<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="registro.aspx.vb" Inherits="brecho.registro" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro de Usuário - Brechó 3D</title>
    <link href="../CSS/estilo-registro.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Cadastro de Usuário</h2>

            <asp:Label ID="lblNomeLogin" runat="server" Text="Email:"></asp:Label><br /><br />
            <asp:TextBox ID="txtNomeLogin" runat="server" CssClass="inputfield"></asp:TextBox><br /><br />

            <asp:Label ID="lblSenha" runat="server" Text="Senha:"></asp:Label><br /><br />
            <asp:TextBox ID="txtSenha" runat="server" CssClass="inputfield" TextMode="Password"></asp:TextBox><br /><br />

            <asp:Label ID="lblPerfil" runat="server" Text="Nome de Usuario:"></asp:Label><br /><br />
            <asp:TextBox ID="txtPerfil" runat="server" CssClass="inputfield"></asp:TextBox><br /><br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                DeleteCommand="DELETE FROM [Usuarios] WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))"
                InsertCommand="INSERT INTO [Usuarios] ([NomeLogin], [Senha], [Perfil]) VALUES (@NomeLogin, @Senha, @Perfil)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Usuarios]"
                UpdateCommand="UPDATE [Usuarios] SET [NomeLogin] = @NomeLogin, [Senha] = @Senha, [Perfil] = @Perfil WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:Parameter Name="original_IDUsuario" Type="Int32" />
                    <asp:Parameter Name="original_NomeLogin" Type="String" />
                    <asp:Parameter Name="original_Senha" Type="String" />
                    <asp:Parameter Name="original_Perfil" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NomeLogin" Type="String" />
                    <asp:Parameter Name="Senha" Type="String" />
                    <asp:Parameter Name="Perfil" Type="String" />
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

            <asp:Button ID="btnSalvar" runat="server" Text="Salvar Usuário" CssClass="button" OnClick="btnSalvar_Click" />
            <br /><br />
            <asp:Label ID="lblMensagem" runat="server" CssClass="mensagemerro"></asp:Label>
            <a href="Login.aspx">Já possui uma conta? Clique aqui!</a>
        </div>
    </form>
</body>
</html>
