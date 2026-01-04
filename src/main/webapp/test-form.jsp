<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulaire de test</title>
</head>
<body>
    <h1>Formulaire de test</h1>
    <form action="${pageContext.request.contextPath}/test/form" method="GET">
        <p>Nom: <input type="text" name="name" value="Marie"></p>
        <p>Âge: <input type="number" name="age" value="25"></p>
        <p>Ville: <input type="text" name="ville" value="Antananarivo"></p>
        <button type="submit">Envoyer</button>
    </form>
    <hr>
    <h2>Liens de test directs:</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/test/user/5">Paramètre URL: /test/user/5</a></li>
        <li><a href="${pageContext.request.contextPath}/test/search?name=Jean">Paramètre HTTP: /test/search?name=Jean</a></li>
        <li><a href="${pageContext.request.contextPath}/test/etudiant/10?var2=hello&var3=world">Combiné: /test/etudiant/10?var2=hello&var3=world</a></li>
    </ul>
</body>
</html>
