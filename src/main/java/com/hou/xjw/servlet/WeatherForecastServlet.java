package com.hou.xjw.servlet;

import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;
import com.hou.xjw.model.juhe.weatherForecast.ResultJson;
import com.hou.xjw.model.juhe.weatherForecast.SkJson;
import com.hou.xjw.utils.HttpClientUtil;
import com.hou.xjw.utils.JsonUtil;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

/**
 * create by houqicun 2017/11/9
 *
 * version 1.0 (maybe just test)
 *
 * handle weather data for using to weather forecast on wx-xjw
 *
 * 聚合数据 -----> KEY：6a4bccd1596cf1a017a4c2b379260aad
 *
 * */

public class WeatherForecastServlet extends HttpServlet{

    protected static Logger logger = Logger.getLogger(WeatherForecastServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cityName = req.getParameter("cityName");

        String cnUrlencode = URLEncoder.encode(cityName, "utf-8");
        //TODO 后期优化此处配置 考虑不同的数据源
        String url= "http://v.juhe.cn/weather/index?cityname=" + cnUrlencode
                + "&dtype=json&format=2&key=6a4bccd1596cf1a017a4c2b379260aad";

        logger.info("run WeatherForecastServlet.doPost ; get cityName : " + cityName);
        logger.info("post url : " + url);

        String weatherJson = HttpClientUtil.get(url);

        /**
         * 每次查到的新数据，检查是否间隔了一定时间，再会保存到数据库中，后续针对未来天气的重复查询从数据库读取
         *
         * 每隔一段时间起一个定时任务，会将数据库中最新的天气信息读取到缓存中，时间间隔较小的查询优先从缓存中
         *
         * */

        //TODO 后续继续开发,解析JSON 需要根据返回的数据构建相应的module，（需要考虑toString方法的统一配置）
        //聚合数据api，后续从servlet分离出去，形成各个数据源的可插拔式天气预报接口，一个不能用了就换另一个
        //后续可以考虑并发情况下的，不同线程调用不同的天气预报接口处理
        ResponseJson responseJson = JsonUtil.getObject(weatherJson, ResponseJson.class);
        ResultJson resultJson = JsonUtil.getObject(responseJson.getResult(), ResultJson.class);
        SkJson skJson = JsonUtil.getObject(resultJson.getSk(), SkJson.class);

        logger.info("responseJson is : " + responseJson);
        logger.info("resultJson is : " + resultJson);

        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        out.println(responseJson);
    }
}
