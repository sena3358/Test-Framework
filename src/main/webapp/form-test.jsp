<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Map Parameters</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .test-section {
            background-color: white;
            padding: 25px;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .test-section h2 {
            color: #2196f3;
            border-bottom: 2px solid #2196f3;
            padding-bottom: 10px;
            margin-top: 0;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form-group input:focus {
            outline: none;
            border-color: #2196f3;
        }
        button {
            background-color: #49cc90;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }
        button:hover {
            background-color: #3ab77a;
        }
        .info {
            background-color: #e3f2fd;
            padding: 15px;
            border-left: 4px solid #2196f3;
            margin: 15px 0;
            font-size: 14px;
        }
        .info code {
            background-color: #fff;
            padding: 2px 6px;
            border-radius: 3px;
            color: #d32f2f;
        }
        .comparison {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin: 20px 0;
        }
        .old-method {
            border-left: 4px solid #ff9800;
        }
        .new-method {
            border-left: 4px solid #4caf50;
        }
        @media (max-width: 768px) {
            .comparison {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <h1> Test: Paramètres avec Map</h1> 
            <div class="test-section new-method">
                <form action="${pageContext.request.contextPath}/api/save-new" method="POST">
                    <div class="form-group">
                        <label>Nom:</label>
                        <input type="text" name="name" value="Marie Martin" required>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" value="marie@example.com" required>
                    </div>
                    <div class="form-group">
                        <label>Âge:</label>
                        <input type="number" name="age" value="30" required>
                    </div>
                    <button type="submit">Valider</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
