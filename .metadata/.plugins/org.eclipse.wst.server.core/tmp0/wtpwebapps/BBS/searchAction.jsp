<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/style.css">
<title>JSP 프로그래밍 시험</title>
</head>
<body>
	<div class="bbsWrap">
		<nav class="navWrap">
			<h1>
				<a href="bbs.jsp">JSP 프로그래밍 시험</a>
			</h1>
			<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			%>

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
			<div class="searchWrap">
				<form action="searchAction.jsp" method="get">
					<select name="searchField">
						<option value="bbsTitle">제목</option>
						<option value="userID">작성자</option>
					</select>
					<div class="search">
						<input type="text" name="searchText" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn">검색</button>
					</div>
				</form>
			</div>

			<div class="tableWrap">
				<table>
					<colgroup>
						<col style="width: 8%">
						<col style="width: *">
						<col style="width: 16%">
						<col style="width: 16%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						String searchField = request.getParameter("searchField");
						String searchText = request.getParameter("searchText");

						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getSearch(searchField, searchText);

						if (list.size() == 0) {
							out.println("<tr><td colspan='4'>검색 결과가 없습니다.</td></tr>");
						} else {
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr
							onclick="location.href='view.jsp?bbsID=<%=list.get(i).getBbsNum()%>';">
							<td><%=list.get(i).getBbsNum()%></td>
							<td style="text-align: left;"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%>
							</td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBbsDate().substring(0, 11)%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="btnWrap">
				<a href="bbs.jsp" class="btn btn-primary">목록</a>
				<%
				if (userID != null) {
				%>
				<a href="write.jsp" class="btn btn-primary green-btn">글쓰기</a>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>