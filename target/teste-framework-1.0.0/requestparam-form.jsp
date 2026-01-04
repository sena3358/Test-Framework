<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test @RequestParam</title>
    <style>
        body { font-family: Arial; max-width: 800px; margin: 50px auto; padding: 20px; }
        form { background: #f5f5f5; padding: 20px; border-radius: 5px; margin: 20px 0; }
        input { margin: 10px 0; padding: 8px; width: 200px; }
        button { padding: 10px 20px; background: #3498db; color: white; border: none; cursor: pointer; }
        a { display: block; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>Test @RequestParam</h1>
    
    <h2>Formulaire 1 : Recherche</h2>
    <form action="${pageContext.request.contextPath}/param/search" method="GET">
        <p>Recherche (q): <input type="text" name="q" value="Jean"></p>
        <p>Page: <input type="number" name="page" value="1"></p>
        <button type="submit">Rechercher</button>
    </form>
    
    <h2>Formulaire 2 : Filtre</h2>
    <form action="${pageContext.request.contextPath}/param/filter" method="GET">
        <p>Min: <input type="number" name="min" value="10"></p>
        <p>Max: <input type="number" name="max" value="100"></p>
        <p>Type: <input type="text" name="type" value="active"></p>
        <button type="submit">Filtrer</button>
    </form>
    
    <h2>Liens de test directs :</h2>
    <a href="${pageContext.request.contextPath}/param/search?q=Marie&page=2">Test recherche</a>
    <a href="${pageContext.request.contextPath}/param/user/5?action=edit">Test combinaison URL + param</a>
    <a href="${pageContext.request.contextPath}/param/etudiant/10?var2=bonjour">Test @RequestParam avec {id}</a>
    <a href="${pageContext.request.contextPath}/param/filter?min=1&max=50&type=inactive">Test multiple params</a>
</body>
</html>
