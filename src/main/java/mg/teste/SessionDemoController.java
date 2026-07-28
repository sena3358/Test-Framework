package mg.teste;
import com.monframework.annotation.GET;
import com.monframework.annotation.HandleUrl;
import com.monframework.annotation.MyController;
import com.monframework.annotation.POST;
import com.monframework.annotation.RequestParam;
import com.monframework.annotation.Session;
import com.monframework.core.ModelView;

import java.util.Map;

@MyController
public class SessionDemoController {

    @GET
    @HandleUrl("/session")
    public ModelView showForm(@Session Map<String, Object> session) {
        ModelView mv = new ModelView("/session-form.jsp");
        mv.addObject("currentUser", session.get("userName"));
        mv.addObject("visitCount", session.get("visitCount"));
        return mv;
    }

    @POST
    @HandleUrl("/session/login")
    public ModelView login(@Session Map<String, Object> session,
                           @RequestParam("userName") String userName) {
        Integer currentCount = (Integer) session.get("visitCount");
        int nextCount = currentCount == null ? 1 : currentCount + 1;

        session.put("userName", userName);
        session.put("visitCount", nextCount);
        session.put("isLoggedIn", true);

        ModelView mv = new ModelView("/session-profile.jsp");
        mv.addObject("message", "Session mise a jour avec succes.");
        return mv;
    }

    @GET
    @HandleUrl("/session/profile")
    public ModelView profile(@Session Map<String, Object> session) {
        ModelView mv = new ModelView("/session-profile.jsp");
        mv.addObject("message", "Lecture directe des attributs de session dans la vue.");
        return mv;
    }

    @POST
    @HandleUrl("/session/logout")
    public ModelView logout(@Session Map<String, Object> session) {
        session.clear();
        ModelView mv = new ModelView("/session-form.jsp");
        mv.addObject("message", "Session videe.");
        return mv;
    }
}
