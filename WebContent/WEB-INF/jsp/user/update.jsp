<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加页面</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/user/update" method="post">
		<input type="hidden" name="userId" value="${user.userId }"/>
		用户名:<input type="text" name="username" value="${user.username }"/><br>
		用户名:<input type="text" name="userRealname" value="${user.userRealname }"/><br>
		密　码:<input type="text" name="userPassword" value="${user.userPassword }"/><br>
		性别:   
				<c:if test="${user.userSex == '男' }">
					<input type="radio" checked name="userSex" value="男"/>男
		        	<input type="radio" name="userSex" value="女"/>女
				</c:if>
				<c:if test="${user.userSex == '女' }">
					<input type="radio"  name="userSex" value="男"/>男
		        	<input type="radio" checked name="userSex" value="女"/>女
				</c:if>
				<br>
		生日:<input type="text" name="userBirthday" value='<fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/>'/><br>
		地址:<input type="text" name="userHiredate" value='<fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd HH-mm-ss"/>'/><br>
		工资:<input type="text" name="userIp" value="${user.userIp }"/><br>
		<input type="submit" value="修改"/>
	</form>
</body>
</html>