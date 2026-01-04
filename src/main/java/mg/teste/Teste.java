package mg.teste;

import com.monframework.annotation.HandleUrl;

public class Teste {
    @HandleUrl("/hello")
    public void hello() {}

    @HandleUrl("/teste")
    public void about() {}
}