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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">教学管理</strong> / <small>课程信息列表</small></div>
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
            <table class="am-table am-table-striped am-table-hover table-main" style="">
              <thead>
				<tr>
					<th class="table-check"><input type="checkbox" /></th>
					<th class="table-id" style="width: 100px">ID</th>
					<th class="table-title">课程名称</th>
					<!-- <th class="table-type">描述</th> -->
					<th class="table-type">图片URL</th>
					<th class="table-type">学生人数</th>
					<th class="table-type">课程分类名称</th>
					<th class="table-type">老师信息</th>
					<th class="table-set">操作</th>
				</tr>
			  </thead>
              <tbody id="userList">
                <c:forEach items="${classYears }" var="codes" varStatus="status"> 
				<tr>
					<th class="table-check"><input type="checkbox" value='${codes.classId }'/></th>
					<td>${status.index+1 }</td>
					<td>${codes.className }</td>
					<%-- <td>${codes.desc }</td> --%>
					<td>
					<c:if test="${codes.imgUrl!=null }">
						<button type="button" class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick="imag('${codes.imgUrl }')">存在图片</button>
					</c:if>
					</td>
					<td>${codes.classNum }</td>
					<td>${codes.codeName }</td>
					<td>${codes.teacherName }</td>
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
var url = "${path }/jx-classyear/list-a?currentPage=";
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
		html += "<li><a href='"+url+pagenext+"'>下一页</a></li>";
	} else {
		html += "<li class='am-disabled'><a href='"+url+pagenext+"'>下一页</a></li>";
	}
	$("#pagination").append(html);
})
</script>
            <hr />
            <p>注：课程分类列表修改请小心</p>
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
<div class="am-modal am-modal-confirm" tabindex="-1" id="classyear_add">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			添加课程<a href="javascript: void(0)" class="am-close am-close-spin"
				data-am-modal-close>&times;</a>
		</div>
		<hr>
		<form class="am-form" action="${path }/jx-classyear/add-a" method="POST" enctype="multipart/form-data">
			<fieldset>
				<input type="hidden" name="classId" value="${classId }" id="classId">
				<div class="am-form-group">
					<label for="className">课程名称</label>
					<input type="text" class="am-form-field" name="className" id="className" placeholder="请输入课程名称">
				</div>
				<div class="am-form-group">
					<label for="classDesc">课程分类描述</label>
					<input type="text" class="am-form-field" name="classDesc" id="classDesc" placeholder="请输入课程描述">
				</div>
				<div class="am-form-group">
			   		<label for="codeName">课程分类信息</label>
			    	<select id="codeName" name="codeName">
					</select>
					<span class="am-form-caret"></span>
			    </div>
				<div class="am-form-group">
					<label for="pictureFile">图片上传域</label>
					<input class="am-form-field" type="file" id="pictureFile" name="pictureFile">
				 	<p class="am-form-help">请选择要上传的图片...</p>
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
				url : "${path }/jx-classyear/update-a/"+id,
				type : "GET",
				success : function(data) {
					/* $("#roleId").val(data.roleId);
					$("#rolenName").val(data.roleName);
					$("#rolenDesc").val(data.roleDesc); */
				}
			});
		}
		$.ajax({
			url : "${path }/jx-classyear/listCode",
			type : "GET",
			async : false,
			success : function(data) {
				//console.log(data);
				/* $("#roleId").val(data.roleId);
				$("#rolenName").val(data.roleName);
				$("#rolenDesc").val(data.roleDesc); */
				var html = "";
				for (var i=0; i<data.length; i++) {
					html = html + "<option value="+data[i].id+">"+data[i].name+"</option>";
				}
				$("#codeName").html(html);
			}
		});
		$('#classyear_add').modal({
			relatedElement : this,
			onConfirm : function() {
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
