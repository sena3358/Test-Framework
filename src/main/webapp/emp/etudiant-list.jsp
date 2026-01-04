<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
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
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${title}</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="etudiant" items="${etudiants}">
                    <tr>
                        <td>${etudiant.name}</td>
                        <td>${etudiant.surname}</td>
                        <td>${etudiant.position}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <p><a href="${pageContext.request.contextPath}/etudiant/1">Voir étudiant ID 1</a></p>
    </div>
</body>
</html>
