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

			<div class="tableWrap viewTable">
				<table>
					<colgroup>
						<col style="width: 16%">
						<col style="width: *">
					</colgroup>
					<thead>
						<tr>
							<th colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td class="tit">작성자</td>
							<td class="text"><%=bbs.getUserID()%></td>
						</tr>

						<tr>
							<td class="tit">작성일자</td>
							<td class="text"><%=bbs.getBbsDate().substring(0, 11)%></td>
						</tr>

						<tr>
							<td colspan="2" class="text textBox"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>

						</tr>

					</tbody>
				</table>
			</div>
			<div class="btnWrap">
				<div class="prevnextBtn">
					<%
					if (userID != null && userID.equals(bbs.getUserID())) {
					%>
					<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')"
						href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
					<%
					}
					%>
				</div>
				<a href="bbs.jsp" class="btn btn-primary green-btn">목록</a>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

</body>
</html>