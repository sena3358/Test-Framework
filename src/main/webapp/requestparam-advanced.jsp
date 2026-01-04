<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test @RequestParam Avancé</title>
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
            margin: 20px 0;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        .value {
            font-weight: bold;
            color: #e74c3c;
            font-size: 18px;
        }
        .code {
            background: #2c3e50;
            color: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            font-family: monospace;
            margin: 20px 0;
            white-space: pre;
        }
        .info {
            background: #d5f4e6;
            padding: 15px;
            border-left: 4px solid #27ae60;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Test @RequestParam Avancé</h1>
        <p>Combinaison de paramètres d'URL et @RequestParam avec le même nom</p>
        
        <table>
            <thead>
                <tr>
                    <th>Variable</th>
                    <th>Source</th>
                    <th>Valeur</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><code>userId</code></td>
                    <td>@RequestParam("id")</td>
                    <td class="value">${userId}</td>
                </tr>
                <tr>
                    <td><code>id</code></td>
                    <td>Paramètre d'URL {id}</td>
                    <td class="value">${id}</td>
                </tr>
                <tr>
                    <td><code>var2</code></td>
                    <td>request.getParameter("var2")</td>
                    <td class="value">
                        <% if (request.getAttribute("var2") != null) { %>
                            ${var2}
                        <% } else { %>
                            <span style="color: #95a5a6; font-style: italic;">null</span>
                        <% } %>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="code">@HandleUrl("/etudiant/{id}")
public ModelView test(@RequestParam("id") int userId, String var2, int id) {
    // userId = récupère {id} grâce à @RequestParam("id")
    // var2 = récupère le paramètre HTTP "var2"
    // id = récupère {id} depuis l'URL
}</div>
        
        <div class="info">
            <strong>Note importante :</strong> userId et id ont tous les deux la même valeur car @RequestParam("id") 
            récupère le paramètre "id" qui provient de {id} dans l'URL. Cela démontre que @RequestParam permet 
            de renommer explicitement les variables.
        </div>
        
        <hr>
        
        <h3>Tester d'autres valeurs :</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/param/etudiant/1?var2=test1">ID=1, var2=test1</a></li>
            <li><a href="${pageContext.request.contextPath}/param/etudiant/99?var2=hello">ID=99, var2=hello</a></li>
            <li><a href="${pageContext.request.contextPath}/param/etudiant/5">ID=5, sans var2</a></li>
            <li><a href="${pageContext.request.contextPath}/param/form">← Retour au formulaire</a></li>
        </ul>
    </div>
</body>
</html>
