package mg.teste;
import com.monframework.annotation.MyController;
import com.monframework.annotation.HandleUrl;
import com.monframework.core.ModelView;

@MyController("/test")
public class ParamTestController {

    /**
     * Test 1 : Paramètre d'URL seulement
     * URL: /test/user/5
     */
    @HandleUrl("/user/{id}")
    public String testUrlParam(int id) {
        return "<h1>Test paramètre d'URL</h1><p>ID = <strong>" + id + "</strong></p>";
    }

    /**
     * Test 2 : Paramètre HTTP seulement
     * URL: /test/search?name=Jean
     */
    @HandleUrl("/search")
    public String testHttpParam(String name) {
        if (name == null) {
            return "<h1>Recherche</h1><p style='color:red;'>Aucun paramètre 'name' fourni</p>" +
                   "<p>Essayez: <a href='?name=Jean'>/test/search?name=Jean</a></p>";
        }
        return "<h1>Recherche</h1><p>Nom recherché: <strong>" + name + "</strong></p>";
    }

    /**
     * Test 3 : Combinaison paramètre d'URL + paramètres HTTP
     * URL: /test/etudiant/5?var2=hello&var3=world
     */
    @HandleUrl("/etudiant/{id}")
    public ModelView testCombined(String var2, String var3, int id) {
        ModelView mv = new ModelView();
        mv.setView("/param-test.jsp");
        mv.addObject("id", id);
        mv.addObject("var2", var2);
        mv.addObject("var3", var3);
        mv.addObject("message", "Test de combinaison URL + HTTP params");
        return mv;
    }

    /**
     * Test 4 : Plusieurs paramètres HTTP
     * URL: /test/form?name=Marie&age=25&ville=Tana
     */
    @HandleUrl("/form")
    public ModelView testMultipleParams(String name, int age, String ville) {
        ModelView mv = new ModelView();
        mv.setView("/form-result.jsp");
        mv.addObject("name", name);
        mv.addObject("age", age);
        mv.addObject("ville", ville);
        return mv;
    }

    /**
     * Test 5 : Page avec formulaire HTML pour tester
     * URL: /test/formulaire
     */
    @HandleUrl("/formulaire")
    public ModelView showForm() {
        ModelView mv = new ModelView();
        mv.setView("/test-form.jsp");
        return mv;
    }
}
