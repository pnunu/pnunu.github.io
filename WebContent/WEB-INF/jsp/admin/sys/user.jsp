<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/admin/common/js.jspf" %>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>用户列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" onclick="update(0)" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
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
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
				<tr>
					<th class="table-check"><input type="checkbox" /></th>
					<th class="table-id" style="width: 100px">ID</th>
					<th class="table-title">登录名</th>
					<th class="table-type">姓名</th>
					<th class="table-type">性别</th>
					<th class="table-type">生日</th>
					<th class="table-type">创建时间</th>
					<th class="table-type">上次登录IP</th>
					<th class="table-type">角色</th>
					<th class="table-set">操作</th>
				</tr>
			  </thead>
              <tbody id="userList">
                <c:forEach items="${userList }" var="user" varStatus="status"> 
				<tr>
					<th class="table-check"><input type="checkbox" value='${user.userId }'/></th>
					<td>${status.index+1 }</td>
					<td>${user.username }</td>
					<td>${user.userRealname }</td>
					<td>${user.userSex }</td>
					<td><fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${user.userHiredate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${user.userIp }</td>
					<td>
						<c:if test="${user.role==1 }">系统管理员</c:if>
						<c:if test="${user.role==2 }">老师</c:if>
						<c:if test="${user.role==3 }">学生</c:if>
						<c:if test="${user.role==4 }">匿名用户</c:if>
					</td>
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
var url = "${path }/sys-user/list-a?currentPage=";
$(function(){
	var html = "";
	var pagenext = currentPage - 1 + 2;
	var page = currentPage - 1;
	var pageMax = Math.floor(count/10)+1;
	console.log(pageMax);
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
		html += "<li><a href='${path }/sys-user/list-a?currentPage="+pagenext+"'>下一页</a></li>";
	} else {
		html += "<li class='am-disabled'><a href='${path }/sys-user/list-a?currentPage="+pagenext+"'>下一页</a></li>";
	}
	$("#pagination").append(html);
})
/*
function pageselectCallback(page_index,jq) {
	location.href="${path }/sys-user/list-a?currentPage="+page_index;
}
//var count = 22;
function initPagination() {
	//console.log(id+":"+Number+","+count+","+current+","+pageCount);
	// 分布总数量，必须参数
	$("#pagination").pagination('${count }',{
		callback: pageselectCallback,
        items_per_page:10, // 控制每页显示的条数
        num_edge_entries: 2,       //两侧首尾分页条目数
        num_display_entries: 5,    //连续分页主体部分分页条目数
        current_page:'${currentPage }',
        prev_text:'<<',   //上一页显示文字
	    next_text:'>>'   //下一页显示文字
	});
};
$(function(){
	initPagination();
})
*/
</script>
            <hr />
            <p>注：用户列表修改请小心</p>
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
<div class="am-modal am-modal-confirm" tabindex="-1" id="role_add">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			添加用户<a href="javascript: void(0)" class="am-close am-close-spin"
				data-am-modal-close>&times;</a>
		</div>
		<hr>
		<form class="am-form" action="${path }/sys-user/add-a" method="POST">
			<fieldset>
				<input type="hidden" name="userId" value="${userId }" id="roleId">
				<div class="am-form-group">
					<label for="username">用户登录名</label>
					<input type="text" class="am-form-field" name="username" id="username" placeholder="请输入用户登录名">
				</div>
				<div class="am-form-group">
					<label for="userRealname">用户姓名</label>
					<input type="text" class="am-form-field" name="userRealname" id="userRealname" placeholder="请输入用户昵称">
				</div>
				<div class="am-form-group">
					<label for="userPassword">用户密码</label>
					<input type="password" class="am-form-field" name="userPassword" id="userPassword" placeholder="请输入密码">
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
<%@include file="/WEB-INF/jsp/admin/common/footer.jspf" %>
<script>
	function update(id) {
		$.ajax({
			url : "${path }/sys-user/update-a/"+id,
			type : "GET",
			success : function(data) {
				$("#roleId").val(data.roleId);
				$("#rolenName").val(data.roleName);
				$("#rolenDesc").val(data.roleDesc);
			}
		});
		$('#role_add').modal({
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
