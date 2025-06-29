<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EnviarItem.aspx.vb" Inherits="brecho.EnviarItem" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Brechó - Enviar Item</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <style>
        body {
            background: #f9fafb;
            color: #374151;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .back-btn {
            background: #10b981;
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

            .back-btn:hover {
                background: #059669;
            }

        main {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .form-container {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .form-title {
            font-size: 2rem;
            font-weight: 700;
            color: #111827;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #374151;
        }

        .form-input, .form-select, .form-textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }

            .form-input:focus, .form-select:focus, .form-textarea:focus {
                outline: none;
                border-color: #10b981;
                box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
            }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        .file-input-container {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .file-input {
            width: 100%;
            padding: 0.75rem;
            border: 2px dashed #d1d5db;
            border-radius: 8px;
            background: #f9fafb;
            cursor: pointer;
            text-align: center;
            transition: border-color 0.3s ease;
        }

            .file-input:hover {
                border-color: #10b981;
            }

            .file-input input[type="file"] {
                position: absolute;
                opacity: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
            }

        .btn-submit {
            background: #10b981;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            width: 100%;
            transition: background-color 0.3s ease;
        }

            .btn-submit:hover {
                background: #059669;
            }

            .btn-submit:disabled {
                background: #9ca3af;
                cursor: not-allowed;
            }

        .message {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 600;
        }

            .message.success {
                background: #ecfdf5;
                color: #065f46;
                border: 1px solid #10b981;
            }

            .message.error {
                background: #fef2f2;
                color: #991b1b;
                border: 1px solid #ef4444;
            }

        .required {
            color: #ef4444;
        }

        @media (max-width: 768px) {
            main {
                margin: 1rem auto;
                padding: 0 1rem;
            }

            .form-container {
                padding: 1.5rem;
            }

            header {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <a href="Default.aspx">
                    <img src="image-removebg-preview (2).png" alt="Logo 3D Brechó" style="height: 159px; width: 160px" /><br />
                    Clique para retornar para a página principal.</a>
            </div>
        </header>

        <main>
            <div class="form-container">
                <h1 class="form-title">Enviar Item para o Brechó</h1>

                <asp:Panel ID="pnlMensagem" runat="server" Visible="false">
                    <div class="message" id="messageDiv" runat="server">
                        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
                    </div>
                </asp:Panel>

                <div class="form-group">
                    <label class="form-label" for="txtNome">Nome do Item <span class="required">*</span></label>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-input" placeholder="Ex: Camiseta Nike, Calça Jeans..." MaxLength="100" required></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="ddlCategoria">Categoria <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" required>
                        <asp:ListItem Value="">Selecione uma categoria</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtDescricao">Descrição</label>
                    <asp:TextBox ID="txtDescricao" runat="server" TextMode="MultiLine" CssClass="form-textarea"
                        placeholder="Descreva o item, sua cor, tamanho, marca, etc..." MaxLength="255"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="ddlEstado">Estado de Conservação <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select" required>
                        <asp:ListItem Value="">Selecione o estado</asp:ListItem>
                        <asp:ListItem Value="Novo">Novo</asp:ListItem>
                        <asp:ListItem Value="Seminovo">Seminovo</asp:ListItem>
                        <asp:ListItem Value="Usado">Usado</asp:ListItem>
                        <asp:ListItem Value="Bem Usado">Bem Usado</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtPreco">Preço Sugerido (R$) <span class="required">*</span></label>
                    <asp:TextBox ID="txtPreco" runat="server" CssClass="form-input" placeholder="0.00" TextMode="Number"
                        step="0.01" min="0" required></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Foto do Item</label>
                    <div class="file-input-container">
                        <div class="file-input">
                            <asp:FileUpload ID="fuFoto" runat="server" accept="image/*" />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:trabalho_ltp_raluca %>"
                                InsertCommand="INSERT INTO Itens (NomeItem, Descricao, EstadoConservacao, IDCategoria, DataCadastro, FotoItem, Preco) VALUES (@NomeItem, @Descricao, @EstadoConservacao, @IDCategoria, GETDATE(), @FotoItem, @Preco)">
                                <InsertParameters>
                                    <asp:Parameter Name="NomeItem" Type="String" />
                                    <asp:Parameter Name="Descricao" Type="String" />
                                    <asp:Parameter Name="EstadoConservacao" Type="String" />
                                    <asp:Parameter Name="IDCategoria" Type="Int32" />
                                    <asp:Parameter Name="FotoItem" Type="String" />
                                    <asp:Parameter Name="Preco" Type="Decimal" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <p>Clique para selecionar uma foto ou arraste aqui</p>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar Item" CssClass="btn-submit" OnClick="btnEnviar_Click" />
                </div>
            </div>
        </main>
    </form>
</body>
</html>
