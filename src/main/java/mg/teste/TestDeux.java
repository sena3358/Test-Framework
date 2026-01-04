package mg.teste;
import com.monframework.annotation.*;

@MyController(value = "TestControllerDeux")
public class TestDeux {
    @HandleUrl(value = "TestMethod")
    public String test(){
        return "Bonjour, c est testDeux";
    }
}
