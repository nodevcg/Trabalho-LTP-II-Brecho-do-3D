<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadaluno.aspx.vb" Inherits="brecho.cadaluno" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Aluno</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
            <table>
                <tr>
                    <td class="auto-style1">IDAluno</td>
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
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Turma</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTurma" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Email</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Telefone</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Alunos]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Alunos] WHERE [IDAluno] = @original_IDAluno AND (([Nome] = @original_Nome) OR ([Nome] IS NULL AND @original_Nome IS NULL)) AND (([Turma] = @original_Turma) OR ([Turma] IS NULL AND @original_Turma IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Telefone] = @original_Telefone) OR ([Telefone] IS NULL AND @original_Telefone IS NULL))"
                InsertCommand="INSERT INTO [Alunos] ([IDAluno], [Nome], [Turma], [Email], [Telefone]) VALUES (@IDAluno, @Nome, @Turma, @Email, @Telefone)"
                UpdateCommand="UPDATE [Alunos] SET [Nome] = @Nome, [Turma] = @Turma, [Email] = @Email, [Telefone] = @Telefone WHERE [IDAluno] = @original_IDAluno AND (([Nome] = @original_Nome) OR ([Nome] IS NULL AND @original_Nome IS NULL)) AND (([Turma] = @original_Turma) OR ([Turma] IS NULL AND @original_Turma IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Telefone] = @original_Telefone) OR ([Telefone] IS NULL AND @original_Telefone IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDAluno" Type="Int32" />
                    <asp:Parameter Name="original_Nome" Type="String" />
                    <asp:Parameter Name="original_Turma" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Telefone" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtId" Name="IDAluno" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNome" Name="Nome" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtTurma" Name="Turma" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtTelefone" Name="Telefone" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nome" Type="String" />
                    <asp:Parameter Name="Turma" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telefone" Type="String" />
                    <asp:Parameter Name="original_IDAluno" Type="Int32" />
                    <asp:Parameter Name="original_Nome" Type="String" />
                    <asp:Parameter Name="original_Turma" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Telefone" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDAluno"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDAluno" HeaderText="IDAluno" ReadOnly="True" SortExpression="IDAluno" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Turma" HeaderText="Turma" SortExpression="Turma" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>