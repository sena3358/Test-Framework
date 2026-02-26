<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Produit - API Test</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 800px;
            margin: 50px auto;
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
            margin-bottom: 30px;
        }
        .form-section {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #555;
            margin-bottom: 8px;
            font-size: 15px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }
        .submit-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            transition: transform 0.2s;
        }
        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        .submit-button:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }
        .response-section {
            margin-top: 30px;
            display: none;
        }
        .response-section.show {
            display: block;
        }
        .response-header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 15px;
            border-radius: 6px 6px 0 0;
            font-weight: bold;
            font-size: 18px;
        }
        .response-error {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
        }
        .response-body {
            background-color: #263238;
            color: #aed581;
            padding: 20px;
            border-radius: 0 0 6px 6px;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            white-space: pre-wrap;
            word-wrap: break-word;
            max-height: 400px;
            overflow-y: auto;
        }
        .info-box {
            background-color: #e3f2fd;
            padding: 15px;
            border-left: 4px solid #2196f3;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .info-box code {
            background-color: #fff;
            padding: 2px 6px;
            border-radius: 3px;
            color: #d32f2f;
            font-family: 'Courier New', monospace;
        }
        .loading {
            display: none;
            text-align: center;
            margin-top: 20px;
        }
        .loading.show {
            display: block;
        }
        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #667eea;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📦 Ajouter un Produit</h1>
        
        <div class="info-box">
            <p><strong>Endpoint:</strong> <code>POST <%= request.getContextPath() %>/api/product/save</code></p>
            <p><strong>Format de réponse:</strong> JSON avec le produit créé (ID auto-généré)</p>
        </div>
        
        <form id="productForm" class="form-section">
            <div class="form-group">
                <label for="name">Nom du produit *</label>
                <input type="text" id="name" name="p.name" placeholder="Ex: MacBook Pro" required>
            </div>
            
            <div class="form-group">
                <label for="price">Prix (€) *</label>
                <input type="number" id="price" name="p.price" placeholder="Ex: 1299.99" step="0.01" min="0" required>
            </div>
            
            <div class="form-group">
                <label for="category">Catégorie *</label>
                <select id="category" name="p.category" required>
                    <option value="">-- Sélectionner --</option>
                    <option value="Electronics">Electronics</option>
                    <option value="Shoes">Shoes</option>
                    <option value="Clothing">Clothing</option>
                    <option value="Books">Books</option>
                    <option value="Food">Food</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            
            <button type="submit" class="submit-button" id="submitBtn">
                ✨ Créer le Produit
            </button>
        </form>
        
        <div class="loading" id="loading">
            <div class="spinner"></div>
            <p>Envoi en cours...</p>
        </div>
        
        <div class="response-section" id="responseSection">
            <div class="response-header" id="responseHeader">
                ✅ Réponse du serveur
            </div>
            <div class="response-body" id="responseBody"></div>
        </div>
    </div>

    <script>
        const form = document.getElementById('productForm');
        const submitBtn = document.getElementById('submitBtn');
        const loading = document.getElementById('loading');
        const responseSection = document.getElementById('responseSection');
        const responseHeader = document.getElementById('responseHeader');
        const responseBody = document.getElementById('responseBody');
        
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            // Désactiver le bouton et afficher le loading
            submitBtn.disabled = true;
            loading.classList.add('show');
            responseSection.classList.remove('show');
            
            try {
                // Récupérer les données du formulaire
                const formData = new FormData(form);
                const urlEncodedData = new URLSearchParams(formData);
                
                // Envoyer la requête POST
                const response = await fetch('<%= request.getContextPath() %>/api/product/save', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: urlEncodedData
                });
                
                const text = await response.text();
                
                // Formater le JSON
                let formattedJson = text;
                try {
                    const jsonObj = JSON.parse(text);
                    formattedJson = JSON.stringify(jsonObj, null, 2);
                } catch (e) {
                    // Si ce n'est pas du JSON valide, afficher tel quel
                }
                
                // Afficher la réponse
                responseBody.textContent = formattedJson;
                
                // Définir le style selon le statut
                if (response.ok) {
                    responseHeader.textContent = '✅ Succès - Produit créé';
                    responseHeader.classList.remove('response-error');
                } else {
                    responseHeader.textContent = '❌ Erreur lors de la création';
                    responseHeader.classList.add('response-error');
                }
                
                responseSection.classList.add('show');
                
                // Réinitialiser le formulaire en cas de succès
                if (response.ok) {
                    form.reset();
                }
                
            } catch (error) {
                responseHeader.textContent = '❌ Erreur de connexion';
                responseHeader.classList.add('response-error');
                responseBody.textContent = 'Erreur: ' + error.message;
                responseSection.classList.add('show');
            } finally {
                // Réactiver le bouton et masquer le loading
                submitBtn.disabled = false;
                loading.classList.remove('show');
            }
        });
    </script>
</body>
</html>
