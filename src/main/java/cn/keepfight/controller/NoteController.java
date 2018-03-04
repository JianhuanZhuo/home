package cn.keepfight.controller;

import cn.keepfight.dao.NoteDao;
import cn.keepfight.jdbc.NoteServices;
import cn.keepfight.utils.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by tom on 2018/2/9.
 */
@Controller
@RequestMapping("/note")
public class NoteController {

    /**
     * 学习笔记列表首页
     */
    @RequestMapping("")
    public String list(Model model, @RequestParam(value = "page", required = false) Integer page) throws Exception {
        if (page == null) {
            page = 1;
        }
        model.addAttribute("noteres", NoteServices.selectPage(page));
        return "note_list";
    }


    /**
     * 学习笔记列表首页
     */
    @RequestMapping("/note")
    public String note(Model model, @RequestParam("id") int id,
                       final RedirectAttributes redirectAttributes) throws Exception {
        NoteDao note = NoteServices.selectByID(id);
        if (note == null) {
            redirectAttributes.addFlashAttribute("msg", "您找的页面不存在");
            redirectAttributes.addFlashAttribute("url", "/");
            return "redirect:/miss";
        }
        model.addAttribute("note", note);
        System.out.println("note -> id : " + note);
        return "note_article";
    }

    /**
     * 学习笔记列表首页
     */
    @RequestMapping("/note/path")
    public String note(Model model, @RequestParam("filePath") String filePath,
                       final RedirectAttributes redirectAttributes) throws Exception {
        if (filePath == null || filePath.trim().equals("")) {
            redirectAttributes.addFlashAttribute("msg", "您找的页面不存在");
            redirectAttributes.addFlashAttribute("url", "/");
            return "redirect:/miss";
        }
        filePath = filePath.trim();
        System.out.println("filePath :" + filePath);
        NoteDao note = NoteServices.selectByPath(filePath);
        if (note == null) {
            redirectAttributes.addFlashAttribute("msg", "您找的页面不存在");
            redirectAttributes.addFlashAttribute("url", "/");
            return "redirect:/miss";
        }
        model.addAttribute("note", note);
        System.out.println("note -> id : " + note);
        return "note_article";
    }


    /**
     * 学习笔记标签
     */
    @RequestMapping("/tag/{tagParam}")
    public String tag(Model model, @PathVariable("tagParam") String tag) throws Exception {
        List<NoteDao> notes = NoteServices.selectByTag(tag);

        model.addAttribute("notes", notes.stream()
                .collect(Collectors.groupingBy(sd -> sd.getPubTime().toLocalDateTime().getYear()))
                .entrySet()
                .stream()
                .map(m -> new Pair<>(m.getKey(), m.getValue()))
                .sorted((o1, o2) -> o2.getK().compareTo(o1.getK()))
                .collect(Collectors.toList())
        );
        return "note_tag";
    }

    /**
     * 学习笔记标签
     */
    @RequestMapping("/archive/{year}")
    public String archive(Model model, @PathVariable("year") int year) throws Exception {

        model.addAttribute("notes", NoteServices.selectByYear(year));
        model.addAttribute("year", year);
        return "note_archive";
    }
}
