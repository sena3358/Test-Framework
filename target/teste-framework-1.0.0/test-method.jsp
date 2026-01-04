<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test GET vs POST</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Test GET vs POST sur même URL</h1>

    <div style="margin: 20px; padding: 20px; border: 2px solid #4CAF50; background-color: #f0f0f0;">
        <h2>Test 1: GET - Consulter les users</h2>
        <p>Cliquez sur ce lien pour effectuer une requête GET sur /api/users</p>
        <a href="${pageContext.request.contextPath}/api/users" style="padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px;">
            Voir les users (GET)
        </a>
    </div>

    <div style="margin: 20px; padding: 20px; border: 2px solid #2196F3; background-color: #f0f0f0;">
        <h2>Test 2: POST - Créer une user</h2>
        <p>Soumettez ce formulaire pour effectuer une requête POST sur /api/users</p>
        <form action="${pageContext.request.contextPath}/api/users" method="post">
            <label for="name">Nom:</label><br>
            <input type="text" id="name" name="name" value="John Doe" style="padding: 5px; margin: 5px 0;"><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="john.doe@example.com" style="padding: 5px; margin: 5px 0;"><br><br>

            <button type="submit" style="padding: 10px 20px; background-color: #2196F3; color: white; border: none; border-radius: 5px; cursor: pointer;">
                Créer l'utilisateur (POST)
            </button>
        </form>
    </div>
</body>
</html>