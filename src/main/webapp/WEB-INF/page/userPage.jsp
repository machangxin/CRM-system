<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
	<script type="textml" id="toolbar">
	<input type="text" style="height:38px;" id="check"/>
	<button class="layui-btn layui-icon layui-icon-search " lay-event="select">查询<button>
	<button class="layui-btn layui-icon layui-icon-add-1" lay-event="insert">新增<button>
	<button class="layui-btn layui-icon layui-icon-close" lay-event="del">删除<button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refrash">刷新<button>
</script>
	<script type="text/html" id="rowtool">
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="update">编辑</a>
	<a class="layui-btn layui-btn-xs  layui-icon layui-icon-close layui-bg-red" lay-event="del">删除</a>
</script>
	<table class="layui-table"
		lay-data="{url:'sys/user_list', page:true, id:'usertable_id',toolbar:'#toolbar'}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{type:'numbers'}">序列</th>
				<th lay-data="{field:'User_id', sort: true}">ID</th>
				<th lay-data="{field:'User_loginname',sort: true}">用户名</th>
				<th lay-data="{field:'User_realname'}">真实姓名</th>
				<th lay-data="{field:'User_sex'}">性别</th>
				<th lay-data="{field:'User_tel'}">电话</th>
				<th lay-data="{field:'User_address'}">住址</th>
				<th lay-data="{toolbar:'#rowtool'}">操作</th>
			</tr>
		</thead>
	</table>
	<form hidden id="h_div" class="layui-form " lay-filter="user_save">
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
				<label class="layui-form-label">登录用户</label>
				<div class="layui-input-inline">
					<input id="User_loginname" name="User_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input id="User_realname" name="User_realname" type="text"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="User_sex0" type="radio" value="男" name="User_sex"
						title="男" lay-filter="test"> <input id="User_sex1"
						type="radio" value="女" name="User_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input id="User_tel" name="User_tel" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input id="User_address" name="User_address" type="text"
						autocomplete="off" class="layui-input kong" lay-verify="required" />
				</div>
			</div>
		</div>
	</form>

	<form hidden id="update_h_div" class="layui-form "
		lay-filter="user_update">
		<input type="hidden" name="User_id" />
		<!-- 隐藏id -->
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
				<label class="layui-form-label">登录用户</label>
				<div class="layui-input-inline">
					<input readonly="readonly" name="User_loginname" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input name="User_realname" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" value="男" name="User_sex" title="男"
						lay-filter="test"> <input type="radio" value="女"
						name="User_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="User_tel" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="User_address" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required" />
				</div>
			</div>
		</div>
	</form>
	<script src="static/layui/layui.all.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript">
		var table = layui.table;
		var $ = layui.$;
		var form = layui.form;
		$.ajaxSettings.async = false;
		table.on('toolbar(usertable)', function(obj) {
			//获取选中数据
			var checkStatus = table.checkStatus('usertable_id');
			var data = checkStatus.data;
			//浏览器控制台打印
			console.log(data);
			switch (obj.event) {
			case 'del':
				//如果只有一条信息
				var msg="";
				if(data.length==0){
					//没有选中数据
					layer.alert("请先选中数据,然后操作");
					return false;
				}
				else if(data.length==1){
					 msg="确定要删除" + data[0].User_realname + "的帐户信息吗?";
				}else{
					 msg="确定要删除" + data[0].User_realname + "等" + data.length + "条帐户信息吗?";
				}
				layer.confirm(msg, {
					btn : [ '确定', '取消' ]
				}, function() {
					//按钮【按钮一】的回调
					//确定
					//将要删除的数据返回到后台
					var userids = "";
					for(var i = 0;i < data.length;i++){
						userids+=data[i].User_id + ",";
					}
					$.post("sys/user_del_more", {"userids":userids}, function(d) {
						layer.closeAll();
						layer.msg("删除成功", {icon:1,time:2000});
						table.reload('usertable_id');
					});
					
				}, function() {
					//按钮【按钮二】的回调
					//取消
					//只需取消窗口
					layer.closeAll();
				});
				break;
			case 'refrash':
				table.reload('usertable_id', {
					url : 'sys/user_list',
						where : {
							"check" : ''
						}
				});
				break;
			case 'select':
				//查询管理员信息
				console.log($("#check").val());
				table.reload('usertable_id', {
					url : 'sys/user_list',
					where : {
						"check" : $("#check").val()
					}
				});
				break;
			case 'insert':
				//弹出对话框,供客户填写数据
				//保存与取消按钮
				//清空数据
				form.val("user_save", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"User_realname" : "", // "name": "value"
					"User_loginname" : "",
					"User_tel": "",
					"User_address": ""
				});
				layer.open({
					type : 1,
					title : '新增用户信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						var rd="";
						$.post("sys/confirmusername",form.val("user_save"),function(d){
							rd=d;
							
						});
						if(rd==true){
						$.post("sys/user_save", form.val("user_save"), function(d) {
							layer.closeAll();
							layer.alert('默认密码:'+d, {
								title : '新增用户账号'
							});
							table.reload('usertable_id');
						});}
						else{
							layer.msg("登录名重复,不可使用", {icon:2,time:2000});
						}
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
				break;
			}
		});
		/*	表格内部的编辑与删除  */
		table.on('tool(usertable)', function(obj) {
			var data = obj.data;
			console.log(data);
			switch (obj.event) {
			case 'del':
				layer.confirm("确定要删除" + data.User_realname + "的帐户信息吗?", {
					btn : [ '确定', '取消' ]
				}, function() {
					//按钮【按钮一】的回调
					//确定
					//将要删除的数据返回到后台
					$.post("sys/user_del", data, function(d) {
						layer.closeAll();
						table.reload('usertable_id');
					});
				}, function() {
					//按钮【按钮二】的回调
					//取消
					//只需取消窗口
					layer.closeAll();
				});
				break;
			case 'update':
				form.val("user_update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"User_realname" : data.User_realname, // "name": "value"
					"User_loginname" : data.User_loginname,
					"User_tel": data.User_tel,
					"User_address": data.User_address,
					"User_sex":data.User_sex,
					"User_id":data.User_id
				});
				//弹出对话框
				layer.open({
					type : 1,
					title : '编辑用户信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("sys/user_update", form.val("user_update"), function() {
							layer.closeAll();
							layer.msg(data.User_loginname+"账户信息修改成功", {icon:6,time:2000});
							table.reload('usertable_id');
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
				break;
			}
		});
	</script>
</body>
</html>