package mg.teste;

import com.monframework.annotation.MyController;
import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.RequestParam;
import com.monframework.core.ModelView;

@MyController("/param")
public class RequestParamTestController {

    /**
     * Test 1 : @RequestParam pour renommer un paramètre
     * URL: /param/search?q=Jean&page=1
     */
    @HandleUrl("/search")
    public String testRename(@RequestParam("q") String query, @RequestParam("page") int pageNumber) {
        return "<h1>Test @RequestParam</h1>" +
               "<p><strong>Recherche:</strong> " + query + "</p>" +
               "<p><strong>Page:</strong> " + pageNumber + "</p>" +
               "<hr>" +
               "<p>Les paramètres 'q' et 'page' ont été mappés vers 'query' et 'pageNumber'</p>";
    }

    /**
     * Test 2 : Combinaison @RequestParam + URL param
     * URL: /param/user/5?action=edit
     */
    @HandleUrl("/user/{id}")
    public ModelView testCombination(@RequestParam("action") String actionType, int id) {
        ModelView mv = new ModelView();
        mv.setView("/requestparam-test.jsp");
        mv.addObject("id", id);
        mv.addObject("actionType", actionType);
        mv.addObject("message", "Combinaison URL {id} + @RequestParam");
        return mv;
    }

    /**
     * Test 3 : @RequestParam avec même nom que paramètre d'URL
     * URL: /param/etudiant/10?var2=hello
     */
    @HandleUrl("/etudiant/{id}")
    public ModelView testWithUrl(@RequestParam("id") int userId, String var2, int id) {
        // userId et id devraient tous les deux avoir la valeur de {id}
        ModelView mv = new ModelView();
        mv.setView("/requestparam-advanced.jsp");
        mv.addObject("userId", userId);
        mv.addObject("var2", var2);
        mv.addObject("id", id);
        return mv;
    }

    /**
     * Test 4 : Plusieurs @RequestParam
     * URL: /param/filter?min=10&max=100&type=active
     */
    @HandleUrl("/filter")
    public String testMultiple(
            @RequestParam("min") int minValue,
            @RequestParam("max") int maxValue,
            @RequestParam("type") String filterType) {
        return "<h1>Filtre avec @RequestParam</h1>" +
               "<ul>" +
               "<li><strong>Min:</strong> " + minValue + "</li>" +
               "<li><strong>Max:</strong> " + maxValue + "</li>" +
               "<li><strong>Type:</strong> " + filterType + "</li>" +
               "</ul>" +
               "<p>Tous les paramètres ont été renommés grâce à @RequestParam</p>";
    }

    /**
     * Test 5 : Formulaire HTML pour tester
     * URL: /param/form
     */
    @HandleUrl("/form")
    public ModelView showForm() {
        ModelView mv = new ModelView();
        mv.setView("/requestparam-form.jsp");
        return mv;
    }
}
