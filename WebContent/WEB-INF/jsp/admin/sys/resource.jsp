<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/admin/common/js.jspf" %>
</head>
<body>
<%@include file="/WEB-INF/jsp/admin/common/header.jspf" %>
<div class="am-cf admin-main" style="height :100%">
	<!-- 左侧导航栏的展示 -->
	<%@include file="/WEB-INF/jsp/admin/common/lift.jspf" %>
  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>资源管理</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
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
					<th class="table-id" style="width: 30px">ID</th>
					<th class="table-id" style="width: 100px">父资源id</th>
					<th class="table-title">资源名</th>
					<th class="table-type">资源链接</th>
					<th class="table-type">资源类型</th>
					<th class="table-type">资源ICON</th>
					<th class="table-type">资源备注</th>
					<th class="table-set">操作</th>
				</tr>
			  </thead>
              <tbody id="resourceList">
              <c:forEach items="${resoList }" var="resource" varStatus="status"> 
				<tr>
					<th class="table-check"><input type="checkbox" value='${resource.resourceId }'/></th>
					<td><%-- ${status.index+1 } --%>${resource.resourceId }</td>
					<td>${resource.parentId }</td>
					<td>${resource.resourceName }</td>
					<td>${resource.resourceUrl }</td>
					<td><span class="${resource.resourceIcon }"></span></td>
					<td>
						<c:if test="${resource.resource_type==1 }">
							<button type="button" class="am-btn am-btn-default">导航栏</button>
						</c:if>
						<c:if test="${resource.resource_type==0 }">
							<button type="button" class="am-btn am-btn-default">链接</button>
						</c:if>
					</td>
					<td>${resource.resourceDesc }</td>
					<td>
						<!--  <a href="${pageContext.request.contextPath }/user/update/${user.userId}">修改</a>
						<a onclick = "del(${user.userId })" href="javascript:;">删除</a>  -->
						<div class='am-btn-toolbar'>
							<div class='am-btn-group am-btn-group-xs'>
						    	<button class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='update()'><span class='am-icon-pencil-square-o'></span> 编辑</button>
						    	<button class='am-btn am-btn-default am-btn-xs am-hide-sm-only'><span class='am-icon-copy'></span> 复制</button>
						  		<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' onclick='delRole("+ele.roleId+")'><span class='am-icon-trash-o'></span> 删除</button>
							</div>
						</div>
					</td>
					</tr>
				</c:forEach>
              </tbody>
            </table>
            <hr />
            <p>注：资料列表修改请小心，不允许删除</p>
          </form>
        </div>

      </div>
    </div>
  </div>
  <!-- content end -->
  <%@include file="/WEB-INF/jsp/admin/common/footer.jspf" %>
</div>


<script>
	function delRole(id) {
		//$('#role_del').modal(options);
		console.log(id);
	}
</script>
<div class="am-modal am-modal-confirm" tabindex="-1" id="role_del">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">删除角色</div>
    <div class="am-modal-bd">
      你，确定要删除这条记录吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
</body>
</html>
