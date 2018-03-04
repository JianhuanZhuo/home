package cn.keepfight.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 站点设置
 * Created by tom on 2018/2/10.
 */
@Controller
@RequestMapping("/backend/submit")
public class SubmitController {

    @RequestMapping("")
    public String submit() throws Exception{
        return "submit";
    }
}
