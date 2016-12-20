<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加页面</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/user/add" method="post">
		用户名:<input type="text" name="username"/><br>
		姓名:<input type="text" name="userRealname"/><br>
		密　码:<input type="text" name="userPassword"/><br>
		性别:  <input type="radio" name="userSex" value="男"/>男
		       <input type="radio" name="userSex" value="女"/>女<br>
		生日:<input type="text" name="userBirthday"/><br>
		地址:<input type="text" name="userHiredate"/><br>
		邮箱:<input type="text" name="userIp"/><br>
		<input type="submit" value="添加"/>
	</form>
</body>
</html>