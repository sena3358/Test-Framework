package mg.teste;

public class Department {
    private String name;
    private String location;
    private int budget;
    
    public Department() {
    }
    
    public Department(String name, String location, int budget) {
        this.name = name;
        this.location = location;
        this.budget = budget;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getLocation() {
        return location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    public int getBudget() {
        return budget;
    }
    
    public void setBudget(int budget) {
        this.budget = budget;
    }
    
    @Override
    public String toString() {
        return "Department{name='" + name + "', location='" + location + "', budget=" + budget + "}";
    }
}
