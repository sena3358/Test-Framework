<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultat Formulaire</title>
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
            color: #27ae60;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        .value {
            font-weight: bold;
            color: #2c3e50;
        }
        .null {
            color: #95a5a6;
            font-style: italic;
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
        <h1>✓ Formulaire traité avec succès !</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Paramètre</th>
                    <th>Valeur</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Nom</td>
                    <td class="<%= request.getAttribute("name") != null ? "value" : "null" %>">
                        <%= request.getAttribute("name") != null ? request.getAttribute("name") : "null" %>
                    </td>
                </tr>
                <tr>
                    <td>Âge</td>
                    <td class="<%= request.getAttribute("age") != null ? "value" : "null" %>">
                        <%= request.getAttribute("age") != null ? request.getAttribute("age") : "null" %>
                    </td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td class="<%= request.getAttribute("ville") != null ? "value" : "null" %>">
                        <%= request.getAttribute("ville") != null ? request.getAttribute("ville") : "null" %>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <a href="${pageContext.request.contextPath}/test/formulaire">← Retour au formulaire</a>
    </div>
</body>
</html>
