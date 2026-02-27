<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Upload de Fichiers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .test-section {
            border: 1px solid #ddd;
            padding: 20px;
            margin: 20px 0;
            border-radius: 5px;
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        h3 {
            color: #555;
        }
        input[type="file"] {
            margin: 10px 0;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .info {
            background-color: #e7f3ff;
            padding: 10px;
            border-left: 4px solid #007bff;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <h1>Test Upload de Fichiers avec Extension Préservée</h1>
    <div class="info">
        <strong>Note:</strong> Les fichiers uploadés utilisent une clé composite "fieldName:originalFileName"<br>
        pour préserver le nom original et l'extension du fichier.
    </div>

    <!-- Test 1: Upload Simple -->
    <div class="test-section">
        <h3>Test 1: Upload Simple</h3>
        <p>Upload un ou plusieurs fichiers et affiche leurs informations (nom, extension, taille).</p>
        <form action="${pageContext.request.contextPath}/upload/simple" method="POST" enctype="multipart/form-data">
            <label>Photo:</label>
            <input type="file" name="photo" accept="image/*"><br>
            
            <label>Document:</label>
            <input type="file" name="document" accept=".pdf,.doc,.docx"><br>
            
            <button type="submit">Upload Simple</button>
        </form>
    </div>

    <!-- Test 2: Upload et Sauvegarde -->
    <div class="test-section">
        <h3>Test 2: Upload et Sauvegarde sur Disque</h3>
        <p>Upload et sauvegarde les fichiers dans ~/uploads/ avec leur nom et extension originaux.</p>
        <form action="${pageContext.request.contextPath}/upload/save" method="POST" enctype="multipart/form-data">
            <label>Fichiers (multiples):</label>
            <input type="file" name="files" multiple><br>
            
            <button type="submit">Upload et Sauvegarder</button>
        </form>
    </div>
</body>
</html>
