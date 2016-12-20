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
		<header class="am-g my-head">
			<div class="am-u-sm-12 am-article">
				<h1 class="am-article-title" id="title"></h1>
				<p class="am-article-meta" id="name"></p>
			</div>
		</header>

		<hr class="am-article-divider" />
		<div class="am-g am-g-fixed">
			<div class="am-u-md-9 am-u-md-push-3">
				<div class="am-g">
					<div class="am-u-sm-11 am-u-sm-centered">
						<div class="am-cf am-article" id="blog">
						</div>
						<hr/>
						<ul class="am-comments-list">
							<li class="am-comment">
								<a href="#link-to-user-home">
									<img src="img/b.jpg" alt="" class="am-comment-avatar" width="48" height="48">
								</a>
								<div class="am-comment-main">
									<header class="am-comment-hd">
										<div class="am-comment-meta">
											<a href="#link-to-user" class="am-comment-author">某人</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
										</div>
									</header>
									<div class="am-comment-bd">
										<p>《永远的蝴蝶》一文，还吸收散文特长，多采用第一人称，淡化情节，体现一种思想寄托和艺术追求。</p>
									</div>
								</div>
							</li>
							<li class="am-comment">
								<a href="#link-to-user-home">
									<img src="img/b.jpg" alt="" class="am-comment-avatar" width="48" height="48">
								</a>
								<div class="am-comment-main">
									<header class="am-comment-hd">
										<div class="am-comment-meta">
											<a href="#link-to-user" class="am-comment-author">路人甲</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-13 0:03</time>
										</div>
									</header>
									<div class="am-comment-bd">
										<p>感觉仿佛是自身的遭遇一样，催人泪下</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="am-u-md-3 am-u-md-pull-9 my-sidebar">
				<div class="am-offcanvas" id="sidebar">
					<div class="am-offcanvas-bar">
						<ul class="am-nav" id="blog-list">
							<li>
								<a href="blog.html">永远的蝴蝶</a>
							</li>
							<li>
								<a href="blog.html">永远的蝴蝶</a>
							</li>
							<li>
								<a href="blog.html">永远的蝴蝶</a>
							</li>
							<li>
								<a href="blog.html">永远的蝴蝶</a>
							</li>
							<li>
								<a href="blog.html">永远的蝴蝶</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span class="am-sr-only">侧栏导航</span></a>
		</div>
		<%@include file="common/foot.jspf" %>
		<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url: "${path }/jx-blog/listBlog/1",
					success: function(data){
						//var json = eval('(' + data + ')'); 
						//console.log(data);
						$("#title").html(data.blogName);
						$("#name").html(data.blogDate);
						$("#blog").html(data.blogText);
					}
				})
			})
		</script>
	</body>

</html>