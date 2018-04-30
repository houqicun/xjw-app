package com.hou.xjw.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 注册类，用于处理注册相关操作
 * */

@Controller
@RequestMapping("/reg")
public class RegController {

    protected static Logger logger = Logger.getLogger(RegController.class);

    @RequestMapping("/toRegist")
    public String toRegist() {
        return "register";
    }

}
