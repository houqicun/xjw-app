package com.hou.xjw.service.impl.juhe;

import com.hou.xjw.model.juhe.weatherForecast.*;
import com.hou.xjw.service.juhe.JuheWeatherService;

/**
 * create by houqicun 2017/12/2
 *
 * version 1.0 (maybe just test)
 *
 * handle weather data for using to weather forecast on wx-xjw
 *
 * 聚合数据 -----> 主要是解析聚合数据接口的天气预报(具体解析的策略写入策略类)
 *
 * */

public class JuheWeatherServiceImpl implements JuheWeatherService {

    @Override
    public ResponseJson getResponseJson(String responseStr) {
        return null;
    }

    @Override
    public ResultJson getResultJson(String responseStr) {
        return null;
    }

    @Override
    public SkJson getSkJson(String responseStr) {
        return null;
    }

    @Override
    public TodayJson getTodayJson(String responseStr) {
        return null;
    }

    @Override
    public FutureJson getFutureJson(String responseStr) {
        return null;
    }

    @Override
    public WeatherIdJson getWeatherIdJson(String responseStr) {
        return null;
    }
}
