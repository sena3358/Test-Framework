package mg.teste;

import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.MyController;
import com.monframework.core.ModelView;

@MyController("/test")
public class TestController {

    /**
     * Test 1 : Retourne un String (affichage direct)
     */
    @HandleUrl("/string")
    public String testString() {
        return "<h1>Test String</h1><p>Cette méthode retourne un String directement.</p>";
    }

    /**
     * Test 2 : Retourne un ModelView (redirection vers JSP)
     */
    @HandleUrl("/modelview")
    public ModelView testModelView() {
        ModelView mv = new ModelView();
        mv.setView("/contact.jsp");
        return mv;
    }

    /**
     * Test 3 : Autre exemple de String
     */
    @HandleUrl("/hello")
    public String testHello() {
        return "Hello from TestController!";
    }
}