<%@page import="java.net.URLEncoder"%>
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
<style type="text/css">
body {
	margin-top: 20px;
	margin-left: 100px;
	margin-right: 100px
}

h1 {
	text-align: center;
}

table {
	
}

td {
	border-style: solid;
	border-width: 1;
	padding-left: 30px;
	padding-right: 30px;
	padding-left: 30px;
	padding-left: 30px
}

textarea {
	rows: 6
}
</style>
</head>

<body>
	<%
		//这句编码格式，必不可少
		request.setCharacterEncoding("utf-8");
		String replyContent = request.getParameter("replyContent");

		int postId = 0;
		Cookie[] cookies = request.getCookies();
		String username = "", password = "";
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("username")) {
					username = c.getValue();
				}
				if (c.getName().equals("password")) {
					password = c.getValue();
				}
				if (c.getName().equals("postid")) {
					postId = Integer.parseInt(c.getValue());
				}
				if (postId != 0) {
					continue;
				} else {
					Cookie postIdCookie = new Cookie("postid",
							request.getParameter("postid"));
					System.out.println(request.getParameter("postid"));
					postIdCookie.setMaxAge(864000);
					response.addCookie(postIdCookie);
				}
			}
		}
		if (replyContent != null) {
			ReplyDAO rd = new ReplyDAO();
			Reply reply = new Reply();
			System.out.println("replyContent:" + replyContent);
			String content = URLEncoder.encode(replyContent, "utf-8");
			reply.setPostId(postId);
			reply.setUserName(username);
			reply.setContent(replyContent);
			rd.postReply(reply);
		}
		PostDAO pd = new PostDAO();
		Post post = pd.getPostById(postId);
		ArrayList<Reply> replys = new ReplyDAO().getReply(postId);
	%>
	<h1>班级BBS</h1>
	<h2><%=post.getTitle()%></h2>
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
	<form name="textform" action="detail.jsp" method="post">
		<textarea name="replyContent">
		</textarea>
		<input type="submit" value="回复" />
	</form>
</body>
</html>
