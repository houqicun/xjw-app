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
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>查询</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">1,700</h1>
                    <div class="stat-percent font-bold text-success">78% <i class="fa fa-bolt"></i>
                    </div>
                    <small>总查询</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>查询</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">13,400</h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>总查询</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right">最近季度</span>
                    <h5>访客</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">2,120</h1>
                    <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                    </div>
                    <small>总访客</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">最近一个月</span>
                    <h5>活跃用户</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">300</h1>
                    <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                    </div>
                    <small>6月</small>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>天气走势图【下版本投产，敬请期待】</h5>
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-xs btn-white active">天</button>
                            <button type="button" class="btn btn-xs btn-white">月</button>
                            <button type="button" class="btn btn-xs btn-white">年</button>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <ul class="stat-list">
                                <li>
                                    <h2 class="no-margins">18</h2>
                                    <small>晴天</small>
                                    <div class="stat-percent">20% <i class="fa fa-level-up text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 56%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">11</h2>
                                    <small>多云</small>
                                    <div class="stat-percent">11% <i class="fa fa-level-down text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 39%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">2</h2>
                                    <small>雨天</small>
                                    <div class="stat-percent">30% <i class="fa fa-bolt text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 8%;" class="progress-bar"></div>
                                    </div>
                                </li>
                            </ul>
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
    $(document).ready(function () {
        $(".chart").easyPieChart({barColor: "#f8ac59", scaleLength: 5, lineWidth: 4, size: 80});
        $(".chart2").easyPieChart({barColor: "#1c84c6", scaleLength: 5, lineWidth: 4, size: 80});
        var data2 = [[gd(2012, 6, 1), 31], [gd(2012, 6, 2), 33], [gd(2012, 6, 3), 36], [gd(2012, 6, 4), 34], [gd(2012, 6, 5), 34], [gd(2012, 6, 6), 31], [gd(2012, 6, 7), 30], [gd(2012, 6, 8), 32], [gd(2012, 6, 9), 33], [gd(2012, 6, 10), 34], [gd(2012, 6, 11), 34], [gd(2012, 6, 12), 31], [gd(2012, 6, 13), 36], [gd(2012, 6, 14), 37], [gd(2012, 6, 15), 36], [gd(2012, 6, 16), 35], [gd(2012, 6, 17), 33], [gd(2012, 6, 18), 33], [gd(2012, 6, 19), 34], [gd(2012, 6, 20), 32], [gd(2012, 6, 21), 32], [gd(2012, 6, 22), 35], [gd(2012, 6, 23), 29], [gd(2012, 6, 24), 29], [gd(2012, 6, 25), 31], [gd(2012, 6, 26), 32], [gd(2012, 6, 27), 32], [gd(2012, 6, 28), 31], [gd(2012, 6, 29), 30], [gd(2012, 6, 30), 34], [gd(2012, 6, 31), 36]];
        var data3 = [[gd(2012, 6, 1), 800], [gd(2012, 6, 2), 500], [gd(2012, 6, 3), 600], [gd(2012, 6, 4), 700], [gd(2012, 6, 5), 500], [gd(2012, 6, 6), 456], [gd(2012, 6, 7), 800], [gd(2012, 6, 8), 589], [gd(2012, 6, 9), 467], [gd(2012, 6, 10), 876], [gd(2012, 6, 11), 689], [gd(2012, 6, 12), 700], [gd(2012, 6, 13), 500], [gd(2012, 6, 14), 600], [gd(2012, 6, 15), 700], [gd(2012, 6, 16), 786], [gd(2012, 6, 17), 345], [gd(2012, 6, 18), 888], [gd(2012, 6, 19), 888], [gd(2012, 6, 20), 888], [gd(2012, 6, 21), 987], [gd(2012, 6, 22), 444], [gd(2012, 6, 23), 999], [gd(2012, 6, 24), 567], [gd(2012, 6, 25), 786], [gd(2012, 6, 26), 666], [gd(2012, 6, 27), 888], [gd(2012, 6, 28), 900], [gd(2012, 6, 29), 178], [gd(2012, 6, 30), 555], [gd(2012, 6, 31), 993]];
        var dataset = [{
            label: "",
            data: data3,
            color: "#1ab394",
            bars: {show: true, align: "center", barWidth: 24 * 60 * 60 * 600, lineWidth: 0}
        }, {
            label: "",
            data: data2,
            yaxis: 2,
            color: "#464f88",
            lines: {lineWidth: 1, show: true, fill: true, fillColor: {colors: [{opacity: 0.2}, {opacity: 0.2}]}},
            splines: {show: false, tension: 0.6, lineWidth: 1, fill: 0.1},
        }];
        var options = {
            xaxis: {
                mode: "time",
                tickSize: [3, "day"],
                tickLength: 0,
                axisLabel: "Date",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: "Arial",
                axisLabelPadding: 10,
                color: "#838383"
            },
            yaxes: [{
                position: "left",
                max: 1070,
                color: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: "Arial",
                axisLabelPadding: 3
            }, {
                position: "right",
                clolor: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: " Arial",
                axisLabelPadding: 67
            }],
            legend: {noColumns: 1, labelBoxBorderColor: "#000000", position: "nw"},
            grid: {hoverable: false, borderWidth: 0, color: "#838383"}
        };

        function gd(year, month, day) {
            return new Date(year, month - 1, day).getTime()
        }

        var previousPoint = null, previousLabel = null;
        $.plot($("#flot-dashboard-chart"), dataset, options);
        var mapData = {
            "US": 298,
            "SA": 200,
            "DE": 220,
            "FR": 540,
            "CN": 120,
            "AU": 760,
            "BR": 550,
            "IN": 200,
            "GB": 120,
        };
        $("#world-map").vectorMap({
            map: "world_mill_en",
            backgroundColor: "transparent",
            regionStyle: {
                initial: {
                    fill: "#e4e4e4",
                    "fill-opacity": 0.9,
                    stroke: "none",
                    "stroke-width": 0,
                    "stroke-opacity": 0
                }
            },
            series: {regions: [{values: mapData, scale: ["#1ab394", "#22d6b1"], normalizeFunction: "polynomial"}]},
        })
    });
</script>

</html>
