package com.hou.xjw.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 主登陆类，用于处理登陆相关操作
 * */

@Controller
@RequestMapping("/login")
public class LoginController {

    protected static Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model) throws Exception {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
            return "login";
        }
        //传递token给shiro的realm
        UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        //拿到当前用户对象
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);
            return "jsp/mainframe";
        } catch (AuthenticationException e) {
            logger.info("username or password has error.");
            model.addAttribute("loginMsg", "用户名或密码错误");
        }
        //登录失败还到login页面
        return "login";
    }

}
