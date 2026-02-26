<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Data Binding - Framework</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        h1 {
            color: white;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            margin-bottom: 30px;
        }
        .test-section {
            background-color: white;
            padding: 25px;
            margin: 20px 0;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .test-section h2 {
            color: #667eea;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
            margin-top: 0;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin: 15px 0;
        }
        .form-group {
            margin: 10px 0;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
            font-size: 14px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }
        button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 15px;
            transition: transform 0.2s;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .info {
            background-color: #e8eaf6;
            padding: 15px;
            border-left: 4px solid #667eea;
            margin: 15px 0;
            font-size: 14px;
            border-radius: 4px;
        }
        .info code {
            background-color: #fff;
            padding: 2px 6px;
            border-radius: 3px;
            color: #d32f2f;
            font-family: 'Courier New', monospace;
        }
        .highlight {
            background-color: #fff9c4;
            padding: 2px 4px;
            border-radius: 2px;
        }
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <h1>🎯 Test Data Binding Automatique</h1>
    
    <!-- Test 1: Objet Simple
    <div class="test-section">
        <h2>1️⃣ Objet Simple</h2>
        <div class="info">
            Mapping de <code>e.name</code>, <code>e.email</code>, <code>e.age</code> vers un objet <code>Employee</code>
        </div>
        
        <form action="${pageContext.request.contextPath}/employees/save-simple" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label>e.name</label>
                    <input type="text" name="e.name" value="Jean Dupont" required>
                </div>
                <div class="form-group">
                    <label>e.email</label>
                    <input type="email" name="e.email" value="jean@example.com" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.age</label>
                <input type="number" name="e.age" value="30" required>
            </div>
            <button type="submit">Tester Objet Simple</button>
        </form>
    </div> -->
    
    <!-- Test 2: Objet Imbriqué -->
    <div class="test-section">
        <h2>2️⃣ Objet Imbriqué</h2>
        <div class="info">
            Mapping avec objet imbriqué: <code>e.mainDepartment.name</code>
        </div>
        
        <form action="${pageContext.request.contextPath}/employees/save-nested" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label>e.name</label>
                    <input type="text" name="e.name" value="Marie" required>
                </div>
                <div class="form-group">
                    <label>e.surname</label>
                    <input type="text" name="e.surname" value="Martin" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>e.position</label>
                    <input type="text" name="e.position" value="Designer" required>
                </div>
                <div class="form-group">
                    <label>e.salary</label>
                    <input type="number" name="e.salary" value="42000" required>
                </div>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Département Principal:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>e.mainDepartment.name</label>
                    <input type="text" name="e.mainDepartment.name" value="IT" required>
                </div>
                <div class="form-group">
                    <label>e.mainDepartment.location</label>
                    <input type="text" name="e.mainDepartment.location" value="Paris" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.mainDepartment.budget</label>
                <input type="number" name="e.mainDepartment.budget" value="100000" required>
            </div>
            <button type="submit">Tester Objet Imbriqué</button>
        </form>
    </div>
    
    <!-- Test 3: Tableau d'Objets
    <div class="test-section">
        <h2>3️⃣ Tableau d'Objets</h2>
        <div class="info">
            Mapping de tableau: <code>e.departments[0].name</code>, <code>e.departments[1].name</code>
        </div>
        
        <form action="${pageContext.request.contextPath}/employees/save-array" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label>e.name</label>
                    <input type="text" name="e.name" value="Alice Johnson" required>
                </div>
                <div class="form-group">
                    <label>e.email</label>
                    <input type="email" name="e.email" value="alice@example.com" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.age</label>
                <input type="number" name="e.age" value="35" required>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Département [0]:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>e.departments[0].name</label>
                    <input type="text" name="e.departments[0].name" value="HR" required>
                </div>
                <div class="form-group">
                    <label>e.departments[0].location</label>
                    <input type="text" name="e.departments[0].location" value="Lyon" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.departments[0].budget</label>
                <input type="number" name="e.departments[0].budget" value="50000" required>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Département [1]:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>e.departments[1].name</label>
                    <input type="text" name="e.departments[1].name" value="Marketing" required>
                </div>
                <div class="form-group">
                    <label>e.departments[1].location</label>
                    <input type="text" name="e.departments[1].location" value="Marseille" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.departments[1].budget</label>
                <input type="number" name="e.departments[1].budget" value="75000" required>
            </div>
            
            <button type="submit">Tester Tableau d'Objets</button>
        </form>
    </div>
    
    
    <div class="test-section">
        <h2>4️⃣ Tableau d'Employés</h2>
        <div class="info">
            Paramètre de type <code>Employee[]</code>: <code>employees[0].name</code>, <code>employees[1].name</code>
        </div>
        
        <form action="${pageContext.request.contextPath}/employees/save-multiple" method="POST">
            <h4 style="color: #667eea;">Employé [0]:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>employees[0].name</label>
                    <input type="text" name="employees[0].name" value="Bob Smith" required>
                </div>
                <div class="form-group">
                    <label>employees[0].email</label>
                    <input type="email" name="employees[0].email" value="bob@example.com" required>
                </div>
            </div>
            <div class="form-group">
                <label>employees[0].age</label>
                <input type="number" name="employees[0].age" value="25" required>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Employé [1]:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>employees[1].name</label>
                    <input type="text" name="employees[1].name" value="Carol White" required>
                </div>
                <div class="form-group">
                    <label>employees[1].email</label>
                    <input type="email" name="employees[1].email" value="carol@example.com" required>
                </div>
            </div>
            <div class="form-group">
                <label>employees[1].age</label>
                <input type="number" name="employees[1].age" value="32" required>
            </div>
            
            <button type="submit">Tester Tableau d'Employés</button>
        </form>
    </div>
    
    <div class="test-section">
        <h2>5️⃣ Paramètres Mixtes</h2>
        <div class="info">
            Plusieurs paramètres: <code>Employee e</code>, <code>Department d</code>, <code>int deptId</code>
        </div>
        
        <form action="${pageContext.request.contextPath}/employees/save-mixed" method="POST">
            <h4 style="color: #667eea;">Employee:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>e.name</label>
                    <input type="text" name="e.name" value="David Brown" required>
                </div>
                <div class="form-group">
                    <label>e.email</label>
                    <input type="email" name="e.email" value="david@example.com" required>
                </div>
            </div>
            <div class="form-group">
                <label>e.age</label>
                <input type="number" name="e.age" value="40" required>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Department:</h4>
            <div class="form-row">
                <div class="form-group">
                    <label>d.name</label>
                    <input type="text" name="d.name" value="Sales" required>
                </div>
                <div class="form-group">
                    <label>d.location</label>
                    <input type="text" name="d.location" value="Nice" required>
                </div>
            </div>
            <div class="form-group">
                <label>d.budget</label>
                <input type="number" name="d.budget" value="80000" required>
            </div>
            
            <h4 style="color: #667eea; margin-top: 20px;">Paramètre primitif:</h4>
            <div class="form-group">
                <label>deptId</label>
                <input type="number" name="deptId" value="999" required>
            </div>
            
            <button type="submit">Tester Paramètres Mixtes</button>
        </form>
    </div> -->
</body>
</html>
