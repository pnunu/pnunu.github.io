<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Java在线学习系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<%@include file="common/js.jspf" %>
</head>

<body>
	<%@include file="common/header.jspf" %>
	<!-- 内容展示 -->
	<div class="am-g am-g-fixed am-margin-top">
		<p class="am-u-sm-12">下面是该系统存在的课程信息</p>

		<div class="am-u-sm-12">
			<div id="main"></div>
			<h2>联系管理员</h2>
			<ul>
				<li>
					<span>若需要添加课程分类，请于管理员联系。并注明来意。且加上分类名称、分类内容、图片等资源。</span>
				<li>
					<span>若想成为授课教师，请于管理员联系。并注意邮件来意。且保证存在该系统账号，并把账号发于管理员。</span>
				</li>
				<li>
					<span>管理员邮箱是：***@163.com</span>
					<span hidden="true">管理员邮箱是：bjnunu@163.com</span>
				</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
/* 	<div class="am-g">
	<div class="am-u-sm-12 am-u-md-3">
		<a href="blog.html"><img class="am-img-thumbnail" src="assets/i/examples/landingPage.png" alt="展示页面" /></a>
	</div>
	<div class="am-u-sm-12 am-u-md-9">
		<h3>前端基础</h3>
		<p>
			
		</p>
	</div>
</div>
<hr/> */
		$(document).ready(function(){
			$.ajax({
				url: "${path }/jx-classcode/list-index",
				success: function(data){
					//var json = eval('(' + data + ')'); 
					//console.log(data);
					for (var i=0; i<data.length; i++) {
						var k=i+1;
						var html="";
						html += "<div class='am-g'>"
							+"<div class='am-u-sm-12 am-u-md-3'>"
							+"<a href='${path}/jx-classyear/list-year/"+data[i].id+"'><img class='am-img-thumbnail' src='${path }/image?path="+data[i].imgurl+"' alt='展示页面' /></a>"
							+"</div>"
							+"<div class='am-u-sm-12 am-u-md-9'>"
							+"<h3>"+data[i].name+"</h3>"
							+"<p>"+data[i].desc
							+"</p>"
							+"</div>"
							+"</div>"
							+"<hr/>";
						$("#main").append(html);
					}
				}
			})
		})
	</script>
	<%@include file="common/foot.jspf" %>
</body>
</html>