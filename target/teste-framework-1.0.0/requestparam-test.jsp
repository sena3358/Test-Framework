<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test @RequestParam</title>
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
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        .param-box {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            margin: 15px 0;
        }
        .label {
            font-weight: bold;
            color: #2c3e50;
        }
        .value {
            color: #e74c3c;
            font-size: 20px;
            font-weight: bold;
        }
        .code {
            background: #2c3e50;
            color: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            font-family: monospace;
            margin: 20px 0;
        }
        a {
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>✓ ${message}</h1>
        
        <h2>Paramètres reçus :</h2>
        
        <div class="param-box">
            <span class="label">ID (depuis URL {id}) :</span>
            <span class="value">${id}</span>
        </div>
        
        <div class="param-box">
            <span class="label">actionType (depuis @RequestParam("action")) :</span>
            <span class="value">${actionType}</span>
        </div>
        
        <div class="code">
            @HandleUrl("/user/{id}")<br>
            public ModelView test(@RequestParam("action") String actionType, int id) {<br>
            &nbsp;&nbsp;// actionType = valeur du paramètre "action"<br>
            &nbsp;&nbsp;// id = valeur de {id} dans l'URL<br>
            }
        </div>
        
        <h3>Explications :</h3>
        <ul>
            <li><strong>id</strong> : Extrait de l'URL <code>/user/{id}</code></li>
            <li><strong>actionType</strong> : Nom de variable différent, mais @RequestParam("action") indique de chercher le paramètre "action"</li>
        </ul>
        
        <hr>
        
        <h3>Autres tests :</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/param/user/1?action=view">ID=1, action=view</a></li>
            <li><a href="${pageContext.request.contextPath}/param/user/42?action=delete">ID=42, action=delete</a></li>
            <li><a href="${pageContext.request.contextPath}/param/form">← Retour au formulaire</a></li>
        </ul>
    </div>
</body>
</html>
