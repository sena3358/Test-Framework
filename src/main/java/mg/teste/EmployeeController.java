package mg.teste;
import java.util.Arrays;
import java.util.List;

import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.MyController;
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
}