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
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>登录</title>

<style type='text/css'>
.td_red{
	border-style:solid;
	border-color:red;
	border-width:3px;
}

</style>
</head>
<body>
<!-- 注释 -->
登录界面
<div style = "height:200px;background-color:red;width=400px;"></div>
<!-- 表格 -->
<table style="border-style:solid;border-color:red;width=1px;">
<tr><td class = "td_red">1</td><td>2</td><td>3</td></tr>
<tr><td>1</td><td class = "td_red">2</td><td>3</td></tr>
<tr><td>1</td><td>2</td><td class = "td_red">3</td></tr>
</table>

<!-- 表单 -->
<form action="数据提交位置 " method="post">
手机号：<input name = 'tel' value="123"><br/><!-- br换行 -->

<input type="radio" name = "sex">男
<input type="radio" name = "sex">女<br/>

<input type="checkbox" name="hobby" value="ball"/>篮球
<input type="checkbox" name="hobby" value="run"/>跑步
<input type="checkbox" name="hobby" value="read"/>读书<br/>

pass:<input type="password" name="pass">

city:<select name="city">
	<option value="qd">青岛</option>
	<option value="qb">淄博</option>
</select>

<input type="button"  id="but_1" value="提交"/>

<a href="https://www.baidu.com">百度</a>

<!-- <img src="static/img/log.jpg""100px"/>  -->
</form>
<!-- 引入layui.all.js -->
<script type="text/javascript" src="static/layui/layui.all.js"></script>
<script type="text/javascript">
	var $ = layui.$;
	/*
	给but_1添加点击事件
	#是id选择器
	*/
	$("#but_1").click(function(){
		/* 显示手机号
			[]代表属性选择器
			val是设置value
		*/
		$("[name = tel]").val("123456789");
	});
	
</script>
</body>
</html>

