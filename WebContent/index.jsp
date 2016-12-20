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
<style type="text/css">
.hope {
	background: #555555;
	height: 60px;
	padding: 50px 0;
}
</style>
</head>

<body>
	<%@include file="common/header.jspf"%>
	<div class="get">
		<div class="am-g">
			<div class="am-u-lg-12">
				<h1 class="get-title">Java - 跨平台的高级语言，语言排名遥遥领先</h1>
				<p></p>

				<p>
					<a href="${path }/main.jsp"
						class="get-learn am-btn am-btn-sm get-btn">获取新get技能√</a>
				</p>
			</div>
		</div>
	</div>

	<div class="detail">
		<div class="am-g am-container">
			<div class="am-u-lg-12">
				<h2 class="detail-h2">One Web 、Any Device，期待和你一起去实现!</h2>

				<div class="am-g">
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-mobile am-icon-sm"></i> <span id="s1"></span>
						</h3>
						<p class="detail-p" id="sp1"></p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-cogs am-icon-sm"></i> <span id="s2"></span>
						</h3>
						<p class="detail-p" id="sp2"></p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-check-square-o am-icon-sm"></i> <span id="s3"></span>
						</h3>
						<p class="detail-p"  id="sp3"></p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-send-o am-icon-sm"></i> <span id="s4"></span>
						</h3>
						<p class="detail-p"  id="sp4"></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="hope">
		<div class="am-g am-container" style="margin-right: 0">
			<h2 style="color: #fff; font-size: 20px">
				在知识爆炸的年代，我们不愿成为知识的过客，拥抱开源文化，让自己更强大。-- 忠告
			</h2>
		</div>
	</div>

	<div class="about">
		<div class="am-g am-container">
			<div class="am-u-lg-12">
				<h2 class="about-title about-color">Java 在线学习系统，与你共同进步</h2>

				<div class="am-g">
					<div class="am-u-lg-6 am-u-md-4 am-u-sm-12">
						<form class="am-form">
							<label for="name" class="about-color">你的姓名</label> <input
								id="name" type="text"> <br /> <label for="email"
								class="about-color">你的邮箱</label> <input id="email" type="email">
							<br /> <label for="message" class="about-color">你的留言</label>
							<textarea id="message"></textarea>
							<br />
							<button type="submit" class="am-btn am-btn-primary am-btn-sm">
								<i class="am-icon-check"></i> 提 交
							</button>
						</form>
						<hr class="am-article-divider am-show-sm-only">
					</div>

					<div class="am-u-lg-6 am-u-md-8 am-u-sm-12">
						<h4 class="about-color">关于我们</h4>

						<p>AllMobilize Inc (美通云动科技有限公司)
							由前微软美国总部IE浏览器核心研发团队成员及移动互联网行业专家在美国西雅图创立，旨在解决网页在不同移动设备屏幕上的适配问题。基于国际专利技术并结合最前沿的HTML5技术，云适配解决方案可以帮助企业快速将桌面版网站适配到各种移动设备终端的屏幕上，不仅显著地提高了企业网站的用户体验以及销售转化率，而且大幅度地节省了企业开发和维护移动网站的费用。
						</p>
						<h4 class="about-color">团队介绍</h4>

						<p>AllMobilize Inc
							获得了微软创投孵化器的支持，其领先科技已得到全球多家企业及机构的认可与信赖，客户包括全球500强企业、美国政府、国内政府机关、国内外上市公司、以及互联网标准化组织W3C。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="common/foot.jspf"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url: "${path }/jx-classcode/list-index",
				success: function(data){
					//var json = eval('(' + data + ')'); 
					console.log(data);
					for (var i=0; i<4; i++) {
						var k=i+1;
						$("#s"+k).html(data[i].name);
						$("#sp"+k).html(data[i].desc);
						console.log(data[i]);
					}
				}
			})
		})
	</script>
</body>

</html>