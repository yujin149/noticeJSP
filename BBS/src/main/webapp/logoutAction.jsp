<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 프로그래밍 시험</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href='bbs.jsp';
	</script>
</body>
</html>