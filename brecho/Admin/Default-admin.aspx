<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default-admin.aspx.vb" Inherits="brecho.Default_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <title>Administração</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 90vh;
            text-align: center;
            background-image: linear-gradient(90deg, #10B981 50%, #8FBF4D);
        }
        form {
            border: 3px solid white;
            border-radius: 30px;
            padding: 30px;
            backdrop-filter: brightness(80%);
            backdrop-filter: hue-rotate(0deg);
            transition: backdrop-filter 0.5s ease;
        }

        form:hover{
            animation: girarcores 3s linear infinite;
        }

        @keyframes girarcores {
            0% {
                backdrop-filter: hue-rotate(0deg);
            }
            100% {
                backdrop-filter: hue-rotate(360deg);
            }
        }

        .Link {
            color: #FFF
        }

        .VPI {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Página de administração</h1><br />
            <p>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadaluno.aspx">Tabela dos Alunos</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadcategoria.aspx">Tabela das Categorias</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadconvite.aspx">Tabela dos Convites do Evento</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadevento.aspx">Tabela dos Eventos</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="Link" PostBackUrl="~/Admin/caditem.aspx">Tabela dos Itens</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadtransacao.aspx">Tabela das Transações</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton7" runat="server" CssClass="Link" PostBackUrl="~/Admin/cadusuario.aspx">Tabela dos Usuarios</asp:LinkButton><br /><br />
                <asp:LinkButton ID="LinkButton8" runat="server" CssClass="Link VPI" PostBackUrl="~/Site/Default.aspx">Voltar para a página inicial</asp:LinkButton><br />
            </p>
    </form>
</body>
</html>
