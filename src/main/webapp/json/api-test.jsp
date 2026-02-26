<!DOCTYPE html>
<html>
<head>
    <title>Test API REST - Framework</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1400px;
            margin: 20px auto;
            padding: 20px;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
        }
        h1 {
            color: white;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .api-section {
            background-color: white;
            padding: 25px;
            margin: 20px 0;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .api-section h2 {
            color: #1e3c72;
            border-bottom: 3px solid #2a5298;
            padding-bottom: 10px;
        }
        .api-info {
            background-color: #e3f2fd;
            padding: 15px;
            border-left: 4px solid #2196f3;
            margin: 15px 0;
            font-size: 14px;
        }
        .api-info code {
            background-color: #fff;
            padding: 2px 6px;
            border-radius: 3px;
            color: #d32f2f;
            font-family: 'Courier New', monospace;
        }
        .test-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            margin: 10px 5px;
            transition: transform 0.2s;
        }
        .test-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .response-box {
            background-color: #263238;
            color: #aed581;
            padding: 20px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 13px;
            margin-top: 15px;
            white-space: pre-wrap;
            word-wrap: break-word;
            max-height: 400px;
            overflow-y: auto;
            display: none;
        }
        .response-box.show {
            display: block;
        }
        .method-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            font-size: 12px;
            margin-right: 10px;
        }
        .method-GET {
            background-color: #61affe;
        }
        .method-POST {
            background-color: #49cc90;
        }
        .json-badge {
            background-color: #ff9800;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 11px;
            font-weight: bold;
            margin-left: 10px;
        }
        input[type="text"] {
            padding: 8px;
            border: 2px solid #ddd;
            border-radius: 4px;
            width: 200px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h1>🚀 Test API REST avec @Json</h1>
    
    <!-- API 1: Objet unique -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 1: Objet unique
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/product/{id}</code></p>
            <p><strong>Format:</strong> <code>{"status": "success", "code": 200, "data": {...}}</code></p>
        </div>
        <button class="test-button" onclick="testApi1()">Tester /api/product/42</button>
        <div id="response1" class="response-box"></div>
    </div>
    
    <!-- API 2: Liste d'objets -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 2: Liste d'objets
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/products</code></p>
            <p><strong>Format:</strong> <code>{"status": "success", "code": 200, "count": 5, "result": [...]}</code></p>
        </div>
        <button class="test-button" onclick="testApi2()">Tester /api/products</button>
        <div id="response2" class="response-box"></div>
    </div>
    
    <!-- API 3: POST -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-POST">POST</span>
            API 3: POST avec data binding
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>POST /api/product/save</code></p>
            <p><strong>Paramètres:</strong> <code>p.name</code>, <code>p.price</code>, <code>p.category</code></p>
        </div>
        <button class="test-button" onclick="testApi3()">Tester POST /api/product/save</button>
        <div id="response3" class="response-box"></div>
    </div>
    
    <!-- API 4: Recherche -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 4: Recherche avec paramètres
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/products/search?category=Electronics</code></p>
        </div>
        <input type="text" id="category" value="Electronics" placeholder="Category">
        <button class="test-button" onclick="testApi4()">Rechercher</button>
        <div id="response4" class="response-box"></div>
    </div>
    
    <!-- API 5: Comparaison avec vue JSP -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 5: Sans @Json (Vue JSP)
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/product-view/{id}</code></p>
            <p><strong>Retour:</strong> ModelView → JSP (pas de JSON)</p>
        </div>
        <button class="test-button" onclick="testApi5()">Ouvrir /api/product-view/42</button>
    </div>
    
    <!-- API 6: Liste vide -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 6: Liste vide
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/products/empty</code></p>
            <p><strong>Format:</strong> <code>{"status": "success", "code": 200, "count": 0, "result": []}</code></p>
        </div>
        <button class="test-button" onclick="testApi6()">Tester liste vide</button>
        <div id="response6" class="response-box"></div>
    </div>
    
    <!-- API 7: Objet complexe -->
    <div class="api-section">
        <h2>
            <span class="method-badge method-GET">GET</span>
            API 7: Objet complexe imbriqué
            <span class="json-badge">@Json</span>
        </h2>
        <div class="api-info">
            <p><strong>URL:</strong> <code>/api/order/{id}</code></p>
            <p><strong>Contenu:</strong> Order avec tableau de Products</p>
        </div>
        <button class="test-button" onclick="testApi7()">Tester /api/order/123</button>
        <div id="response7" class="response-box"></div>
    </div>

    <script>
        const contextPath = '<%= request.getContextPath() %>';
        
        function formatJson(json) {
            try {
                const obj = JSON.parse(json);
                return JSON.stringify(obj, null, 2);
            } catch (e) {
                return json;
            }
        }
        
        function showResponse(id, text) {
            const el = document.getElementById(id);
            el.textContent = formatJson(text);
            el.classList.add('show');
        }
        
        async function testApi1() {
            const response = await fetch(contextPath + '/api/product/42');
            const text = await response.text();
            showResponse('response1', text);
        }
        
        async function testApi2() {
            const response = await fetch(contextPath + '/api/products');
            const text = await response.text();
            showResponse('response2', text);
        }
        
        async function testApi3() {
            const formData = new URLSearchParams();
            formData.append('p.name', 'MacBook Pro');
            formData.append('p.price', '2499.99');
            formData.append('p.category', 'Electronics');
            
            const response = await fetch(contextPath + '/api/product/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData
            });
            const text = await response.text();
            showResponse('response3', text);
        }
        
        async function testApi4() {
            const category = document.getElementById('category').value;
            const response = await fetch(contextPath + '/api/products/search?category=' + encodeURIComponent(category));
            const text = await response.text();
            showResponse('response4', text);
        }
        
        function testApi5() {
            window.open(contextPath + '/api/product-view/42', '_blank');
        }
        
        async function testApi6() {
            const response = await fetch(contextPath + '/api/products/empty');
            const text = await response.text();
            showResponse('response6', text);
        }
        
        async function testApi7() {
            const response = await fetch(contextPath + '/api/order/123');
            const text = await response.text();
            showResponse('response7', text);
        }
    </script>
</body>
</html>
