<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profil Session</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 24px;
            background: linear-gradient(180deg, #fff7ed 0%, #fffbeb 100%);
            color: #1f2937;
        }
        .card {
            background: #fff;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
            margin-bottom: 20px;
        }
        .row {
            display: grid;
            gap: 12px;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        }
        .box {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 14px;
            background: #fafafa;
        }
        .label {
            color: #6b7280;
            font-size: 0.9rem;
        }
        .value {
            font-size: 1.1rem;
            font-weight: 700;
            margin-top: 4px;
        }
        .btn {
            display: inline-block;
            border-radius: 10px;
            padding: 12px 18px;
            text-decoration: none;
            cursor: pointer;
            font-weight: 700;
            border: 0;
        }
        .btn-primary { background: #0f766e; color: #fff; }
        .btn-secondary { background: #1d4ed8; color: #fff; }
        code {
            background: #ecfeff;
            padding: 2px 6px;
            border-radius: 6px;
        }
        pre {
            margin: 0;
            padding: 16px;
            background: #f8fafc;
            border-radius: 12px;
            overflow: auto;
        }
    </style>
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
    Object userName = session.getAttribute("userName");
    Object visitCount = session.getAttribute("visitCount");
    Object isLoggedIn = session.getAttribute("isLoggedIn");
%>

<div class="card">
    <h1>Lecture directe des attributs de session</h1>
    <% if (message != null) { %>
        <p><strong><%= message %></strong></p>
    <% } %>
    <p>La JSP lit ici la session HTTP via l'objet implicite <code>session</code>.</p>
</div>

<div class="card">
    <div class="row">
        <div class="box">
            <div class="label">userName</div>
            <div class="value"><%= userName != null ? userName : "(absent)" %></div>
        </div>
        <div class="box">
            <div class="label">visitCount</div>
            <div class="value"><%= visitCount != null ? visitCount : 0 %></div>
        </div>
        <div class="box">
            <div class="label">isLoggedIn</div>
            <div class="value"><%= isLoggedIn != null ? isLoggedIn : false %></div>
        </div>
    </div>
</div>

<div class="card">
    <h2>Snapshot de la session</h2>
    <pre>
userName    = <%= userName %>
visitCount  = <%= visitCount %>
isLoggedIn  = <%= isLoggedIn %>
    </pre>
</div>

<div class="card">
    <a class="btn btn-primary" href="<%= request.getContextPath() %>/session">Retour au formulaire</a>
    <a class="btn btn-secondary" href="<%= request.getContextPath() %>/session/profile">Relire la vue</a>
</div>
</body>
</html>
