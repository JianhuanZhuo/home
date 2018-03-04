package cn.keepfight.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 站点设置
 * Created by tom on 2018/2/10.
 */
@Controller
@RequestMapping("/backend/note")
public class NoteManagerController {

    @RequestMapping("")
    public String setting() throws Exception{
        return "back_note";
    }

    @RequestMapping("/folder")
    public String folder() throws Exception{
        return "back_note_folder";
    }
}
