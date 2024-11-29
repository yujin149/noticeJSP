<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트문을 작성하기 위해 사용 -->
<%
request.setCharacterEncoding("UTF-8"); //모든 데이터를 UTF-8로 받음
%>
<!-- 회원가입에서 받아야하는 5가지 속성 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- id="빈이름", class="패키지.클래스명", scope="유효범위" page = 현재의 페이지에서만 사용 -->
<jsp:setProperty name="user" property="userID" />
<!-- name="빈이름", property="필드명", value="값" -->
<jsp:setProperty name="user" property="userPassword" />
<!-- joinAction페이지는 아이디, 비밀번호 외에도 이름, 성별, 이메일을 입력받아야 하므로 추가한다.  -->
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 프로그래밍 시험</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) { 
		userID = (String) session.getAttribute("userID"); 
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되었습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}


	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()"); 
			script.println("</script>");
		} else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='bbs.jsp'"); 
			script.println("</script>");
		}
	}
	%>
</body>
</html>