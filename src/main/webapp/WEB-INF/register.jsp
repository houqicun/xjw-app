<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理系统 - 注册</title>
    <link rel="shortcut icon" href="../favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/js/demo/form-validate-demo.min.js"></script>
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        $(document).ready(function() {
            $(".i-checks").iCheck({
                checkboxClass:"icheckbox_square-green",
                radioClass:"iradio_square-green"
            })
        });
    </script>
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div class="m-b-md">
            <img alt="image" class="img-circle circle-border" src="/img/regist1.jpg">
        </div>
        <h3>欢迎注册</h3>
        <p>创建一个新账户</p>
        <form class="m-t" role="form" id="signupForm" action="/reg/register.hou" target="_parent">
            <div class="form-group">
                <input type="text" class="form-control uname" name="userName" placeholder="请输入用户名">
                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请输入5-20位大小写字母或数字</span>
            </div>
            <div class="form-group">
                <input type="password" id="password1" class="form-control pword m-b" name="password1" placeholder="请输入密码">
                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请输入5-20位大小写字母、下划线或数字</span>
            </div>
            <div class="form-group">
                <input type="password" id="password2" class="form-control pword m-b" name="password2" placeholder="请再次输入密码">
            </div>

            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small>
                <a href="/login/login.hou" target="_parent">点此登录</a>
            </p>

        </form>
    </div>
</div>
</body>
</html>
