<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat du Formulaire</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 30px auto;
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
            color: #333;
            border-bottom: 3px solid #49cc90;
            padding-bottom: 10px;
        }
        .method-info {
            background-color: #e8f5e9;
            padding: 15px;
            border-left: 4px solid #49cc90;
            margin: 20px 0;
            font-weight: bold;
            color: #2e7d32;
        }
        .data-box {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin: 15px 0;
        }
        .data-box p {
            margin: 8px 0;
        }
        .data-box strong {
            color: #555;
            display: inline-block;
            width: 150px;
        }
        .all-data {
            background-color: #fff3e0;
            padding: 15px;
            border-left: 4px solid #ff9800;
            margin: 20px 0;
        }
        .all-data h3 {
            margin-top: 0;
            color: #e65100;
        }
        .param {
            background-color: white;
            padding: 8px;
            margin: 5px 0;
            border-radius: 3px;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2196f3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .back-link:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Données Reçues</h1>
        
        <div class="method-info">
            Méthode utilisée : ${method}
        </div>
        
        <div class="data-box">
            <h3>Données principales :</h3>
            
            <% if (request.getAttribute("userId") != null) { %>
                <p><strong>User ID:</strong> ${userId}</p>
            <% } %>
            
            <% if (request.getAttribute("name") != null) { %>
                <p><strong>Nom:</strong> ${name}</p>
            <% } %>
            
            <% if (request.getAttribute("email") != null) { %>
                <p><strong>Email:</strong> ${email}</p>
            <% } %>
            
            <% if (request.getAttribute("age") != null) { %>
                <p><strong>Âge:</strong> ${age}</p>
            <% } %>
        </div>
        
        <% 
            Map<String, Object> allData = (Map<String, Object>) request.getAttribute("allData");
            if (allData != null && !allData.isEmpty()) { 
        %>
        <div class="all-data">
            <h3>Tous les paramètres dans la Map :</h3>
            <% 
                for (Map.Entry<String, Object> entry : allData.entrySet()) {
            %>
                <div class="param">
                    <strong><%= entry.getKey() %></strong> = <%= entry.getValue() %>
                </div>
            <% 
                }
            %>
            <p style="margin-top: 15px; color: #666; font-size: 14px;">
                <em>Total : <%= allData.size() %> paramètre(s)</em>
            </p>
        </div>
        <% } %>
        
        <a href="${pageContext.request.contextPath}/api/test" class="back-link">Retour au formulaire</a>
    </div>
</body>
</html>
