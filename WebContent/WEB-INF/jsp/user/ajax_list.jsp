<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表展示</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.js"></script>
</head>
	<script>
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath }/user/ajax_list",
			type:"post",
			success:function(resp){
				if(resp){
					$.each(resp,function(index,ele){
					//console.log(ele);
						var html = "";
						html += "<tr>";
						html += "<td>"+ele.userId+"</td>";
						html += "<td>"+ele.username+"</td>";
						html += "<td>"+ele.name+"</td>";
						html += "<td>"+ele.password+"</td>";
						html += "<td>"+ele.sex+"</td>";
						html += "<td>"+ele.birthday+"</td>";
						html += "<td>"+ele.email+"</td>";
						html += "<td>"+ele.address+"</td>";
						html += "</tr>";
					
						$("table").append(html);
					});
				}
			}
		});
	
	});
	</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>用户ID</th>
			<th>用户名</th>
			<th>姓名</th>
			<th>密码</th>
			<th>性别</th>
			<th>生日</th>
			<th>邮箱</th>
			<th>地址</th>
		</tr>
	</table>
</body>
</html>