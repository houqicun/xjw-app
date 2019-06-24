package com.hou.xjw.controller.personSpace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/personInfo")
public class PersonInfoController {

    @RequestMapping("/toInfo")
    public String toInfoPage(){
        return "jsp/personSpace/personInfo";
    }

}
