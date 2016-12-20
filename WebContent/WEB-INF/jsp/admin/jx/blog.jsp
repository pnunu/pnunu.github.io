<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/admin/common/js.jspf" %>
<script type="text/javascript" src="${path }/js/jquery1.9.1.js"></script>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/common/header.jspf" %>
<div class="am-cf admin-main" style="height:100%">
	<!-- 左侧导航栏 -->
	<%@include file="/WEB-INF/jsp/admin/common/lift.jspf" %>
  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">教学管理</strong> / <small>课程分类列表</small></div>
      </div>
      <hr>
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <a href="${path }/jx-blog/addUI" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</a>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
          </div>
        </div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main" style="">
              <thead>
				<tr>
					<th class="table-check"><input type="checkbox" /></th>
					<th class="table-id" style="width: 100px">ID</th>
					<th class="table-title" style="width: 400px">课程名称</th>
					<th class="table-title" style="width: 200px">创建时间</th>
					<th class="table-set">操作</th>
				</tr>
			  </thead>
              <tbody id="userList">
                <c:forEach items="${blogs }" var="blog" varStatus="status"> 
				<tr>
					<th class="table-check"><input type="checkbox" value='${codes.id }'/></th>
					<td>${status.index+1 }</td>
					<td>${blog.blogName }</td>
					<td><fmt:formatDate value="${blog.blogDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<!--  <a href="${pageContext.request.contextPath }/user/update/${user.userId}">修改</a>
						<a onclick = "del(${user.userId })" href="javascript:;">删除</a>  -->
						<div class='am-btn-toolbar'>
							<div class='am-btn-group am-btn-group-xs'>
						    	<button type="button" class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='updateT(${user.userId })'><span class='am-icon-pencil-square-o'></span> 设置为老师</button>
						    	<button type="button" class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='initPassword(${user.userId })'><span class='am-icon-pencil-square-o'></span> 重置密码</button>
						  		<button type="button" class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' onclick='delUser(${user.userId })'><span class='am-icon-trash-o'></span> 删除</button>
							</div>
						</div>
					</td>
				</tr>
				</c:forEach>
              </tbody>
            </table>
            
            <!-- <div id='pagination'></div> -->
            <ul id='pagination' class="am-pagination am-pagination-centered">
			</ul>
<script type="text/javascript">
var count = "${count }";
var currentPage = "${currentPage }";
var url = "${path }/jx-blog/list-a?currentPage=";
$(function(){
	var html = "";
	var pagenext = currentPage - 1 + 2;
	var page = currentPage - 1;
	var pageMax = Math.floor(count/10)+1;
	//console.log(pageMax);
	//console.log("currentPage:"+currentPage+"pagenext:"+pagenext+"currentPage:"+currentPage);
	if (page >= 0) {
		html += "<li><a href='"+url+page+"'>上一页</a></li>";
	} else {
		html += "<li class='am-disabled'><a href='"+url+page+"'>上一页</a></li>";
	}
	for (var i=0; i<pageMax; i++) {
		var k = i+1;
		if (i == currentPage) {
			html += "<li class='am-active'><a href='"+url+i+"'>"+k+"</a></li>";
		} else {
			html += "<li><a href='"+url+i+"'>"+k+"</a></li>";
		}
	}
	if (pagenext < pageMax) {
		html += "<li><a href='${path }/jx-blog/list-a?currentPage="+pagenext+"'>下一页</a></li>";
	} else {
		html += "<li class='am-disabled'><a href='${path }/jx-blog/list-a?currentPage="+pagenext+"'>下一页</a></li>";
	}
	$("#pagination").append(html);
})
</script>
            <hr />
            <p>注：课程列表修改请小心</p>
          </form>
        </div>

      </div>
    </div>
  </div>
  <!-- content end -->
</div>

<!-- 以下是模态框 -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="user_del">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">删除用户</div>
		<div class="am-modal-bd">你确定要删除这条记录吗？</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
				class="am-modal-btn" data-am-modal-confirm>确定</span>
		</div>
	</div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="user_init">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">初始化密码</div>
		<div class="am-modal-bd">你确定要吗？</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
				class="am-modal-btn" data-am-modal-confirm>确定</span>
		</div>
	</div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="user_updateT">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">设置为老师</div>
		<div class="am-modal-bd">你确定要吗？</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
				class="am-modal-btn" data-am-modal-confirm>确定</span>
		</div>
	</div>
</div>
<div class="am-modal am-modal-alert" tabindex="-1" id="success">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">删除成功</div>
		<hr>
		<div class="am-modal-footer">
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="classcode_add">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			添加课程分类<a href="javascript: void(0)" class="am-close am-close-spin"
				data-am-modal-close>&times;</a>
		</div>
		<hr>
		<form class="am-form" action="${path }/jx-classcode/add-a" method="POST" enctype="multipart/form-data">
			<fieldset>
				<input type="hidden" name="id" value="${id }" id="roleId">
				<div class="am-form-group">
					<label for="name">课程分类名称</label>
					<input type="text" class="am-form-field" name="name" id="name" placeholder="请输入课程分类名称">
				</div>
				<div class="am-form-group">
					<label for="desc">课程分类描述</label>
					<input type="text" class="am-form-field" name="desc" id="desc" placeholder="请输入课程分类描述">
				</div>
				<div class="am-form-group">
					<label for="pictureFile">图片上传域</label>
					<input type="file" id="pictureFile" style="width: 200px" name="pictureFile">
				 	<p class="am-form-help">请选择要上传的文件...</p>
				</div>
				<hr>
				<p>
					<!-- onclick="saveRole()" -->
					<button type="submit" class="am-btn-primary am-btn-block">提交</button>
				</p>
			</fieldset>
		</form>
	</div>
</div>
<div class="am-modal am-modal-alert" tabindex="-1" id="image">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			图片信息<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		</div>
		<hr>
		<img id="mmgg" src="" style="width:400px;height:260px;margin:5px;" >
		<div class="am-modal-footer">
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/jsp/admin/common/footer.jspf" %>
<script>

	function imag(path) {
		//href="${path }/jx-classcode/image?path=${codes.imgurl }"
		$("#mmgg").attr("src","${path }/image?path="+path);
		$('#image').modal({
			relatedElement : this,
			onConfirm : function() {
			}
		})
	}
	function update(id) {
		if (id > 0) {
			$.ajax({
				url : "${path }/jx-classcode/update-a/"+id,
				type : "GET",
				success : function(data) {
					/* $("#roleId").val(data.roleId);
					$("#rolenName").val(data.roleName);
					$("#rolenDesc").val(data.roleDesc); */
				}
			});
		}
		$('#classcode_add').modal({
			relatedElement : this,
			onConfirm : function() {
			}
		})
	}
	//user_updateT
	function updateT(id) {
		$('#user_updateT').modal({
			relatedElement : this,
			onConfirm : function() {
				$.ajax({
					url : "${path }/sys-user/updateT-a/"+id,
					type : "GET",
					success : function(data) {
						location.replace("${path }/sys-user/list-a?currentPage=${currentPage }");
					}
				});
			}
		})
	}
	function initPassword(id) {
		$('#user_init').modal({
			relatedElement : this,
			onConfirm : function() {
				$.ajax({
					url : "${path }/sys-user/updatePass-a/"+id,
					type : "GET",
					success : function(data) {
						location.replace("${path }/sys-user/list-a?currentPage=${currentPage }");
					}
				});
			}
		})
	}
	function delUser(id) {
		//data-am-modal="{target: `#role_del`}"
		$('#user_del').modal({
			relatedElement : this,
			onConfirm : function() {
				//console.log(id);
				//alert('你是猴子派来的逗比!')
				$.ajax({
					url : "${path }/sys-user/del-a/"+id,
					type : "GET",
					success : function() {
						location.replace("${path }/sys-user/list-a?currentPage=${currentPage }");
					}
				});//ajax end
			},
			onCancel : function() {
			}
		});
	}
</script>
</body>
</html>
