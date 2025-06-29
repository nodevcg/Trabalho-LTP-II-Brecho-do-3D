<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="brecho._Default" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Brechó - Home</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../CSS/fonte.css" />
    <style>
        body {
            background: #fff;
            color: #374151;
            margin: 0; 
            padding: 0;
            overflow-x: hidden;
        }
        header {
            position: sticky;
            top: 0;
            background: #f9fafb;
            border-bottom: 1px solid #e5e7eb;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            gap: 1rem;
            min-height: 50px;
            box-sizing: border-box;
        }
        .logo {
            font-size: 1.75rem;
            font-weight: 700;
            color: #10b981;
            user-select: none;
            display: flex;
            align-items: center;
            gap: 8px;
            height: 50px;
            flex-shrink: 0;
        }
        .logo img {
            max-width: 200px;
            height: auto;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            color: #374151;
            font-weight: 600;
        }
        .user-greeting {
            color: #10b981;
        }
        nav {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex-shrink: 0;
        }
        nav a, .nav-link {
            color: #374151;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            white-space: nowrap;
            background: none;
            border: none;
            padding: 0;
        }
        nav a:hover, .nav-link:hover {
            color: #059669;
        }
        .cart-icon {
            position: relative;
            cursor: pointer;
            color: #374151;
            font-size: 1.5rem;
        }
        .cart-icon:hover {
            color: #059669;
        }
        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background: #ef4444;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        .searchbar {
            flex: 1;
            max-width: 400px;
            min-width: 200px;
            position: relative;
            margin: 0 auto;
            display: flex;
            justify-content: center;
        }
        .searchbar input[type="text"] {
            width: 100%;
            padding: 0.5rem 2.5rem 0.5rem 1rem;
            border: 1.5px solid #d1d5db;
            border-radius: 9999px;
            font-size: 1rem;
            outline-offset: 2px;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }
        .searchbar input[type="text"]:focus {
            border-color: #10b981;
        }
        .searchbar .material-icons {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
            cursor: pointer;
            user-select: none;
        }
        
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 600px;
            max-height: 80vh;
            overflow-y: auto;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover {
            color: #000;
        }
        .cart-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid #e5e7eb;
            gap: 1rem;
        }
        .cart-item img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }
        .cart-item-info {
            flex: 1;
        }
        .cart-item-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .cart-item-price {
            color: #10b981;
            font-weight: 700;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }
        .quantity-btn {
            background: #10b981;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            font-weight: bold;
        }
        .quantity-btn:hover {
            background: #059669;
        }
        .quantity-display {
            padding: 0.25rem 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            min-width: 40px;
            text-align: center;
        }
        .remove-item {
            background: #ef4444;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
        .remove-item:hover {
            background: #dc2626;
        }
        .cart-total {
            text-align: right;
            font-size: 1.25rem;
            font-weight: 700;
            color: #10b981;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px solid #e5e7eb;
        }
        .empty-cart {
            text-align: center;
            padding: 2rem;
            color: #6b7280;
        }
        
        @media (max-width: 968px) {
            header {
                flex-wrap: wrap;
                padding: 0.5rem;
            }
            .logo img {
                max-width: 150px;
            }
            .searchbar {
                order: 3;
                flex: 1 1 100%;
                margin: 0.5rem 0 0 0;
                max-width: none;
            }
            .user-info {
                order: 1;
                font-size: 0.9rem;
            }
            nav {
                order: 2;
            }
        }
        
        @media (max-width: 480px) {
            .logo img {
                max-width: 120px;
            }
            nav a {
                font-size: 0.9rem;
            }
            .user-info {
                font-size: 0.8rem;
            }
        }
        
        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .categories {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            justify-content: flex-end;
            width: 100%;
        }
        .category-card {
            background: #ecfdf5;
            color: #065f46;
            padding: 1rem 1.5rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(16, 185, 129, 0.2);
            font-weight: 600;
            cursor: pointer;
            user-select: none;
            flex: 1 0 140px;
            text-align: center;
            transition: background-color 0.3s ease;
            border: none;
        }
        .category-card:hover {
            background: #10b981;
            color: white;
        }
        .category-card.selected {
            background: #10b981;
            color: white;
        }
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 2rem;
            justify-content: center;
            width: 100%;
        }
        .product-card {
            background: #ffffff;
            border: 1px solid #d1d5db;
            border-radius: 1rem;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
        }
        .product-card:hover {
            box-shadow: 0 5px 20px rgba(16, 185, 129, 0.3);
        }
        .product-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-bottom: 1px solid #e5e7eb;
        }
        .product-info {
            padding: 1rem 1rem 1.5rem;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .product-title {
            font-size: 1.125rem;
            font-weight: 700;
            color: #111827;
            margin-bottom: 0.5rem;
            user-select: none;
        }
        .product-category {
            font-size: 0.875rem;
            color: #6b7280;
            margin-bottom: 1rem;
        }
        .product-price {
            font-weight: 700;
            color: #10b981;
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }
        .btn-add-to-cart {
            background: #10b981;
            color: white;
            padding: 0.55rem 1rem;
            border: none;
            border-radius: 9999px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
            align-self: start;
        }
        .btn-add-to-cart:hover {
            background: #059669;
        }

        .product-image {
            width: 100%;
            height: 200px;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .product-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .searchbar-input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <img src="image-removebg-preview (2).png" alt="Logo 3D Brechó"/>
            </div>
            <div class="user-info">
                <span class="user-greeting">Olá, <asp:Label ID="lblUsuarioLogado" runat="server" Text=""></asp:Label>!</span>
            </div>
            <div class="searchbar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="searchbar-input" placeholder="Buscar roupas usadas..." AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" />
                <span class="material-icons" onclick="document.getElementById('<%= txtSearch.ClientID %>').focus();">search</span>
            </div>
            <nav>
                <asp:Button ID="btnEnviarItem" runat="server" Text="Enviar Item" CssClass="nav-link" OnClick="btnEnviarItem_Click" />
                <asp:Button ID="btnUsuario" runat="server" Text="Perfil" CssClass="nav-link" OnClick="btnUsuario_Click" />
                <div class="cart-icon" onclick="openCartModal()">
                    <span class="material-icons">shopping_cart</span>
                    <span class="cart-count" id="cartCount">0</span>
                </div>
                <asp:Button ID="btnLogout" runat="server" Text="Sair" CssClass="nav-link" OnClick="btnLogout_Click" />
            </nav>
        </header>

        <main>
            <section>
                <div class="categories">
                    <asp:Button ID="btnTodos" runat="server" Text="Todos" CssClass="category-card selected" CommandArgument="0" OnClick="FilterCategory_Click" />
                    <asp:Repeater ID="rptCategorias" runat="server">
                        <ItemTemplate>
                            <asp:Button ID="btnCategoria" runat="server" 
                                Text='<%# Eval("NomeCategoria") %>' 
                                CssClass="category-card" 
                                CommandArgument='<%# Eval("IDCategoria") %>' 
                                OnClick="FilterCategory_Click" 
                                ToolTip='<%# Eval("DescricaoCategoria") %>' />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="products">
                    <asp:Repeater ID="rptProdutos" runat="server">
                        <ItemTemplate>
                            <div class="product-card">
                                <div class="product-image">
                                    <img src='<%# "../" + Eval("FotoItem") %>' alt='<%# Eval("NomeItem") %>' class="product-img" />
                                </div>
                                <div class="product-info">
                                    <div class="product-title"><%# Eval("NomeItem") %></div>
                                    <div class="product-category"><%# Eval("NomeCategoria") %></div>
                                    <div class="product-price">R$ <%# String.Format("{0:N2}", Eval("Preco")) %></div>
                                    <button type="button" class="btn-add-to-cart" 
                                        onclick="addToCart('<%# Eval("IDItem") %>', '<%# Eval("NomeItem") %>', '<%# Eval("Preco") %>', '<%# "../" + Eval("FotoItem") %>')">
                                        Adicionar ao Carrinho
                                    </button>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <asp:Label ID="lblMensagem" runat="server" Text="" Visible="false" 
                           style="text-align: center; margin-top: 2rem; font-size: 1.1rem; color: #6b7280;"></asp:Label>
            </section>
        </main>

        <!-- Modal do Carrinho -->
        <div id="cartModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeCartModal()">&times;</span>
                <h2>Meu Carrinho</h2>
                <div id="cartItems">
                    <div class="empty-cart">
                        <p>Seu carrinho está vazio</p>
                    </div>
                </div>
                <div id="cartTotal" class="cart-total" style="display: none;">
                    Total: R$ <span id="totalValue">0,00</span>
                </div>
            </div>
        </div>
    </form>

    <script>
        let cart = [];
        let cartCount = 0;

        function addToCart(id, name, price, image) {
            const existingItem = cart.find(item => item.id === id);

            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({
                    id: id,
                    name: name,
                    price: parseFloat(price),
                    image: image,
                    quantity: 1
                });
            }

            updateCartDisplay();
            updateCartCount();
        }

        function removeFromCart(id) {
            cart = cart.filter(item => item.id !== id);
            updateCartDisplay();
            updateCartCount();
        }

        function updateQuantity(id, change) {
            const item = cart.find(item => item.id === id);
            if (item) {
                item.quantity += change;
                if (item.quantity <= 0) {
                    removeFromCart(id);
                } else {
                    updateCartDisplay();
                    updateCartCount();
                }
            }
        }

        function updateCartCount() {
            cartCount = cart.reduce((total, item) => total + item.quantity, 0);
            document.getElementById('cartCount').textContent = cartCount;

            if (cartCount === 0) {
                document.getElementById('cartCount').style.display = 'none';
            } else {
                document.getElementById('cartCount').style.display = 'flex';
            }
        }

        function updateCartDisplay() {
            const cartItemsDiv = document.getElementById('cartItems');
            const cartTotalDiv = document.getElementById('cartTotal');

            if (cart.length === 0) {
                cartItemsDiv.innerHTML = '<div class="empty-cart"><p>Seu carrinho está vazio</p></div>';
                cartTotalDiv.style.display = 'none';
            } else {
                let itemsHtml = '';
                let total = 0;

                cart.forEach(item => {
                    const itemTotal = item.price * item.quantity;
                    total += itemTotal;

                    itemsHtml += `
                        <div class="cart-item">
                            <img src="${item.image}" alt="${item.name}" />
                            <div class="cart-item-info">
                                <div class="cart-item-title">${item.name}</div>
                                <div class="cart-item-price">R$ ${item.price.toFixed(2)}</div>
                                <div class="quantity-controls">
                                    <button class="quantity-btn" onclick="updateQuantity('${item.id}', -1)">-</button>
                                    <span class="quantity-display">${item.quantity}</span>
                                    <button class="quantity-btn" onclick="updateQuantity('${item.id}', 1)">+</button>
                                </div>
                            </div>
                            <button class="remove-item" onclick="removeFromCart('${item.id}')">Remover</button>
                        </div>
                    `;
                });

                cartItemsDiv.innerHTML = itemsHtml;
                document.getElementById('totalValue').textContent = total.toFixed(2);
                cartTotalDiv.style.display = 'block';
            }
        }

        function openCartModal() {
            document.getElementById('cartModal').style.display = 'block';
            updateCartDisplay();
        }

        function closeCartModal() {
            document.getElementById('cartModal').style.display = 'none';
        }

        window.onclick = function (event) {
            const modal = document.getElementById('cartModal');

            if (event.target === modal) {
                closeCartModal();
            }
        }

        updateCartCount();
    </script>
</body>
</html>