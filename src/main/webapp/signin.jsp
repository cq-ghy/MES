<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="zh-CN">
<%
    String ret = request.getParameter("ret");
    if(StringUtils.isNotBlank(ret)) {
        ret = URLEncoder.encode(ret);
    } else {
        ret = "";
    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>登陆</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
     
	<div class="logintop">
		<span>欢迎登录重庆宗学重工MES系统</span>
	</div>
	<div class="loginbody container" >
    <div class="container-fluid">
    <span class="systemlogo"></span> 
    </div> 
    <div class="loginbox row ">
    
    <form class="form-signin" role="form" action="/login.page?ret=<%=ret%>" method="post">
        <ul>
        <li class="form-group has-success has-feedback">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        <input type="text"  class="form-control"  placeholder="Email/Telephone"  name="username" required autofocus value="${username}"></li>
        <li class="form-group has-success has-feedback">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <input class="form-control" type="password"   placeholder="Password"  name="password" required ></li>
        <li ><button class="loginbtn" type="submit">登 陆</button></li>
        </ul>
    </form>
    </div>
    </div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
</body>

<script type="text/javascript">
	 $(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-460)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-460)/2});
    }) 
});  

	 $('.form-control').hover(function(){
		$('.has-success ').css({"border-color":"#3a6d8b"});
        $('.form-control ').css({"border-color":"#3a6d8b"});
	},function(){
		$('.has-success ').css({"border-color":"#78c4f0"});
        $('.form-control ').css({"border-color":"#78c4f0"});
	});
</script>
</html>
