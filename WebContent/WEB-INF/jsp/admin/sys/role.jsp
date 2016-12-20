<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<strong class="am-text-primary am-text-lg">系统管理</strong> / <small>角色列表</small>
					</div>
				</div>
				<hr>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-default"
									onclick="updateRole(0)">
									<span class="am-icon-plus"></span> 新增
								</button>
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field"> <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button">搜索</button>
							</span>
						</div>
					</div>
				</div>

				<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" /></th>
										<th class="table-id" style="width: 100px">角色ID</th>
										<th class="table-title">角色名</th>
										<th class="table-type">角色描述</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="roleList">

								</tbody>
							</table>
							<hr />
							<p>注：角色列表修改请小心</p>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- content end -->
		<%@include file="/WEB-INF/jsp/admin/common/footer.jspf"%>
	</div>


	<script>
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath }/sys-role/list",
				type : "post",
				success : function(resp) {
					//console.log(resp);
					if (resp) {
						$.each(resp, function(index, ele) {
							var ind = index+1;
							//console.log(ele);
							var html = "";
							html += "<tr>";
							html += "<td><input type='checkbox' value=" + ele.roleId + "/></td>";
							html += "<td>" + ind + "</td>";
							html += "<td class='am-hide-sm-only'>" + ele.roleName + "</td>";
							html += "<td class='am-hide-sm-only'>" + ele.roleDesc + "</td>";
							var update = "<td>"
									+ "<div class='am-btn-toolbar'>"
									+ "<div class='am-btn-group am-btn-group-xs'>"
									+ "<button type='button' class='am-btn am-btn-default' onclick='updateRole("
									+ ele.roleId
									+ ")'><span class='am-icon-pencil-square-o'></span> 编辑</button>"
									+ '<button type="button" class="am-btn am-btn-default" onclick="delRole('
									+ ele.roleId
									+ ')"><span class="am-icon-trash-o"></span> 删除</button>'
									+ "</div>"
									+ "</div>"
									+ "</td>";
							html += update;
							html += "</tr>";
							$("#roleList").append(html);
						});
					}
				}
			});
		});

		function updateRole(id) {
			$.ajax({
				url : "${path }/sys-role/update/"+id,
				type : "GET",
				success : function(data) {
					$("#roleId").val(data.roleId);
					$("#rolenName").val(data.roleName);
					$("#rolenDesc").val(data.roleDesc);
				}
			});
			$.ajax({
				url : "${path }/sys-reso/list",
				type : "POST",
				success : function(data) {
					//console.log(data);
					//<option>1</option>
					var html = "";
					for (var i = 0; i < data.length; i++) {
						var h1 = "";
						if (data[i].parentId == null) {
							h1 = h1 + "<option value="+data[i].resourceId+">" + data[i].resourceName + "</option>";
							for (var j = 0; j < data.length; j++) {
								if (data[j].parentId == data[i].resourceId) {
									h1 = h1 + "<option value="+data[j].resourceId+">　" + data[j].resourceName + "</option>";
									for (var k = 0; k < data.length; k++) {
										if (data[k].parentId == data[j].resourceId) {
											h1 = h1 + "<option value="+data[k].resourceId+">　　" + data[k].resourceName + "</option>";
										}
									}
								}
							}
							html += h1;
						}
					}
					$("#resourceRole").html(html);
				}
			});//ajax end
			//role_add
			$('#role_add').modal({
				relatedElement : this,
				onConfirm : function() {
				}
			})
		}
		function delRole(id) {
			//data-am-modal="{target: `#role_del`}"
			$('#role_del').modal({
				relatedElement : this,
				onConfirm : function() {
					console.log(id);
					//alert('你是猴子派来的逗比!')
					$.ajax({
						url : "${path }/sys-role/del-a/"+id,
						type : "GET",
						success : function() {
							location.replace("${path }/sys-role/list-a");
						}
					});//ajax end
				},
				onCancel : function() {
					//alert('你不确定是不是猴子派来的逗比!')

				}
			});
		}
	</script>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="role_del">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">删除角色</div>
			<div class="am-modal-bd">你确定要删除这条记录吗？</div>
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
				角色操作 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<hr>
			<form class="am-form" action="${path }/sys-role/add-a" method="POST">
				<fieldset>
					<input type="hidden" name="roleId" value="${roleId }" id="roleId">
					<div class="am-form-group">
						<label for="rolenName">角色名称</label> <input type="text"
							class="am-form-field" name="roleName" 
							id="rolenName" placeholder="请输入角色名称" />
					</div>
					<div class="am-form-group">
						<label for="rolenDesc">角色描述</label> <input type="text"
							class="am-form-field" name="roleDesc" value="${roleDesc }"
							id="rolenDesc" placeholder="请输入角色描述" />
					</div>
					<div class="am-form-group">
						<label for="resourceRole">授予权限资源</label> <select multiple class=""
							name="ids" id="resourceRole">
						</select>
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
</body>
</html>