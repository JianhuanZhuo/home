package cn.keepfight.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tom on 2018/2/10.
 */
@Controller
@RequestMapping("/backend")
public class BackController {


    @RequestMapping("")
    public String main()throws Exception{
        return "back_main";
    }

    @RequestMapping("/login")
    public String login()throws Exception{
        return "login";
    }
}
