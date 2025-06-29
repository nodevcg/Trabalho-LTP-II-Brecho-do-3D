<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadevento.aspx.vb" Inherits="brecho.cadevento" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Evento</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDEvento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nome Evento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Descrição Evento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-input" Width="148%" Height="56px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Data Evento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtData" runat="server" CssClass="form-input" Width="102%" TextMode="Date"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Local Evento</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtLocal" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca%>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Eventos]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Eventos] WHERE [IDEvento] = @original_IDEvento AND (([NomeEvento] = @original_NomeEvento) OR ([NomeEvento] IS NULL AND @original_NomeEvento IS NULL)) AND (([DescricaoEvento] = @original_DescricaoEvento) OR ([DescricaoEvento] IS NULL AND @original_DescricaoEvento IS NULL)) AND (([DataEvento] = @original_DataEvento) OR ([DataEvento] IS NULL AND @original_DataEvento IS NULL)) AND (([LocalEvento] = @original_LocalEvento) OR ([LocalEvento] IS NULL AND @original_LocalEvento IS NULL))"
                InsertCommand="INSERT INTO [Eventos] ([NomeEvento], [DescricaoEvento], [DataEvento], [LocalEvento]) VALUES (@NomeEvento, @DescricaoEvento, @DataEvento, @LocalEvento)"
                UpdateCommand="UPDATE [Eventos] SET [NomeEvento] = @NomeEvento, [DescricaoEvento] = @DescricaoEvento, [DataEvento] = @DataEvento, [LocalEvento] = @LocalEvento WHERE [IDEvento] = @original_IDEvento AND (([NomeEvento] = @original_NomeEvento) OR ([NomeEvento] IS NULL AND @original_NomeEvento IS NULL)) AND (([DescricaoEvento] = @original_DescricaoEvento) OR ([DescricaoEvento] IS NULL AND @original_DescricaoEvento IS NULL)) AND (([DataEvento] = @original_DataEvento) OR ([DataEvento] IS NULL AND @original_DataEvento IS NULL)) AND (([LocalEvento] = @original_LocalEvento) OR ([LocalEvento] IS NULL AND @original_LocalEvento IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDEvento" Type="Int32" />
                    <asp:Parameter Name="original_NomeEvento" Type="String" />
                    <asp:Parameter Name="original_DescricaoEvento" Type="String" />
                    <asp:Parameter Name="original_DataEvento" Type="DateTime" />
                    <asp:Parameter Name="original_LocalEvento" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtNome" Name="NomeEvento" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDesc" Name="DescricaoEvento" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtData" Name="DataEvento" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtLocal" Name="LocalEvento" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NomeEvento" Type="String" />
                    <asp:Parameter Name="DescricaoEvento" Type="String" />
                    <asp:Parameter Name="DataEvento" Type="DateTime" />
                    <asp:Parameter Name="LocalEvento" Type="String" />
                    <asp:Parameter Name="original_IDEvento" Type="Int32" />
                    <asp:Parameter Name="original_NomeEvento" Type="String" />
                    <asp:Parameter Name="original_DescricaoEvento" Type="String" />
                    <asp:Parameter Name="original_DataEvento" Type="DateTime" />
                    <asp:Parameter Name="original_LocalEvento" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDEvento"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDEvento" HeaderText="IDEvento" ReadOnly="True" SortExpression="IDEvento" />
                    <asp:BoundField DataField="NomeEvento" HeaderText="NomeEvento" SortExpression="NomeEvento" />
                    <asp:BoundField DataField="DescricaoEvento" HeaderText="DescricaoEvento" SortExpression="DescricaoEvento" />
                    <asp:BoundField DataField="DataEvento" HeaderText="DataEvento" SortExpression="DataEvento" />
                    <asp:BoundField DataField="LocalEvento" HeaderText="LocalEvento" SortExpression="LocalEvento" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>