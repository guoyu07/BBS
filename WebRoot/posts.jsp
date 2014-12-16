<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="dao.PostDAO"%>
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
	<h2>帖子列表</h2>
	<table>
		<tr>
			<td>标题</td>
			<td>发帖人</td>
			<td>时间</td>
		</tr>
		<%
			PostDAO pd = new PostDAO();
			ArrayList<Post> posts = pd.getAllPosts();
			//for (int i = 0; i < posts.size(); i++) {	
			Post post = posts.get(0);
		%>
		<tr>
		<td><%=post.getTitle()%></td>
		<td><%=post.getUserName()%></td>
		<td><%=post.getTime()%></td>
		</tr>
		<%
			//}
		%>
	</table>
</body>
</html>
