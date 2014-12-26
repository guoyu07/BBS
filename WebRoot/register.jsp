<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.UserDAO"%>
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
<script type="text/javascript">
	function validate_form(thisform) {
		with (thisform) {
			if (username.value == "") {
				alert("用户名不能为空");
				return false;
			}
			if (password.value == "") {
				alert("密码不能为空");
				return false;
			}
			if (password.value != repassword.value) {
				alert("两次密码不一致");
				repassword.value = "";
				return false;
			}
			apos = email.value.indexOf("@");
			dotpos = email.value.lastIndexOf(".");

			if (apos < 1 || dotpos - apos < 2) {
				alert("邮箱格式不正确");
				return false;
			}
			return true;
		}
	}
</script>

</head>

<body>

	<h2 align="center">欢迎注册</h2>
	<hr>
	<div align="center">
		<form action="posts.jsp?type='register'"
			onsubmit="return validate_form(this);" method="post">
			<table bgcolor="#46A3FF">
				<tr>
					<td>用户名</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="text" name="password" /></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="text" name="repassword" /></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>电话号码</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
