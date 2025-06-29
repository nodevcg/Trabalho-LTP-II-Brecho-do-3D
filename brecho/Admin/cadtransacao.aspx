<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cadtransacao.aspx.vb" Inherits="brecho.cadtransacao" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Transação</title>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/cssadm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/Default-admin.aspx" ForeColor="#10B981"><h1>Voltar para a página principal</h1></asp:LinkButton>
        <div>
            <table>
                <tr>
                    <td class="auto-style1">IDTransacao</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn-azul" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Item</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtItem" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Aluno Doador</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDoador" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">ID Aluno Receptor</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtReceptor" runat="server" CssClass="form-input" Width="96px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Data Transação</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtData" runat="server" CssClass="form-input" Width="102%" TextMode="Date"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Tipo Transação</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTipo" runat="server" CssClass="form-input" Width="102%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca%>"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Transacoes]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Transacoes] WHERE [IDTransacao] = @original_IDTransacao AND (([IDItem] = @original_IDItem) OR ([IDItem] IS NULL AND @original_IDItem IS NULL)) AND (([IDAlunoDoador] = @original_IDAlunoDoador) OR ([IDAlunoDoador] IS NULL AND @original_IDAlunoDoador IS NULL)) AND (([IDAlunoReceptor] = @original_IDAlunoReceptor) OR ([IDAlunoReceptor] IS NULL AND @original_IDAlunoReceptor IS NULL)) AND (([DataTransacao] = @original_DataTransacao) OR ([DataTransacao] IS NULL AND @original_DataTransacao IS NULL)) AND (([TipoTransacao] = @original_TipoTransacao) OR ([TipoTransacao] IS NULL AND @original_TipoTransacao IS NULL))"
                InsertCommand="INSERT INTO [Transacoes] ([IDTransacao], [IDItem], [IDAlunoDoador], [IDAlunoReceptor], [DataTransacao], [TipoTransacao]) VALUES (@IDTransacao, @IDItem, @IDAlunoDoador, @IDAlunoReceptor, @DataTransacao, @TipoTransacao)"
                UpdateCommand="UPDATE [Transacoes] SET [IDItem] = @IDItem, [IDAlunoDoador] = @IDAlunoDoador, [IDAlunoReceptor] = @IDAlunoReceptor, [DataTransacao] = @DataTransacao, [TipoTransacao] = @TipoTransacao WHERE [IDTransacao] = @original_IDTransacao AND (([IDItem] = @original_IDItem) OR ([IDItem] IS NULL AND @original_IDItem IS NULL)) AND (([IDAlunoDoador] = @original_IDAlunoDoador) OR ([IDAlunoDoador] IS NULL AND @original_IDAlunoDoador IS NULL)) AND (([IDAlunoReceptor] = @original_IDAlunoReceptor) OR ([IDAlunoReceptor] IS NULL AND @original_IDAlunoReceptor IS NULL)) AND (([DataTransacao] = @original_DataTransacao) OR ([DataTransacao] IS NULL AND @original_DataTransacao IS NULL)) AND (([TipoTransacao] = @original_TipoTransacao) OR ([TipoTransacao] IS NULL AND @original_TipoTransacao IS NULL))">

                <DeleteParameters>
                    <asp:Parameter Name="original_IDTransacao" Type="Int32" />
                    <asp:Parameter Name="original_IDItem" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoDoador" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoReceptor" Type="Int32" />
                    <asp:Parameter Name="original_DataTransacao" Type="DateTime" />
                    <asp:Parameter Name="original_TipoTransacao" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtId" Name="IDTransacao" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtItem" Name="IDItem" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtDoador" Name="IDAlunoDoador" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtReceptor" Name="IDAlunoReceptor" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtData" Name="DataTransacao" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtTipo" Name="TipoTransacao" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IDItem" Type="Int32" />
                    <asp:Parameter Name="IDAlunoDoador" Type="Int32" />
                    <asp:Parameter Name="IDAlunoReceptor" Type="Int32" />
                    <asp:Parameter Name="DataTransacao" Type="DateTime" />
                    <asp:Parameter Name="TipoTransacao" Type="String" />
                    <asp:Parameter Name="original_IDTransacao" Type="Int32" />
                    <asp:Parameter Name="original_IDItem" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoDoador" Type="Int32" />
                    <asp:Parameter Name="original_IDAlunoReceptor" Type="Int32" />
                    <asp:Parameter Name="original_DataTransacao" Type="DateTime" />
                    <asp:Parameter Name="original_TipoTransacao" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AllowPaging="True"
                AutoGenerateColumns="False"
                DataKeyNames="IDTransacao"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDTransacao" HeaderText="IDTransacao" ReadOnly="True" SortExpression="IDTransacao" />
                    <asp:BoundField DataField="IDItem" HeaderText="IDItem" SortExpression="IDItem" />
                    <asp:BoundField DataField="IDAlunoDoador" HeaderText="IDAlunoDoador" SortExpression="IDAlunoDoador" />
                    <asp:BoundField DataField="IDAlunoReceptor" HeaderText="IDAlunoReceptor" SortExpression="IDAlunoReceptor" />
                    <asp:BoundField DataField="DataTransacao" HeaderText="DataTransacao" SortExpression="DataTransacao" />
                    <asp:BoundField DataField="TipoTransacao" HeaderText="TipoTransacao" SortExpression="TipoTransacao" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>