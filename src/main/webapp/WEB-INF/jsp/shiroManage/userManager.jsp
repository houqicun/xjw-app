<%--
  Created by IntelliJ IDEA.
  User: hqc
  Date: 2018/5/27
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>天气查询记录</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_data_tables.html#">选项1</a>
                            </li>
                            <li><a href="table_data_tables.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table id="iTable" class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th width="20%">序号</th>
                            <th width="20%">统一认证号</th>
                            <th width="20%">用户名</th>
                            <th width="20%">创建时间</th>
                            <th width="20%">修改时间</th>
                        </tr>
                        </thead>
                        <tbody id="iTbody">

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>序号</th>
                            <th>统一认证号</th>
                            <th>用户名</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                        </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".dataTables-example").dataTable({
            "bPaginate": true, //翻页功能
            "bLengthChange": true, //改变每页显示数据数量
            "bFilter": true, //过滤功能
            "bSort": true, //排序功能
            "bInfo": true,//页脚信息
            "ajax": {
                type:"post",
                url:"/user/query.hou",
                //data:"cityName=" + city,
                dataSrc:function (data) {
                    if (data.timeout) {
                        return "";
                    }
                    return data;
                }

            },
            "columns": [
                {"data": "id"},
                {"data": "passId"},
                {"data": "userName"},
                {"data": "createTime",
                    "render": function ( data, type, full, meta ) {
                        return transDate(data);
                    }},
                {"data": "updateTime",
                    "render": function ( data, type, full, meta ) {
                        return transDate(data);
                    }}
            ]
//            "columnDefs": [
//                {
//                    "targets": [3],
//                    "data": "id",
//                    "render": function(data, type, full) {
//                        return "<a href='/update?id=" + data + "'>Update</a>";
//                    }
//                }
//            ]
        });
        //getList();
    });

    function getList() {
        //var  = $("#").val();
        $.ajax({
            type:"post",
            url:"/user/query.hou",
            //data:"cityName=" + city,
            async:true,
            success:function (data) {
                var json = $.parseJSON(data);
                console.log(json);
                builldDataTable(json);
//                $("#weatherDiv").html(json);
            }
        })

    }

    function builldDataTable(json) {
        var dataTable = "";
        for (var i = 0; i < json.length; i++) {
            var k = i + 1;
            var jsonTr = json[i];
            var respJson = "";
            var sk = "";
            if (jsonTr.respJson != null && jsonTr.respJson != '') {
                respJson = $.parseJSON(jsonTr.respJson);
                sk = handleSk(respJson.sk);
            }
            dataTable = dataTable + "<tr class=\"gradeC\">\n" +
                "                            <td>" + k + "</td>\n" +
                "                            <td>" + jsonTr.reqAddr + "</td>\n" +
                "                            <td>" + transDate(jsonTr.reqTime) + "</td>\n" +
                "                            <td class=\"center\">" + jsonTr.respCode + "</td>\n" +
                "                            <td class=\"center\">" + sk + "</td>\n" +
                "                        </tr>";
        }
        //console.log(dataTable);
        $("#iTbody").html(dataTable);
    }

    function handleSk(sk) {
        //当前天气信息
        console.log(sk);
        var temp = sk.temp;
        var humidity = sk.humidity;
        var wind_direction = sk.wind_direction;
        var time = sk.time;
        var wind_strength = sk.wind_strength;
        var skStr = "当前时间：" + time +
            "     温度：" + temp + "   湿度：" + humidity +
            "     风向：" + wind_direction + "    风力：" + wind_strength;
        return skStr;
    }

    function transDate(dateStr) {
        var date = new Date(dateStr);
        var year = date.getFullYear().toString();
        var month = (date.getMonth()+1).toString();
        if (month.length == 1) {
            month = '0'+month;
        }
        var day = date.getDate().toString();
        if (day.length == 1) {
            day = '0'+day;
        }
        var hour = date.getHours().toString();
        if (hour.length == 1) {
            hour = '0'+hour;
        }
        var minute = date.getMinutes().toString();
        if (minute.length == 1) {
            minute = '0'+minute;
        }
        var second = date.getSeconds().toString();
        if (second.length == 1) {
            second = '0'+second;
        }
        var str = year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second;
        return str;
    }
</script>

</body>

</html>
