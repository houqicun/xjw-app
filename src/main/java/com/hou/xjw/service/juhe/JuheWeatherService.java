package com.hou.xjw.service.juhe;

import com.hou.xjw.model.juhe.weatherForecast.*;

/**
 * create by houqicun 2017/12/2
 *
 * version 1.0 (maybe just test)
 *
 * handle weather data for using to weather forecast on wx-xjw
 *
 * 聚合数据 -----> 主要是解析聚合数据接口的天气预报
 *
 * */

public interface JuheWeatherService {

    //获取ResponseJson
    ResponseJson getResponseJson(String responseStr);

    //获取ResultJson
    ResultJson getResultJson(String responseStr);

    //获取SkJson
    SkJson getSkJson(String responseStr);

    //获取TodayJson
    TodayJson getTodayJson(String responseStr);

    //获取FutureJson
    FutureJson getFutureJson(String responseStr);

    //获取WeatherIdJson
    WeatherIdJson getWeatherIdJson(String responseStr);

}
