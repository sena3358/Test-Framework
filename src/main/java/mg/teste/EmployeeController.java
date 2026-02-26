package mg.teste;
import java.util.Arrays;
import java.util.List;

import com.monframework.annotation.GET;
import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.MyController;
import com.monframework.annotation.POST;
import com.monframework.annotation.RequestParam;
import com.monframework.core.ModelView;

@MyController("/employees")
public class EmployeeController {

    @HandleUrl("/list")
    public ModelView listEmployees() {
        List<Employee> employees = Arrays.asList(
            new Employee("Jean", "Dupont", "Développeur", 45000),
            new Employee("Marie", "Martin", "Designer", 42000),
            new Employee("Pierre", "Durand", "Manager", 55000)
        );
        
        ModelView mv = new ModelView();
        mv.setView("/emp/list.jsp");
        mv.addObject("employees", employees);
        mv.addObject("title", "Liste des employés");
        
        return mv;
    }

    // Test 1: Objet simple avec propriétés de base
    @HandleUrl("/save-simple")
    @POST
    public ModelView saveSimple(Employee e) {
        ModelView mv = new ModelView("/emp/employee-result.jsp");
        mv.addObject("title", "Test 1: Objet Simple");
        mv.addObject("employee", e);
        mv.addObject("details", "Employee avec propriétés simples: " + e.toString());
        return mv;
    }
    
    // Test 2: Objet avec objet imbriqué
    @HandleUrl("/save-nested")
    @POST
    public ModelView saveNested(Employee e) {
        ModelView mv = new ModelView("/emp/employee-result.jsp");
        mv.addObject("title", "Test 2: Objet Imbriqué");
        mv.addObject("employee", e);
        mv.addObject("details", "Employee avec département principal: " + e.toString());
        return mv;
    }
    
    // Test 3: Objet avec tableau d'objets
    @HandleUrl("/save-array")
    @POST
    public ModelView saveArray(Employee e) {
        ModelView mv = new ModelView("/emp/employee-result.jsp");
        mv.addObject("title", "Test 3: Tableau d'Objets");
        mv.addObject("employee", e);
        mv.addObject("details", "Employee avec plusieurs départements: " + e.toString());
        return mv;
    }
    
    // Test 4: Tableau d'objets directement en paramètre
    @HandleUrl("/save-multiple")
    @POST
    public ModelView saveMultiple(Employee[] employees) {
        ModelView mv = new ModelView("/emp/employee-result.jsp");
        mv.addObject("title", "Test 4: Tableau d'Employés");
        
        StringBuilder details = new StringBuilder("Employés reçus: ");
        if (employees != null) {
            for (int i = 0; i < employees.length; i++) {
                if (i > 0) details.append(", ");
                details.append(employees[i]);
            }
        }
        
        mv.addObject("employees", employees);
        mv.addObject("details", details.toString());
        return mv;
    }
    
    @HandleUrl("/save-mixed")
    @POST
    public ModelView saveMixed(Employee e, Department d, @RequestParam("deptId") int deptId) {
        ModelView mv = new ModelView("/emp/employee-result.jsp");
        mv.addObject("title", "Test 5: Paramètres Mixtes");
        mv.addObject("employee", e);
        mv.addObject("department", d);
        mv.addObject("deptId", deptId);
        
        String details = String.format("Employee: %s, Department: %s, DeptId: %d", 
                                      e.toString(), d.toString(), deptId);
        mv.addObject("details", details);
        return mv;
    }
    
    // Afficher la page de test
    @HandleUrl("/test")
    @GET
    public ModelView showTest() {
        return new ModelView("/emp/employee-test.jsp");
    }
}