<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mg.teste.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail - Vue JSP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #1e3c72;
            border-bottom: 3px solid #2a5298;
            padding-bottom: 10px;
        }
        .badge {
            background-color: #ff9800;
            color: white;
            padding: 5px 15px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 20px;
        }
        .info {
            margin: 15px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-left: 4px solid #2a5298;
        }
        .info p {
            margin: 8px 0;
        }
        .info strong {
            color: #1e3c72;
            display: inline-block;
            width: 120px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📦 Product Detail</h1>
        <div class="badge">Vue JSP (sans @Json)</div>
        
        <% 
            Product product = (Product) request.getAttribute("product");
            if (product != null) {
        %>
        
        <div class="info">
            <p><strong>ID:</strong> <%= product.getId() %></p>
            <p><strong>Nom:</strong> <%= product.getName() %></p>
            <p><strong>Prix:</strong> <%= product.getPrice() %> €</p>
            <p><strong>Catégorie:</strong> <%= product.getCategory() %></p>
        </div>
        
        <p style="margin-top: 30px; color: #666;">
            ℹ️ Cette page est rendue via <strong>ModelView</strong> car la méthode du controller 
            n'a pas l'annotation <code>@Json</code>.
        </p>
        
        <% } else { %>
        <p style="color: red;">Aucun produit trouvé.</p>
        <% } %>
    </div>
</body>
</html>
