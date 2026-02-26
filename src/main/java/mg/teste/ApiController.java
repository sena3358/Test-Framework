package mg.teste;

import com.monframework.annotation.*;
import com.monframework.core.ModelView;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.ArrayList;

@MyController("/api")
public class ApiController {
    
    private final ObjectMapper objectMapper = new ObjectMapper();
    
    // API 1: Retourner un seul objet
    @HandleUrl("/product/{id}")
    @GET
    @Json
    public String getProduct(@RequestParam("id") int id) {
        try {
            // Simuler la récupération d'un produit
            Product product = new Product(id, "Laptop Dell XPS", 1299.99, "Electronics");
            return objectMapper.writeValueAsString(product);
        } catch (Exception e) {
            return "{\"error\":\"" + e.getMessage() + "\"}";
        }
    }
    
    // API 2: Retourner une liste d'objets
    @HandleUrl("/products")
    @GET
    @Json
    public String listProducts() {
        try {
            List<Product> products = new ArrayList<>();
            products.add(new Product(1, "Laptop Dell XPS", 1299.99, "Electronics"));
            products.add(new Product(2, "iPhone 15 Pro", 999.99, "Electronics"));
            products.add(new Product(3, "Nike Air Max", 149.99, "Shoes"));
            products.add(new Product(4, "Sony Headphones", 299.99, "Electronics"));
            products.add(new Product(5, "Samsung TV 55\"", 799.99, "Electronics"));
            return objectMapper.writeValueAsString(products);
        } catch (Exception e) {
            return "{\"error\":\"" + e.getMessage() + "\"}";
        }
    }
    
    // Afficher le formulaire d'ajout de produit
    @HandleUrl("/product/form")
    @GET
    public ModelView showProductForm() {
        return new ModelView("/json/product-form.jsp");
    }
}

// Classe Order pour l'API 7
class Order {
    private int id;
    private String customerName;
    private double total;
    private Product[] products;
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    
    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
    
    public Product[] getProducts() { return products; }
    public void setProducts(Product[] products) { this.products = products; }
}
