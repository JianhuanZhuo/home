package cn.keepfight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 博客控制器
 * Created by tom on 2018/2/9.
 */
@Controller
public class BlogController {

    @RequestMapping("/article")
    public String pcategory(Model model) throws Exception {
//        model.addAttribute("types", ProductServices.selectAllType());
        return "backend_products_category";
    }
}
