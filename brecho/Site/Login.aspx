<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="brecho.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Brechó 3D</title>
    <link href="../CSS/estilo-login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <style type="text/css">
        .button {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login - Acesso ao Sistema do Brechó3D</h2>
            <asp:Label ID="lblLogin" runat="server" Text="Login:"></asp:Label> <br /> <br />
            <asp:TextBox ID="txtLogin" runat="server" placeholder="Login"></asp:TextBox> <br /> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;C:\Users\ADM\Desktop\programa\brechó 3D - quinto periodo\b2\trabalho_ltp_raluca.mdf&quot;;Integrated Security=True;Connect Timeout=30" DeleteCommand="DELETE FROM [Usuarios] WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))" InsertCommand="INSERT INTO [Usuarios] ([NomeLogin], [Senha], [Perfil]) VALUES (@NomeLogin, @Senha, @Perfil)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [NomeLogin] = @NomeLogin, [Senha] = @Senha, [Perfil] = @Perfil WHERE [IDUsuario] = @original_IDUsuario AND (([NomeLogin] = @original_NomeLogin) OR ([NomeLogin] IS NULL AND @original_NomeLogin IS NULL)) AND (([Senha] = @original_Senha) OR ([Senha] IS NULL AND @original_Senha IS NULL)) AND (([Perfil] = @original_Perfil) OR ([Perfil] IS NULL AND @original_Perfil IS NULL))">
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
            <br />
            <asp:Label ID="lblSenha" runat="server" Text="Senha:"></asp:Label> <br /> <br />
            <asp:TextBox ID="txtSenha" runat="server" placeholder="Senha" TextMode="Password"></asp:TextBox> <br /> <br />
            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn-login" OnClick="btnEntrar_Click" /> <br /> <br />
            <asp:Label ID="lblMensagem" runat="server" CssClass="mensagemerro"></asp:Label> <br />
            <a href="registro.aspx">Não tem uma conta? Clique aqui para registrar-se</a>
        </div> 
    </form>
</body>
</html>
