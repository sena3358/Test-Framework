<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
</head>
<body>
    <h1>${title}</h1>
    <ul>
        <c:forEach var="emp" items="${employees}">
            <li>${emp.name} ${emp.surname} - ${emp.position} - ${emp.salary}</li>
        </c:forEach>
    </ul>
</body>
</html>