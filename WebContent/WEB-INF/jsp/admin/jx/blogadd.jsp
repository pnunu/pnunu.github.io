<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>Java 学习系统--后台管理--添加课程内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/jsp/admin/common/js.jspf"%>
<link href="${path }/assets/umeditor/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${path }/assets/umeditor/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${path }/assets/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${path }/assets/umeditor/umeditor.min.js"></script>
<script type="text/javascript"
	src="${path }/assets/umeditor/lang/zh-cn/zh-cn.js"></script>
<script src="${path }/assets/js/amazeui.min.js"></script>
<script src="${path }/assets/js/app.js"></script>
<style type="text/css">
h1 {
	font-family: "微软雅黑";
	font-weight: normal;
}
.footerNunu {
	width: 100%;
	font-size: 14px;
	text-align: center;
}
.btn {
	display: inline-block;
	*display: inline;
	padding: 4px 12px;
	margin-bottom: 0;
	*margin-left: .3em;
	font-size: 14px;
	line-height: 20px;
	color: #333333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	*background-color: #e6e6e6;
	background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff),
		to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
	background-repeat: repeat-x;
	border: 1px solid #cccccc;
	*border: 0;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	*zoom: 1;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn:hover, .btn:focus, .btn:active, .btn.active, .btn.disabled, .btn[disabled]
	{
	color: #333333;
	background-color: #e6e6e6;
	*background-color: #d9d9d9;
}

.btn:active, .btn.active {
	background-color: #cccccc \9;
}

.btn:first-child {
	*margin-left: 0;
}

.btn:hover, .btn:focus {
	color: #333333;
	text-decoration: none;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	-moz-transition: background-position 0.1s linear;
	-o-transition: background-position 0.1s linear;
	transition: background-position 0.1s linear;
}

.btn:focus {
	outline: thin dotted #333;
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px;
}

.btn.active, .btn:active {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn.disabled, .btn[disabled] {
	cursor: default;
	background-image: none;
	opacity: 0.65;
	filter: alpha(opacity = 65);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/jsp/admin/common/header.jspf"%>
	<h1>&nbsp;&nbsp;&nbsp;&nbsp;添加课程信息</h1>
	<div>
		<form class="am-form">
			<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-2 am-text-right">标题</div>
				<div class="am-u-sm-8 am-u-md-4">
					<input type="text" class="am-input-sm" id="biaoti">
				</div>
				<div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
			</div>

			<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-2 am-text-right">作者</div>
				<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
					<input type="text"  class="am-input-sm" id="zuozhe" disabled="disabled" value="${user.userRealname }">
				</div>
			</div>
			<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-2 am-text-right">课程</div>
				<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
					<div class="am-form-group">
						<select id="kecheng">
							<c:forEach items="${classYears }" var="years" varStatus="status"> 
							<option value="${years.classId }">${years.className }</option>
							</c:forEach>
						</select>
						<span class="am-form-caret"></span>
					</div>
				</div>
			</div>
	

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
					内容描述</div>
				<div class="am-u-sm-12 am-u-md-10">

					<!--style给定宽度可以影响编辑器的最终宽度-->
					<script type="text/plain" id="myEditor"
						style="width: 80%; height: 240px;"></script>

				</div>
			</div>
			<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-2 am-text-right">　</div>
				<div class="am-u-sm-8 am-u-md-4">
					<button type="button" class="am-btn am-btn-primary am-btn-xs"
						onclick="getContent()">保存提交</button>
					&nbsp;
				</div>
				<div class="am-hide-sm-only am-u-md-6">
					<a href="${path }/jx-blog/list-a" class="am-btn am-btn-primary am-btn-xs">返回至列表</a>
				</div>
			</div>


		</form>
	</div>

	<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    function getContent() {
        /* var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent()); 
        alert(arr.join("\n")); */
        var neirong = UM.getEditor('myEditor').getContent();
        //console.log(neirong);
        var biaoti = $("#biaoti").val();
        //console.log(biaoti);
        var zuozhe = $("#zuozhe").val();
        //console.log(zuozhe+"."+zhaiyao);
        var kecheng = $("#kecheng option:selected").val();
        console.log(kecheng);
       /*  $.post("${path }/jx-blog/add", { blogName: "biaoti", blogText: "neirong", classId: "kecheng" }, function(data){
            alert("添加成功");
        });  */
        jQuery.ajax({
        	type: "POST",
			url : "${path }/jx-blog/add",
			data : "blogName="+biaoti+"&blogText="+neirong+"&classId="+kecheng,
			success : function(data) {
				alert("添加成功");
				$("#biaoti").val("");
				um.setContent("");
			}
		});
	}
</script>
<br><br><br>
<footer class="admin-content-footer footerNunu">
	<hr>
	<p class="am-padding-left">© 2016 Java, 学习系统. by 小小暮雨.</p>
</footer>
</body>
</html>