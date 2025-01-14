<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/style.css">
<title>JSP 프로그래밍 시험</title>
</head>
<body>
	<div class="bbsWrap">
		<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 먼저하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		%>
		<nav class="navWrap">
			<h1>
				<a href="bbs.jsp">JSP 프로그래밍 시험</a>
			</h1>

			<%
			if (userID == null) {
			%>
			<ul class="userMenu">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="userMenu">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			<%
			}
			%>
		</nav>

		<div class="container">
			<div class="tableWrap writeTable">
				<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
					<table>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="제목을 입력해주세요." name="bbsTitle" maxlength="50"
									value="<%=bbs.getBbsTitle()%>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control"
										placeholder="내용을 입력해주세요." name="bbsContent" maxlength="2048"><%=bbs.getBbsContent()%></textarea></td>

							</tr>
						</tbody>

					</table>

			</div>
			<div class="btnWrap" style="justify-content: flex-end;">
				<input type="submit" class="btn btn-primary pull-right green-btn" value="글 수정">
			</div>
			</form>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>