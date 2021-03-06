<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="dao.PostDAO"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="entity.Post"%>
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

<title></title>

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
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		UserDAO ud = new UserDAO();
		User user = new User();
		user.setName(username);
		user.setPassword(password);
		if (type.equals("login")) {
			boolean flag = ud.loginUser(user);
			if (flag == false) {
				response.sendRedirect("login.jsp");
			}
		} else {
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			ud.addUser(user);
		}
		Cookie usernameCookie = new Cookie("username", username);
		Cookie passwordCookie = new Cookie("password", password);
		//最大生存期限
		usernameCookie.setMaxAge(864000);
		passwordCookie.setMaxAge(864000);
		response.addCookie(usernameCookie);
		response.addCookie(passwordCookie);
	%>
	<!-- 
	<jsp:useBean id="user1" class="entity.User" scope="page" />
	<jsp:setProperty name="user1" property="*" />
	<%/*
			 if (user.getName() != null) {
			 ud.addUser(user1);
			 }*/%>
	 -->
	<h2>帖子列表</h2>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>标题</td>
			<td>发帖人</td>
			<td>时间</td>
		</tr>
		<%
			PostDAO pd = new PostDAO();
			ArrayList<Post> posts = pd.getAllPosts();
			for (int i = 0; i < posts.size(); i++) {
				Post post = posts.get(i);
		%>
		<tr>
			<%
				out.println("<td><a href='detail.jsp?postid=" + post.getId()
							+ "'>" + post.getTitle() + "</a></td>");
			%>
			<td><%=post.getUserName()%></td>
			<td><%=post.getTime()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
