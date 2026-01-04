package mg.teste;
import com.monframework.annotation.MyController;
import com.monframework.annotation.HandleUrl;
import com.monframework.core.ModelView;
import java.util.Arrays;
import java.util.List;

@MyController("/etudiant")
public class EtudiantController {

    /**
     * Test 1 : URL dynamique avec paramètre int
     * URL: /etudiant/5 ou /etudiant/123
     */
    @HandleUrl("/{id}")
    public ModelView get(int id) {
        ModelView mv = new ModelView();
        mv.setView("/emp/etudiant.jsp");
        mv.addObject("id", id);
        mv.addObject("message", "Affichage de l'étudiant avec ID: " + id);
        return mv;
    }

    /**
     * Test 2 : URL dynamique retournant String
     * URL: /etudiant/10/edit
     */
    @HandleUrl("/{id}/edit")
    public String edit(int id) {
        return "<h1>Édition</h1><p>Vous éditez l'étudiant avec l'ID: <strong>" + id + "</strong></p>";
    }

    /**
     * Test 3 : URL dynamique avec String
     * URL: /etudiant/nom/Rakoto
     */
    @HandleUrl("/nom/{name}")
    public String getByName(String name) {
        return "<h1>Recherche par nom</h1><p>Étudiant recherché: <strong>" + name + "</strong></p>";
    }

    /**
     * Test 4 : Liste tous les étudiants (URL statique pour comparaison)
     * URL: /etudiant/list
     */
    @HandleUrl("/list")
    public ModelView listAll() {
        List<Employee> employees = Arrays.asList(
            new Employee("Jean", "Dupont", "Étudiant", 0),
            new Employee("Marie", "Martin", "Étudiante", 0),
            new Employee("Pierre", "Durand", "Étudiant", 0)
        );
        
        ModelView mv = new ModelView();
        mv.setView("/emp/etudiant-list.jsp");
        mv.addObject("etudiants", employees);
        mv.addObject("title", "Liste de tous les étudiants");
        return mv;
    }
}

