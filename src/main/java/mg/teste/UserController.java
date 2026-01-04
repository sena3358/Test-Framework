package mg.teste;

import java.util.Map;

import com.monframework.annotation.*;
import com.monframework.core.ModelView;

@MyController("/api")
public class UserController {
    
    // GET /api/users - Liste tous les utilisateurs
    @HandleUrl("/users")
    @GET
    public ModelView listUsers() {
        ModelView mv = new ModelView("/result-data.jsp");
        mv.addObject("title", "Affichage User (GET)");
        mv.addObject("message", "Vous consultez la liste des users.");
        return mv;
    }
    
    // POST /api/users - Créer un nouvel utilisateur
    @HandleUrl("/users")
    @POST
    public ModelView createUser(@RequestParam("name") String name,
                                @RequestParam("email") String email) {
        ModelView mv = new ModelView("/result-data.jsp");
        mv.addObject("title", "Création User (POST)");
        mv.addObject("message", "Nouvel utilisateur créé : " + name + " (" + email + ")");
        mv.addObject("name", name);
        mv.addObject("email", email);
        return mv;
    }

    @HandleUrl("/save-new")
    @POST
    public ModelView saveNew(Map<String, Object> data) {
        ModelView mv = new ModelView("/result-sprint.jsp");
        mv.addObject("method", "Nouvelle méthode (avec Map)");
        mv.addObject("name", data.get("name"));
        mv.addObject("email", data.get("email"));
        mv.addObject("age", data.get("age"));
        mv.addObject("allData", data); // Passer toutes les données
        return mv;
    }

    @HandleUrl("/test-methods")
    @GET
    public ModelView showTestMethodsPage(){
        return new ModelView("/test-method.jsp");
    }

    @HandleUrl("/test")
    @GET
    public ModelView showForm() {
        return new ModelView("/form-test.jsp");
    }
}
