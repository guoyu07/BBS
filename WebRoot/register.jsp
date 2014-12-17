<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>

	<h2 align="center">欢迎注册</h2>
	<hr>
	<div align="center">
		<table bgcolor="#46A3FF">
			<tr>
				<td>用户名</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>电话号码</td>
				<td><input type="text" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="提交" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
