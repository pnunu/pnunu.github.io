<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表展示</title>
	<script>
		function del(id){
		   if(window.confirm("您确定要删除该记录吗？")){
		   	window.location.href="${pageContext.request.contextPath}/user/del/"+id;
		   }
		}
	</script>
</head>
<body>
	<a href="${pageContext.request.contextPath }/user/add">添加</a>　　　　
	<a href="${pageContext.request.contextPath }/user/logout">退出</a>
	<table>
		<tr>
			<th>用户ID</th>
			<th>用户名</th>
			<th>姓名</th>
			<th>密码</th>
			<th>性别</th>
			<th>生日</th>
			<th>邮箱</th>
			<th>地址</th>
			<th>操作</th>
		</tr>
	
		<c:forEach items="${userList }" var="user">
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
		</c:forEach>
	</table>
</body>
</html>