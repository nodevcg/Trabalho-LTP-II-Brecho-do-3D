<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Usuario.aspx.vb" Inherits="brecho.Usuario" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Perfil do Usuário - Brechó 3D</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
            color: #374151;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding: 1rem 0;
            border-bottom: 2px solid #e5e7eb;
        }
        
        .header h1 {
            color: #10b981;
            font-size: 2rem;
            margin: 0;
        }
        
        .btn-back {
            background: #6b7280;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: background-color 0.3s ease;
        }
        
        .btn-back:hover {
            background: #4b5563;
        }
        
        .profile-section {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        
        .profile-header {
            display: flex;
            align-items: center;
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .profile-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #10b981, #059669);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .profile-info h2 {
            color: #111827;
            margin: 0 0 0.5rem 0;
            font-size: 1.5rem;
        }
        
        .profile-info p {
            color: #6b7280;
            margin: 0;
            font-size: 1rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #374151;
        }
        
        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #10b981;
        }
        
        .form-group input:disabled {
            background: #f9fafb;
            color: #6b7280;
        }
        
        .btn-primary {
            background: #10b981;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        
        .btn-primary:hover {
            background: #059669;
        }
        
        .btn-secondary {
            background: #6b7280;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            margin-left: 1rem;
            transition: background-color 0.3s ease;
        }
        
        .btn-secondary:hover {
            background: #4b5563;
        }
        
        .section-title {
            color: #10b981;
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #ecfdf5, #d1fae5);
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            border: 1px solid #a7f3d0;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #10b981;
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: #065f46;
            font-weight: 600;
        }
        
        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }
        
        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
        
        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .profile-header {
                flex-direction: column;
                text-align: center;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .btn-secondary {
                margin-left: 0;
                margin-top: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Meu Perfil</h1>
                <asp:Button ID="btnVoltar" runat="server" Text="← Voltar à Loja" CssClass="btn-back" OnClick="btnVoltar_Click" />
            </div>
            
            <!-- Seção de Perfil -->
            <div class="profile-section">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <asp:Label ID="lblIniciais" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="profile-info">
                        <h2><asp:Label ID="lblNomeUsuario" runat="server" Text=""></asp:Label></h2>
                        <p>Membro desde <asp:Label ID="lblDataCadastro" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
                
                <!-- Estatísticas do Usuário -->
                <div class="section-title">
                    <span class="material-icons">analytics</span>
                    Suas Estatísticas
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-number"><asp:Label ID="lblTotalCompras" runat="server" Text="0"></asp:Label></div>
                        <div class="stat-label">Compras Realizadas</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number"><asp:Label ID="lblTotalVendas" runat="server" Text="0"></asp:Label></div>
                        <div class="stat-label">Itens Doados</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number"><asp:Label ID="lblEventosParticipados" runat="server" Text="0"></asp:Label></div>
                        <div class="stat-label">Eventos Participados</div>
                    </div>
                </div>
            </div>
            
            <!-- Seção de Edição de Perfil -->
            <div class="profile-section">
                <div class="section-title">
                    <span class="material-icons">edit</span>
                    Alterar Senha
                </div>
                
                <asp:Panel ID="pnlMensagem" runat="server" Visible="false">
                    <div class="alert" id="alertDiv" runat="server">
                        <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
                
                <div class="form-group">
                    <label>Usuário Atual:</label>
                    <asp:TextBox ID="txtUsuarioAtual" runat="server" Enabled="false"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label>Senha Atual:</label>
                    <asp:TextBox ID="txtSenhaAtual" runat="server" TextMode="Password" placeholder="Digite sua senha atual"></asp:TextBox>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label>Nova Senha:</label>
                        <asp:TextBox ID="txtNovaSenha" runat="server" TextMode="Password" placeholder="Digite a nova senha"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Confirmar Nova Senha:</label>
                        <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" placeholder="Confirme a nova senha"></asp:TextBox>
                    </div>
                </div>
                
                <div>
                    <asp:Button ID="btnSalvarSenha" runat="server" Text="Alterar Senha" CssClass="btn-primary" OnClick="btnSalvarSenha_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn-secondary" OnClick="btnLimpar_Click" />
                </div>
            </div>
            
            <!-- Seção de Histórico -->
            <div class="profile-section">
                <div class="section-title">
                    <span class="material-icons">history</span>
                    Histórico de Transações
                </div>
                
                <asp:GridView ID="gvHistorico" runat="server" AutoGenerateColumns="False" 
                              CssClass="table-history" Width="100%" 
                              EmptyDataText="Nenhuma transação encontrada.">
                    <Columns>
                        <asp:BoundField DataField="DataTransacao" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="NomeItem" HeaderText="Item" />
                        <asp:BoundField DataField="TipoTransacao" HeaderText="Tipo" />
                        <asp:BoundField DataField="Preco" HeaderText="Valor" DataFormatString="R$ {0:N2}" />
                    </Columns>
                    <HeaderStyle BackColor="#10b981" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#f9fafb" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>