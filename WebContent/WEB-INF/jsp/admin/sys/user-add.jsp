<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/admin/common/js.jspf"%>
</head>
<body>
	<%@include file="/WEB-INF/jsp/admin/common/header.jspf"%>
	<div class="am-cf admin-main" style="height: 100%">
		<!-- 左侧导航栏 -->
		<%@include file="/WEB-INF/jsp/admin/common/lift.jspf"%>
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">系统管理</strong> / <small>用户添加</small>
					</div>
				</div>
				<hr>
				<div class="am-g">
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="doc-ipt-3" class="col-sm-2 am-form-label">电子邮件</label>
							<div class="col-sm-10">
								<input type="email" id="doc-ipt-3" placeholder="输入你的电子邮件">
							</div>
						</div>

						<div class="am-form-group">
							<label for="doc-ipt-pwd-2" class="col-sm-2 am-form-label">密码</label>
							<div class="col-sm-10">
								<input type="password" id="doc-ipt-pwd-2" placeholder="设置一个密码吧">
							</div>
						</div>

						<div class="am-form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住十万年
									</label>
								</div>
							</div>
						</div>
						<div class="am-form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="am-btn am-btn-default">提交登入</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- content end -->
	</div>

	<%@include file="/WEB-INF/jsp/admin/common/footer.jspf"%>
</body>
</html>