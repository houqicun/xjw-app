package com.hou.xjw.controller.juhe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/juheToday")
public class TodayQueryController {

    @RequestMapping("/toToday")
    public String toToday() {
        return "jsp/weatherManage/todayWeather";
    }

}
