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
	<button class="layui-btn layui-icon layui-icon-add-1" lay-event="insert">新增跟单客户<button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refrash">刷新<button>
</script>
	<script type="text/html" id="rowtool">
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="quit">取消跟单</a>
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-release layui-bg-blue" lay-event="visit">回访</a>
<a class="layui-btn layui-btn-xs layui-icon layui-icon-list layui-bg-red" lay-event="visitlog">回访记录</a>
</script>
	<table class="layui-table"
		lay-data="{ height: 'full-1',url:'sys/privatecustomer_list', page:true, id:'privatecustomertable_id',toolbar:'#toolbar'}"
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
					<input id="Customer_addr" name="Customer_addr" type="text"
						autocomplete="off" class="layui-input kong"
						lay-verify="required|phone">
				</div>
			</div>
		</div>
		<input type="hidden" name="Customer_state" /> <input type="hidden"
			name="Customer_user_id" /> <input type="hidden" name="private"
			value="private" />
	</form>

	<form hidden id="visit_div" class="layui-form"
		lay-filter="customer_visit">
		<input type="hidden" name="visit_customer_id" />
		<label class="layui-form-label">是否付款</label>
		<div class="layui-input-block">
			<input type="checkbox" lay-text="是|否" name="visit_payment"
				lay-skin="switch" lay-filter="payment">
		</div>

		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
				<label class="layui-form-label">付款金额</label>
				<div class="layui-input-inline">
					<input name="visit_money" type="text" class="layui-input kong"
						lay-verify="required" readonly>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">回访记录</label>
				<div class="layui-input-inline">
					<textarea name="visit_customer_info" placeholder="请输入内容" class="layui-textarea"
						style="width: 350px"></textarea>
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
					"Customer_addr" : "",
					"Customer_state" : 1,
					"Customer_user_id" : data.Customer_user_id,
					"Customer_liaison" : ""
				});
				layer.open({
					type : 1,
					title : '新增跟单客户信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("sys/customer_save", form.val("customer_save"),
								function() {
									layer.closeAll();
									layer.msg("添加跟单成功", {
										icon : 1,
										time : 2000
									});
									table.reload('privatecustomertable_id');
								});
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'refrash':
				table.reload('privatecustomertable_id', {
					url : 'sys/privatecustomer_list',
					where : {
						"check" : ''
					}
				});
				break;
			case 'select':
				table.reload('privatecustomertable_id', {
					url : 'sys/privatecustomer_list',
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
			case 'visit':
				form.val("customer_visit", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
					"visit_payment" : false, // "name": "value"
					"visit_money" : "0",
					"visit_customer_info" : "",
					"visit_customer_id":data.customer_id
				});
				layer.open({
					type : 1,
					title : '回访记录',
					area : [ '500px', '300px' ],
					content : $("#visit_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						var formdata=form.val("customer_visit");
						$.post("customer_visit", form.val("customer_visit"),
								function() {
									layer.closeAll();
									layer.msg("回访信息保存成功", {
										icon : 1,
										time : 2000
									});
								});
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'quit':
				layer.confirm("确定要取消对" + data.Customer_name + "的跟单吗?", {
					btn : [ "确定", "取消" ]
				}, function() {
					$.post("sys/customer_quit", data, function(d) {
						layer.msg(data.Customer_name + "已成为公有客户", {
							icon : 6,
							time : 2000
						});
						table.reload('privatecustomertable_id');
					});
				});
				break;
			}
		});
		form.on('switch(payment)', function(data) {
			if (this.checked) {
				//付款金额可填
					$("[name=visit_money]").removeAttr("readonly");
			} else {
				//不可填
				$("[name=visit_money]").val("0");
				$("[name=visit_money]").attr("readonly","readonly");
			}
		});
	</script>
</body>
</html>
,
