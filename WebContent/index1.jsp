<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>角色列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.js"></script>
	<script>
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath }/role/list",
			type:"post",
			success:function(resp){
				console.log(resp);
				if(resp){
					$.each(resp,function(index,ele){
					console.log(ele);
						var html = "";
						html += "<tr>";
						html += "<td>"+ele.roleId+"</td>";
						html += "<td>"+ele.roleName+"</td>";
						html += "<td>"+ele.roleDesc+"</td>";
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
			<th>角色ID</th>
			<th>角色名</th>
			<th>角色描述</th>
		</tr>
	</table>
  </body>
</html>
