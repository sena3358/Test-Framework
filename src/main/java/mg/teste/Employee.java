package mg.teste;

public class Employee {
    private String name;
    private String surname;
    private String position;
    private double salary;
    private Department mainDepartment;
    private Department[] departments;

    public Employee() {
    }

    public Employee(String name, String surname) {
        this.name = name;
        this.surname = surname;
    }

    public Employee(String name, String surname, String position, double salary) {
        this.name = name;
        this.surname = surname;
        this.position = position;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Department getMainDepartment() {
        return mainDepartment;
    }
    
    public void setMainDepartment(Department mainDepartment) {
        this.mainDepartment = mainDepartment;
    }
    
    public Department[] getDepartments() {
        return departments;
    }
    
    public void setDepartments(Department[] departments) {
        this.departments = departments;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Employee{");
        sb.append("name='").append(name).append('\'')
          .append(", surname='").append(surname).append('\'')
          .append(", position='").append(position).append('\'')
          .append(", salary=").append(salary);
        
        if (mainDepartment != null) {
            sb.append(", mainDepartment=").append(mainDepartment);
        }
        
        if (departments != null && departments.length > 0) {
            sb.append(", departments=[");
            for (int i = 0; i < departments.length; i++) {
                if (i > 0) sb.append(", ");
                sb.append(departments[i]);
            }
            sb.append("]");
        }
        
        sb.append('}');
        return sb.toString();
    }
}
