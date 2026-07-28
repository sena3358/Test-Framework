<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat Upload</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        .success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .file-info {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
        }
        .file-info h4 {
            margin-top: 0;
            color: #495057;
        }
        .info-item {
            padding: 5px 0;
            border-bottom: 1px solid #e9ecef;
        }
        .info-item:last-child {
            border-bottom: none;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #0056b3;
        }
        pre {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
    </style>
</head>
<body>
    <h1>Résultat de l'Upload</h1>

    <% 
    String message = (String) request.getAttribute("message");
    if (message != null) { 
    %>
        <div class="success">
            <strong>✓ Succès!</strong><br>
            <pre><%= message %></pre>
        </div>
    <% } %>

    <% 
    Map<String, String> fileInfos = (Map<String, String>) request.getAttribute("fileInfos");
    if (fileInfos != null && !fileInfos.isEmpty()) { 
    %>
        <h2>Fichiers Uploadés (avec extension préservée):</h2>
        <% 
        for (Map.Entry<String, String> entry : fileInfos.entrySet()) {
            String fieldName = entry.getKey();
            String info = entry.getValue();
        %>
            <div class="file-info">
                <h4>Champ: <%= fieldName %></h4>
                <div class="info-item">
                    <%= info %>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <p>Aucun fichier uploadé.</p>
    <% } %>

    <a href="${pageContext.request.contextPath}/upload/form">← Retour au formulaire</a>
</body>
</html>
