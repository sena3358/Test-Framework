<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Paramètres</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        .param-box {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
        }
        .param-label {
            font-weight: bold;
            color: #34495e;
        }
        .param-value {
            color: #e74c3c;
            font-size: 18px;
            font-weight: bold;
        }
        .null-value {
            color: #95a5a6;
            font-style: italic;
        }
        .success {
            color: #27ae60;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="success">✓ ${message}</h1>
        
        <h2>Paramètres reçus :</h2>
        
        <div class="param-box">
            <span class="param-label">ID (depuis URL {id}) :</span>
            <span class="param-value">${id}</span>
        </div>
        
        <div class="param-box">
            <span class="param-label">var2 (depuis request.getParameter) :</span>
            <% if (request.getAttribute("var2") != null) { %>
                <span class="param-value">${var2}</span>
            <% } else { %>
                <span class="null-value">null (paramètre non fourni)</span>
            <% } %>
        </div>
        
        <div class="param-box">
            <span class="param-label">var3 (depuis request.getParameter) :</span>
            <% if (request.getAttribute("var3") != null) { %>
                <span class="param-value">${var3}</span>
            <% } else { %>
                <span class="null-value">null (paramètre non fourni)</span>
            <% } %>
        </div>
        
        <hr>
        
        <h3>Tester d'autres combinaisons :</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/test/etudiant/1">Sans paramètres HTTP</a></li>
            <li><a href="${pageContext.request.contextPath}/test/etudiant/2?var2=bonjour">Avec var2 seulement</a></li>
            <li><a href="${pageContext.request.contextPath}/test/etudiant/3?var3=monde">Avec var3 seulement</a></li>
            <li><a href="${pageContext.request.contextPath}/test/etudiant/4?var2=hello&var3=world">Avec var2 et var3</a></li>
            <li><a href="${pageContext.request.contextPath}/test/formulaire">Retour au formulaire</a></li>
        </ul>
    </div>
</body>
</html>
