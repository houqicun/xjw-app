package com.hou.xjw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页类
 * */

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("/toIndex")
    public String toIndex() {
        return "jsp/index";
    }

}
