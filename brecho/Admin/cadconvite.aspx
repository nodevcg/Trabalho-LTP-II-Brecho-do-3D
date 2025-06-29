<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadconvite.aspx.vb" Inherits="brecho.cadconvite" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Convite</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDConvite</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Evento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEvento" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Aluno Convidado</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtAluno" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Status Convite</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtStatus" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Data Envio</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtData" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [ConvitesEvento]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [ConvitesEvento] WHERE [IDConvite] = @original_IDConvite AND (([IDEvento] = @original_IDEvento) OR ([IDEvento] IS NULL AND @original_IDEvento IS NULL)) AND (([IDAlunoConvidado] = @original_IDAlunoConvidado) OR ([IDAlunoConvidado] IS NULL AND @original_IDAlunoConvidado IS NULL)) AND (([StatusConvite] = @original_StatusConvite) OR ([StatusConvite] IS NULL AND @original_StatusConvite IS NULL)) AND (([DataEnvio] = @original_DataEnvio) OR ([DataEnvio] IS NULL AND @original_DataEnvio IS NULL))"
                InsertCommand="INSERT INTO [ConvitesEvento] ([IDEvento], [IDAlunoConvidado], [StatusConvite], [DataEnvio]) VALUES (@IDEvento, @IDAlunoConvidado, @StatusConvite, @DataEnvio)"
                UpdateCommand="UPDATE [ConvitesEvento] SET [IDEvento] = @IDEvento, [IDAlunoConvidado] = @IDAlunoConvidado, [StatusConvite] = @StatusConvite, [DataEnvio] = @DataEnvio WHERE [IDConvite] = @original_IDConvite AND (([IDEvento] = @original_IDEvento) OR ([IDEvento] IS NULL AND @original_IDEvento IS NULL)) AND (([IDAlunoConvidado] = @original_IDAlunoConvidado) OR ([IDAlunoConvidado] IS NULL AND @original_IDAlunoConvidado IS NULL)) AND (([StatusConvite] = @original_StatusConvite) OR ([StatusConvite] IS NULL AND @original_StatusConvite IS NULL)) AND (([DataEnvio] = @original_DataEnvio) OR ([DataEnvio] IS NULL AND @original_DataEnvio IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDConvite" Type="Int32" />
                    <asp:Parameter Name="original_IDEvento" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoConvidado" Type="Int32" />
                    <asp:Parameter Name="original_StatusConvite" Type="String" />
                    <asp:Parameter Name="original_DataEnvio" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtEvento" Name="IDEvento" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtAluno" Name="IDAlunoConvidado" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtStatus" Name="StatusConvite" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtData" Name="DataEnvio" PropertyName="Text" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IDEvento" Type="Int32" />
                    <asp:Parameter Name="IDAlunoConvidado" Type="Int32" />
                    <asp:Parameter Name="StatusConvite" Type="String" />
                    <asp:Parameter Name="DataEnvio" Type="DateTime" />
                    <asp:Parameter Name="original_IDConvite" Type="Int32" />
                    <asp:Parameter Name="original_IDEvento" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoConvidado" Type="Int32" />
                    <asp:Parameter Name="original_StatusConvite" Type="String" />
                    <asp:Parameter Name="original_DataEnvio" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDConvite"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDConvite" HeaderText="IDConvite" ReadOnly="True" SortExpression="IDConvite" />
                    <asp:BoundField DataField="IDEvento" HeaderText="IDEvento" SortExpression="IDEvento" />
                    <asp:BoundField DataField="IDAlunoConvidado" HeaderText="IDAlunoConvidado" SortExpression="IDAlunoConvidado" />
                    <asp:BoundField DataField="StatusConvite" HeaderText="StatusConvite" SortExpression="StatusConvite" />
                    <asp:BoundField DataField="DataEnvio" HeaderText="DataEnvio" SortExpression="DataEnvio" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>