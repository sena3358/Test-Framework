<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mg.teste.Employee, mg.teste.Department" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat - Data Binding</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 10px;
        }
        .title {
            text-align: center;
            color: #764ba2;
            font-size: 18px;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .success-badge {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            display: inline-block;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .data-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            border-left: 5px solid #667eea;
        }
        .data-section h3 {
            color: #667eea;
            margin-top: 0;
        }
        .property {
            margin: 10px 0;
            padding: 10px;
            background-color: white;
            border-radius: 4px;
        }
        .property strong {
            color: #555;
            display: inline-block;
            min-width: 150px;
        }
        .property-value {
            color: #764ba2;
            font-weight: bold;
        }
        .nested-object {
            margin-left: 20px;
            padding-left: 15px;
            border-left: 3px solid #38ef7d;
        }
        .array-item {
            background-color: #fff3e0;
            padding: 15px;
            margin: 10px 0;
            border-radius: 6px;
            border-left: 4px solid #ff9800;
        }
        .array-item h4 {
            margin-top: 0;
            color: #e65100;
        }
        .raw-output {
            background-color: #263238;
            color: #aed581;
            padding: 20px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            overflow-x: auto;
            margin: 20px 0;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: transform 0.2s;
        }
        .back-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>✅ Data Binding Réussi !</h1>
        <div class="title">${title}</div>
        
        <div class="success-badge">
            ✨ Objets mappés automatiquement depuis le formulaire
        </div>
        
        <!-- Affichage Employee si présent -->
        <% 
            Employee employee = (Employee) request.getAttribute("employee");
            if (employee != null) { 
        %>
        <div class="data-section">
            <h3>👤 Employee</h3>
            
            <div class="property">
                <strong>Nom:</strong>
                <span class="property-value"><%= employee.getName() %></span>
            </div>
            
            <div class="property">
                <strong>Prénom:</strong>
                <span class="property-value"><%= employee.getSurname() %></span>
            </div>
            
            <div class="property">
                <strong>Poste:</strong>
                <span class="property-value"><%= employee.getPosition() %></span>
            </div>
            
            <div class="property">
                <strong>Salaire:</strong>
                <span class="property-value"><%= employee.getSalary() %> €</span>
            </div>
            
            <!-- Main Department si présent -->
            <% if (employee.getMainDepartment() != null) { %>
            <div class="nested-object">
                <h4>🏢 Département Principal</h4>
                <div class="property">
                    <strong>Nom:</strong>
                    <span class="property-value"><%= employee.getMainDepartment().getName() %></span>
                </div>
                <div class="property">
                    <strong>Localisation:</strong>
                    <span class="property-value"><%= employee.getMainDepartment().getLocation() %></span>
                </div>
                <div class="property">
                    <strong>Budget:</strong>
                    <span class="property-value"><%= employee.getMainDepartment().getBudget() %> €</span>
                </div>
            </div>
            <% } %>
            
            <!-- Departments array si présent -->
            <% 
                Department[] depts = employee.getDepartments();
                if (depts != null && depts.length > 0) { 
            %>
            <h4>📋 Départements (Tableau)</h4>
            <% 
                for (int i = 0; i < depts.length; i++) { 
                    if (depts[i] != null) {
            %>
            <div class="array-item">
                <h4>Département [<%= i %>]</h4>
                <div class="property">
                    <strong>Nom:</strong>
                    <span class="property-value"><%= depts[i].getName() %></span>
                </div>
                <div class="property">
                    <strong>Localisation:</strong>
                    <span class="property-value"><%= depts[i].getLocation() %></span>
                </div>
                <div class="property">
                    <strong>Budget:</strong>
                    <span class="property-value"><%= depts[i].getBudget() %> €</span>
                </div>
            </div>
            <% 
                    }
                } 
            %>
            <% } %>
        </div>
        <% } %>
        
        <!-- Affichage Employees array si présent -->
        <% 
            Employee[] employees = (Employee[]) request.getAttribute("employees");
            if (employees != null && employees.length > 0) { 
        %>
        <div class="data-section">
            <h3>👥 Tableau d'Employés</h3>
            <% 
                for (int i = 0; i < employees.length; i++) { 
                    if (employees[i] != null) {
            %>
            <div class="array-item">
                <h4>Employee [<%= i %>]</h4>
                <div class="property">
                    <strong>Nom:</strong>
                    <span class="property-value"><%= employees[i].getName() %></span>
                </div>
                <div class="property">
                    <strong>Prénom:</strong>
                    <span class="property-value"><%= employees[i].getSurname() %></span>
                </div>
                <div class="property">
                    <strong>Poste:</strong>
                    <span class="property-value"><%= employees[i].getPosition() %></span>
                </div>
                <div class="property">
                    <strong>Salaire:</strong>
                    <span class="property-value"><%= employees[i].getSalary() %> €</span>
                </div>
            </div>
            <% 
                    }
                } 
            %>
        </div>
        <% } %>
        
        <!-- Affichage Department séparé si présent -->
        <% 
            Department dept = (Department) request.getAttribute("department");
            if (dept != null) { 
        %>
        <div class="data-section">
            <h3>🏢 Department</h3>
            <div class="property">
                <strong>Nom:</strong>
                <span class="property-value"><%= dept.getName() %></span>
            </div>
            <div class="property">
                <strong>Localisation:</strong>
                <span class="property-value"><%= dept.getLocation() %></span>
            </div>
            <div class="property">
                <strong>Budget:</strong>
                <span class="property-value"><%= dept.getBudget() %> €</span>
            </div>
        </div>
        <% } %>
        
        <!-- Affichage deptId si présent -->
        <% if (request.getAttribute("deptId") != null) { %>
        <div class="data-section">
            <h3>🔢 Paramètre Primitif</h3>
            <div class="property">
                <strong>deptId:</strong>
                <span class="property-value">${deptId}</span>
            </div>
        </div>
        <% } %>
        
        <!-- Sortie brute (toString) -->
        <div class="data-section">
            <h3>📄 Sortie Brute (toString)</h3>
            <div class="raw-output">
                ${details}
            </div>
        </div>
        
        <a href="${pageContext.request.contextPath}/employee/test" class="back-link">← Retour aux tests</a>
    </div>
</body>
</html>
