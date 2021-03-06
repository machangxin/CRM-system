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
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="select">刷新<button>
</script>
	<script type="text/html" id="rowtool">
<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-release layui-bg-blue" lay-event="track">跟单</a>
<a class="layui-btn layui-btn-xs layui-icon layui-icon-list layui-bg-red" lay-event="visitlog">回访记录</a>
</script>
	<table class="layui-table"
		lay-data="{height: 'full-1',url:'sys/publiccustomer_list', page:true, id:'customertable_id',toolbar:'#toolbar'}"
		lay-filter="customertable">
		<thead>
			<tr>
				<th lay-data="{type:'numbers'}">序列</th>
				<th lay-data="{field:'customer_id',width:0,,hide:true}">客户ID</th>
				<th lay-data="{field:'Customer_name',sort: true}">客户名</th>
				<th lay-data="{field:'Customer_liaison',sort: true}">联系人</th>
				<th lay-data="{field:'Customer_tel', sort: true}">电话</th>
				<th lay-data="{field:'Customer_addr'}">住址</th>
				<th lay-data="{toolbar:'#rowtool',width:300}">操作</th>
			</tr>
		</thead>
	</table>
	
	<form hidden id="h_div" class="layui-form " lay-filter="customer_save">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户</label>
				<div class="layui-input-inline">
					<input id="Customer_name" name="Customer_name" type="text"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input id="Customer_liaison" name="Customer_liaison" type="text"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input id="Customer_tel" name="Customer_tel" type="text"
						autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">住址</label>
				<div class="layui-input-inline">
					<input id="Customer_addr" name="Customer_addr" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<input type="hidden" name="Customer_state" />
	</form>
	
	<form hidden id="update_h_div" class="layui-form "
		lay-filter="customer_update">
		<input type="hidden" name="Customer_id" />
		<!-- 隐藏id -->
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
				<label class="layui-form-label">客户</label>
				<div class="layui-input-inline">
					<input  name="Customer_name" type="text"
						class="layui-input kong" lay-verify="required" readonly>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input name="Customer_liaison" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input name="Customer_tel" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">住址</label>
				<div class="layui-input-inline">
					<input name="Customer_addr" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required" />
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<input name="Customer_state" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">业务员id</label>
				<div class="layui-input-inline">
					<input name="Customer_user_id" type="text" autocomplete="off"
						class="layui-input kong" lay-verify="required|phone">
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
		table.on('toolbar(customertable)', function(obj) {
			//获取选中数据
			var checkStatus = table.checkStatus('customertable_id');
			var data = checkStatus.data;
			//浏览器控制台打印
			console.log(data);
			switch (obj.event) {
			case 'insert':
				//弹出对话框,供客户填写数据
				//保存与取消按钮
				//清空数据
				form.val("customer_save", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"Customer_name" : "", // "name": "value"
					"Customer_tel" : "",
					"Customer_addr": "",
					"Customer_state": 0,
					"Customer_liaison": ""
				});
				layer.open({
					type : 1,
					title : '新增客户信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("sys/customer_save", form.val("customer_save"), function() {
							layer.closeAll();
							layer.msg("添加成功", {icon:1,time:2000});
							table.reload('customertable_id');
						});
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'refrash':
				table.reload('customertable_id', {
					url : 'sys/publiccustomer_list',
						where : {
							"check" : ''
						}
				});
				break;
			case 'select':
				table.reload('customertable_id', {
					url : 'sys/publiccustomer_list',
					where : {
						"check" : $("#check").val()
					}
				});
				break;
			}
		});

		/*	表格内部的编辑与删除  */
		table.on('tool(customertable)', function(obj) {
			var data = obj.data;
			console.log(data);
			switch (obj.event) {
			case 'visitlog':
				location.href="visitlogPage?customer_id="+data.customer_id;
				break;
			case 'edit':
				form.val("customer_update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"Customer_name" : data.Customer_name, // "name": "value"
					"Customer_tel" : data.Customer_tel,
					"Customer_liaison" : data.Customer_liaison,
					"Customer_addr" : data.Customer_addr,
					"Customer_state" : data.Customer_state,
					"Customer_user_id" : data.Customer_user_id,
					"Customer_id" : data.customer_id
				});
				//弹出对话框
				layer.open({
					type : 1,
					title : '编辑用户信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("sys/customer_update", form.val("customer_update"),
								function() {
									layer.closeAll();
									layer.msg(data.Customer_name + "账户信息修改成功",
											{
												icon : 6,
												time : 2000
											});
									table.reload('customertable_id');
								});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
				break;
			case 'track':
					layer.confirm("确定要对"+data.Customer_name+"进行跟单吗?",{
						btn:["确定","取消"]
					},function(){
						$.post("sys/customer_track",data,function(d){
							layer.msg(data.Customer_name + "已成为您的私有客户",
									{
										icon : 6,
										time : 2000
									});
							table.reload('customertable_id');
						});
					});
				break;
			}
		});
	</script>
</body>
</html>,