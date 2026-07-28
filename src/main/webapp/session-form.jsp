<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Session Demo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 24px;
            background: linear-gradient(180deg, #f7f9fc 0%, #eef3f9 100%);
            color: #1f2937;
        }
        .card {
            background: #fff;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
            margin-bottom: 20px;
        }
        h1, h2 {
            margin-top: 0;
        }
        .meta {
            display: grid;
            gap: 8px;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            margin: 16px 0 24px;
        }
        .pill {
            padding: 12px 14px;
            border-radius: 12px;
            background: #f3f4f6;
            border: 1px solid #e5e7eb;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid #cbd5e1;
            box-sizing: border-box;
            margin-bottom: 14px;
        }
        .actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }
        .btn {
            display: inline-block;
            border: 0;
            border-radius: 10px;
            padding: 12px 18px;
            text-decoration: none;
            cursor: pointer;
            font-weight: 700;
        }
        .btn-primary { background: #0f766e; color: #fff; }
        .btn-secondary { background: #1d4ed8; color: #fff; }
        .btn-danger { background: #b91c1c; color: #fff; }
        .hint {
            background: #ecfeff;
            border-left: 4px solid #06b6d4;
            padding: 14px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        code {
            background: #eef2ff;
            padding: 2px 6px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
    Object currentUser = request.getAttribute("currentUser");
    Object visitCount = request.getAttribute("visitCount");
%>

<div class="card">
    <h1>Demo Session</h1>
    <p>Cette page montre l'injection de <code>@Session</code> et la lecture des attributs dans la vue JSP.</p>

    <% if (message != null) { %>
        <div class="hint"><strong><%= message %></strong></div>
    <% } %>

    <div class="meta">
        <div class="pill">
            <strong>Session userName</strong><br>
            <%= currentUser != null ? currentUser : "(vide)" %>
        </div>
        <div class="pill">
            <strong>Session visitCount</strong><br>
            <%= visitCount != null ? visitCount : "0" %>
        </div>
        <div class="pill">
            <strong>Lecture vue</strong><br>
            via l'objet JSP <code>session</code>
        </div>
    </div>
</div>

<div class="card">
    <h2>Connexion de test</h2>
    <form method="post" action="<%= request.getContextPath() %>/session/login">
        <label for="userName">Nom utilisateur</label>
        <input type="text" id="userName" name="userName" value="Alice" required>
        <div class="actions">
            <button class="btn btn-primary" type="submit">Enregistrer en session</button>
            <a class="btn btn-secondary" href="<%= request.getContextPath() %>/session/profile">Voir le profil</a>
        </div>
    </form>
</div>

<div class="card">
    <h2>Tests</h2>
    <div class="actions">
        <form method="post" action="<%= request.getContextPath() %>/session/logout">
            <button class="btn btn-danger" type="submit">Vider la session</button>
        </form>
        <a class="btn btn-secondary" href="<%= request.getContextPath() %>/session">Recharger</a>
    </div>
</div>
</body>
</html>
