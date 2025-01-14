<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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

		<!-- 게시판 페이지 컨텐츠 영역 -->
		<div class="container">
			<div class="tableWrap writeTable">
				<form method="post" action="writeAction.jsp">
					<table>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="제목을 입력해주세요." name="bbsTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea class="form-control"
										placeholder="내용을 입력해주세요." name="bbsContent" maxlength="2048"></textarea></td>
							</tr>
						</tbody>
					</table>
			</div>
			<div class="btnWrap" style="justify-content: flex-end;">
				<input type="submit" class="btn btn-primary pull-right green-btn"
					value="글쓰기">
			</div>
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>