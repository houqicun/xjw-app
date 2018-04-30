package com.hou.xjw.aspect;

import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.hou.xjw.model.shiroPermission.User;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Map;

/**
 *日志记录AOP实现
 */

@Aspect
public class RequestLogAspect {

    protected static Logger logger = Logger.getLogger(RequestLogAspect.class);

    private String requestPath = null;//请求地址
    private String userName = null;//用户名
    private Map<?,?> inputParamMap = null;//传入参数
    private Map<String, Object> outputParamMap = null;//输出结果
    private long startTimeMillis = 0;//开始时间
    private long endTimeMillis = 0;//结束时间

    //方法调用前触发，记录开始时间
    @Before("execution(* com.hou.xjw.controller..*.*(..))")
    public void doBeforeAndGetTime(JoinPoint joinPoint) {
        startTimeMillis = System.currentTimeMillis();
    }

    //方法调用后触发，记录结束时间
    @After("execution(* com.hou.xjw.controller..*.*(..))")
    public void doAfterAndGetTime() {
        endTimeMillis = System.currentTimeMillis();
        this.printLog();
    }

    //环绕触发
    @Around("execution(* com.hou.xjw.controller..*.*(..))")
    public Object doAround(ProceedingJoinPoint p) throws Throwable {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
//        Session session = (Session) request.getSession();
//        User user = (User) session.getAttribute("loginUser");
        //从shiro的会话管理器中获取session
        Session session = SecurityUtils.getSubject().getSession();
        User user = (User) session.getAttribute("loginUser");
        if (user != null) {
            userName = user.getUserName();
        } else {
            userName = "用户未登录";
        }
        //获取输入参数
        inputParamMap = request.getParameterMap();
        //获取请求地址
        requestPath = request.getRequestURI();

        outputParamMap = Maps.newHashMap();
        Object result = p.proceed();//result的值就是被拦截的方法的返回值
        outputParamMap.put("result", result);

        return result;
    }

    //输出日志
    private void printLog() {
        Gson gson = new Gson();
        String optTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startTimeMillis);
        logger.info("\n user："+userName
                +"  url："+requestPath+"; op_time：" + optTime + " pro_time：" + (endTimeMillis - startTimeMillis)
                + "ms ;" +" param："+gson.toJson(inputParamMap)+";"+"\n result："+gson.toJson(outputParamMap));
    }

}
