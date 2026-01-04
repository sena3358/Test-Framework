package mg.teste;

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

    @HandleUrl("/test-methods")
    @GET
    public ModelView showTestMethodsPage(){
        return new ModelView("/test-method.jsp");
    }
}
