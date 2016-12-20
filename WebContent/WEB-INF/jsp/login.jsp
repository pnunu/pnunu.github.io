<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Java在线学习系统登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="${path }/assets/i/favicon.png">
<link rel="stylesheet" href="${path }/assets/css/amazeui.min.css" />
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="am-g">
			<h1>Java - - 一次编译，到处运行</h1>
		</div>
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h2>登录</h2>
			<hr>
			<br>

			<form action="${pageContext.request.contextPath }/sys-user/login"
				method="post" class="am-form">
				<input type="hidden" name="userId" value="${user.userId }" />
				<label for="email">邮箱:</label>
				<input type="text" name="username" value="${user.username }" id="username" />
				<br>
				<label for="password">密码:</label>
				<input type="password" name="userPassword" value="${user.userPassword }" id="password" />
				<br>
				<!-- <label for="remember-me"> <input id="remember-me" type="checkbox">记住密码</label> -->
				<br />
				<div class="am-cf">
					<input type="submit" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
					<a hidden="#" class="am-btn am-btn-default am-btn-sm am-fr">注册^_^?</a>
				</div>
			</form>
			<hr>
			<p>© 2016 Java @nunu</p>
		</div>
	</div>
</body>
</html>
