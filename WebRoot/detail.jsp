<%@page import="dao.PostDAO"%>
<%@page import="dao.ReplyDAO"%>
<%@page import="entity.Post"%>
<%@page import="entity.Reply"%>
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

<title>My JSP 'detail.jsp' starting page</title>

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
		PostDAO pd = new PostDAO();
		int postId = Integer.parseInt(request.getParameter("postid"));
		Post post = pd.getPostById(postId);
		ArrayList<Reply> replys = new ReplyDAO().getReply(postId);
	%>
	<h2><%=post.getTitle() %></h2>
	<hr>
	<table>
		<tr>
			<td><%=post.getUserName()%></td>
			<td><%=post.getContent()%></td>
		</tr>
		<%
			for (int i = 0; i < replys.size(); i++) {
				Reply reply = replys.get(i);
		%>
		<tr>
			<td><%=reply.getUserName()%></td>
			<td><%=reply.getContent()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
