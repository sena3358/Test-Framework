package mg.teste;
import com.monframework.annotation.*;

@MyController(value = "TestControllerUn")
public class TestUn {

    @HandleUrl(value = "TestMethod")
    public String test(){
        return "Bonjour, c est testUn";
    }
}
