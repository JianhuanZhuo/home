package cn.keepfight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tom on 2018/2/9.
 */
@Controller
@RequestMapping("")
public class WebController {

    @RequestMapping("")
    public String welcome() {
        return "welcome";
    }

    @RequestMapping("/miss")
    public String miss() {
        return "miss";
    }

    @RequestMapping("*")
    public String missWildMatch() {
        return "miss";
    }

    @RequestMapping("/redirect")
    public String redirect(Model model) {
        model.addAttribute("msg", "默认消息");
        model.addAttribute("url", "/");
        return "redirect";
    }
}
