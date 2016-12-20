<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<%@include file="common/js.jspf"%>
</head>
<body>
	<%@include file="common/header.jspf"%>
	<div class="am-g am-g-fixed am-margin-top">
		<table class="am-table am-table-striped am-table-hover">
			<thead>
				<tr>
					<th>Java 课程类别</th>
					<th>课程数量</th>
					<th>老师数量（人）</th>
					<th>学生数量（人）</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><a class="am-btn am-btn-default">应用按钮样式的链接</a></th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
				<tr>
					<th>Java 基础</th>
					<th>20</th>
					<th>10</th>
					<th>343</th>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="common/foot.jspf"%>
</body>

</html>