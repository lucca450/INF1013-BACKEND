package ca.uqtr.dmi.inf1013;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("api/")
public class hello {
    @GetMapping(path = "hello")
    public String getActiveUsers(){
        return "hello";
    }
}
