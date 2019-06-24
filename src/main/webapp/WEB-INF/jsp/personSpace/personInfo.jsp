<%--
  Created by IntelliJ IDEA.
  User: hqc
  Date: 2018/5/29
  Time: 21:22
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
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="/css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <link href="/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="/js/plugins/jsKnob/jquery.knob.js"></script>
    <script src="/js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <script src="/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
    <script src="/js/plugins/cropper/cropper.min.js"></script>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-8">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>个人资料</h5>
                </div>
                <div>
                    <div class="ibox-content no-padding border-left-right">
                        <img width="400" alt="image" class="img-responsive" src="/img/profile_big.jpg">
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-5">
                                <dl class="dl-horizontal">
                                    <dt>昵称：</dt>
                                    <dd>Jack马</dd>
                                    <dt>姓名：</dt>
                                    <dd>jack</dd>
                                    <dt>性别：</dt>
                                    <dd>男</dd>
                                    <dt>生日：</dt>
                                    <dd>2018-06-06</dd>
                                </dl>
                            </div>
                            <div class="col-sm-7" id="cluster_info">
                                <dl class="dl-horizontal">
                                    <dt>电话：</dt>
                                    <dd>156****7566</dd>
                                    <dt>住址：</dt>
                                    <dd>北京市朝阳区望京西街世安家园115号楼2单元1202室</dd>
                                    <dt>城市：</dt>
                                    <dd>北京</dd>
                                    <dt>邮箱：</dt>
                                    <dd>houqicun@hqc.com</dd>
                                </dl>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i> 编辑</button>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>最新动态</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="profile.html#">选项1</a>
                            </li>
                            <li><a href="profile.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div>
                        <div class="feed-activity-list">

                            <div class="feed-element">
                                <a href="profile.html#" class="pull-left">
                                    <img alt="image" class="img-circle" src="/img/a1.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">5分钟前</small>
                                    <strong>Jack马</strong> 关注了 <strong>你</strong>.
                                    <br>
                                    <small class="text-muted">5分钟前 来自 VIVO X21</small>
                                    <%--<div class="actions">--%>
                                        <%--<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>--%>
                                        <%--<a class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> 收藏</a>--%>
                                    <%--</div>--%>
                                </div>
                            </div>

                            <div class="feed-element">
                                <a href="profile.html#" class="pull-left">
                                    <img alt="image" class="img-circle" src="/img/profile.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">5小时前</small>
                                    <strong>大作家Marry</strong> 发布了一篇文章
                                    <br>
                                    <small class="text-muted">今天 10:20 来自 iPhone 6 Plus</small>

                                </div>
                            </div>
                            <div class="feed-element">
                                <a href="profile.html#" class="pull-left">
                                    <img alt="image" class="img-circle" src="/img/a3.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">2天前</small>
                                    <strong>Tom</strong> 上传了2张图片
                                    <br>
                                    <small class="text-muted">6月4日 11:56 来自 微博 weibo.com</small>
                                    <div class="photos">
                                        <a target="_blank" href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg">
                                            <img alt="image" class="feed-photo" src="/img/p1.jpg">
                                        </a>
                                        <a target="_blank" href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg">
                                            <img alt="image" class="feed-photo" src="/img/p3.jpg">
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

        </div>
    </div>

    <%--编辑个人信息--%>
    <div class="modal inmodal fade" id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h2 class="modal-title">编辑个人信息</h2>
                </div>
                <div class="modal-body">
                    <div class="ibox-content">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">昵称：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label class="col-sm-1 control-label">姓名：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">性别：</label>
                                <div class="col-sm-4">
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" checked="" value="man" name="sex"> <i></i> 男</label>
                                        <label>
                                            <input type="radio" value="women" name="sex"> <i></i> 女</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label class="col-sm-1 control-label">生日：</label>
                                <div class="col-sm-4">
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" value="2018-06-06">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">电话：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label class="col-sm-1 control-label">住址：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">城市：</label>
                                <div class="col-sm-4">
                                    <select data-placeholder="选择城市..." class="form-control m-b" >
                                        <option value="">请选择城市</option>
                                        <option value="110000" hassubinfo="true">北京</option>
                                        <option value="120000" hassubinfo="true">天津</option>
                                        <option value="130000" hassubinfo="true">上海</option>
                                        <option value="140000" hassubinfo="true">广州</option>
                                        <option value="150000" hassubinfo="true">深圳</option>
                                        <option value="210000" hassubinfo="true">杭州</option>
                                        <option value="220000" hassubinfo="true">成都</option>
                                        <option value="230000" hassubinfo="true">武汉</option>
                                        <option value="310000" hassubinfo="true">青岛</option>
                                        <option value="320000" hassubinfo="true">重庆</option>
                                        <option value="330000" hassubinfo="true">长沙</option>
                                        <option value="340000" hassubinfo="true">济南</option>
                                        <option value="350000" hassubinfo="true">西安</option>
                                        <option value="360000" hassubinfo="true">哈尔滨</option>
                                        <option value="370000" hassubinfo="true">大连</option>
                                        <option value="410000" hassubinfo="true">沈阳</option>
                                        <option value="420000" hassubinfo="true">宁波</option>
                                        <option value="430000" hassubinfo="true">厦门</option>
                                        <option value="440000" hassubinfo="true">南昌</option>
                                        <option value="450000" hassubinfo="true">苏州</option>
                                        <option value="460000" hassubinfo="true">南京</option>
                                        <option value="500000" hassubinfo="true">无锡</option>
                                        <option value="510000" hassubinfo="true">温州</option>
                                        <option value="520000" hassubinfo="true">昆明</option>
                                        <option value="530000" hassubinfo="true">兰州</option>
                                        <option value="540000" hassubinfo="true">郑州</option>
                                        <option value="610000" hassubinfo="true">石家庄</option>
                                        <option value="620000" hassubinfo="true">贵阳</option>
                                        <option value="630000" hassubinfo="true">台湾</option>
                                        <option value="640000" hassubinfo="true">拉萨</option>
                                        <option value="650000" hassubinfo="true">海口</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label class="col-sm-1 control-label">邮箱：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">心情：</label>
                                <div class="col-sm-4">
                                    <textarea class="form-control"></textarea>
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label class="col-sm-1 control-label">简介：</label>
                                <div class="col-sm-4">
                                    <textarea class="form-control"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
<script>
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });

    $("#data_1 .input-group.date").datepicker({
        todayBtn: "linked",
        keyboardNavigation: !1,
        forceParse: !1,
        calendarWeeks: !0,
        autoclose: !0
    });
</script>
</html>
