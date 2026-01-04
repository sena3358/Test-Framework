<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Détails Étudiant</title>
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
        .info-box {
            background: #ecf0f1;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .param {
            font-size: 24px;
            color: #e74c3c;
            font-weight: bold;
        }
        .success {
            color: #27ae60;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>✓ URL Dynamique fonctionne !</h1>
        
        <div class="info-box">
            <p class="success"><strong>Paramètre extrait avec succès :</strong></p>
            <p>ID = <span class="param">${id}</span></p>
            <p>${message}</p>
        </div>
        
        <hr>
        
        <h3>Tester d'autres URL :</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/etudiant/1">ID = 1</a></li>
            <li><a href="${pageContext.request.contextPath}/etudiant/42">ID = 42</a></li>
            <li><a href="${pageContext.request.contextPath}/etudiant/999">ID = 999</a></li>
            <li><a href="${pageContext.request.contextPath}/etudiant/5/edit">Éditer ID = 5</a></li>
            <li><a href="${pageContext.request.contextPath}/etudiant/nom/Rakoto">Recherche par nom</a></li>
            <li><a href="${pageContext.request.contextPath}/etudiant/list">Liste complète</a></li>
        </ul>
    </div>
</body>
</html>
