<%--
  Created by IntelliJ IDEA.
  User: hqc
  Date: 2018/4/9
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/plugins/flot/jquery.flot.js"></script>
    <script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="/js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="/js/demo/peity-demo.min.js"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="/js/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="/js/plugins/easypiechart/jquery.easypiechart.js"></script>
    <script src="/js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="/js/demo/sparkline-demo.min.js"></script>
</head>
<body>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>今日天气【北京】</h5>
                    <div class="ibox-tools">
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-2 b-r">
                            <h4>当前天气：</h4>
                            <p class="text-center">
                                <div id="skWeatherDiv">

                                </div>
                            </p>
                        </div>
                        <div class="col-sm-4 b-r">
                            <h4>今日天气：</h4>
                            <p class="text-center">
                            <div id="weatherDiv">

                            </div>
                            </p>
                        </div>
                        <div class="col-sm-3">
                            <h4>相关建议：</h4>
                            <p class="text-center">
                            <div id="suggestDiv">

                            </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


</body>

<script type="text/javascript">

    window.onload = function(){
        searchWeath('北京');
    }

    function searchWeath(city) {

        $.ajax({
            type:"post",
            url:"/juheWeather/query.hou",
            data:"cityName=" + city,
            async:false,
            success:function (data) {
                console.log(data);
                var json = $.parseJSON(data);
                console.log(json);
                if (json.error_code == "0") {
                    var result = $.parseJSON(json.result);
                    console.log(result);
                    handleResult(result);
                } else {
                    alert("天气信息获取失败，请稍后再试！");
                }
//                $("#weatherDiv").html(json);
            }
        })

    }

    //在jsp解析，考虑把解析做到后台去
    function handleResult(result) {
        //解析出sk
        handleSk(result.sk);
        //解析出today
        handleToday(result.today);
        //解析出future
        handleFuture(result.future);
    }

    function handleSk(sk) {
        //当前天气信息
        var temp = sk.temp;
        var humidity = sk.humidity;
        var wind_direction = sk.wind_direction;
        var time = sk.time;
        var wind_strength = sk.wind_strength;
        $("#skWeatherDiv").html("当前时间：" + time +
            "<br/>温度：" + temp + "<br/>湿度：" + humidity +
            "<br/>风向：" + wind_direction + "<br/>风力：" + wind_strength);
    }

    function handleToday(today) {
        var weather_id = today.weather_id;
        var week = today.week;
        var city = today.city;
        var dressing_index = today.dressing_index;
        var travel_index = today.travel_index;
        var wash_index = today.wash_index;
        var comfort_index = today.comfort_index;
        var exercise_index = today.exercise_index;
        var dressing_advice = today.dressing_advice;
        var uv_index = today.uv_index;
        var drying_index = today.drying_index;
        var temperature = today.temperature;
        var weather = today.weather;
        var date_y = today.date_y;
        var wind = today.wind;

        $("#weatherDiv").html("日期：" + date_y +
            "<br/>气温：" + temperature + "<br/>天气：" + weather +
            "<br/>风力：" + wind + "<br/>紫外线强度：" + uv_index);

        $("#suggestDiv").html("穿衣指数：" + dressing_index +
            "<br/>洗车指数：" + wash_index + "<br/>旅游建议：" + travel_index +
            "<br/>晨练指数：" + exercise_index + "<br/>穿衣建议：" + dressing_advice);

    }

    function handleFuture(future) {

        for (var i = 0; i < future.length; i++) {
            var day = future[i];
            var date = day.date;
            var weather_id = day.weather_id;
            var week = day.week;
            var temperature = day.temperature;
            var weather = day.weather;
            var wind = day.wind;

            $("#futureDiv" + i).html("日期：" + date + " " + week +
                "<br/>天气图示：" + weather_id + "<br/>天气：" + weather +
                "<br/>温度：" + temperature + "<br/>风力：" + wind);
        }

    }

</script>

</html>
