package com.hou.xjw.controller.personSpace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/editHeadPic")
public class EditHeadPicController {

    @RequestMapping("/toEditPage")
    public String toEditPage() {
        return "jsp/personSpace/editHeadPic";
    }

}
