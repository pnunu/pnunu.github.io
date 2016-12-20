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
		<p class="am-u-sm-12">下面是<strong>${classYears[0].codeName }</strong>中的课程信息</p>

		<div class="am-u-sm-12">
			<div id="year">
			<!-- <c:forEach items="${userList }" var="user">
		<tr>
			<td>${user.userId }</td>
			<td>${user.username }</td>
			<td>${user.userRealname }</td>
			<td>${user.userPassword }</td>
			<td>${user.userSex }</td>
			<td><fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${user.userHiredate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${user.userIp }</td>
			<td>
				<a href="${pageContext.request.contextPath }/user/update/${user.userId}">修改</a>
				<a onclick = "del(${user.userId })" href="javascript:;">删除</a>
			</td>
		</tr>
		</c:forEach> -->
				<c:forEach items="classYears" var="classYear">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-3">
							<a href="blog.html"><img class="am-img-thumbnail" src="${path }/image?path=${classYear.imgUrl }" alt="展示页面" /></a>
						</div>
						<div class="am-u-sm-12 am-u-md-9">
							<%-- <h3>分类名称：${classYear.codeName }</h3> --%>
							<h3>课程名称：${classYear.className }</h3>
							<p>
								${classYear.teacherName }
								<br>
								${classYear.classDesc }
							</p>
						</div>
					</div>
					<hr/>
				</c:forEach>
			</div>
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
	<%@include file="common/foot.jspf" %>
</body>
</html>