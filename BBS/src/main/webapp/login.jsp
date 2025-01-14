<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body style="width:100vw; height:100vh; background:#f5f5f5;">
	
	<nav class="navWrap">
		<h1>
			<a href="bbs.jsp">JSP 프로그래밍 시험</a>
		</h1>

		<ul class="userMenu">
			<li class="active"><a href="login.jsp">로그인</a></li>
			<li><a href="join.jsp">회원가입</a></li>
		</ul>
	</nav>
	
	<div class="container loginWrap">
			<h2>로그인</h2>
			<div class="jumbotron"">
				<form method="post" action="loginAction.jsp">
					<ul>
						<li><input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20"></li>
						<li><input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20"></li>
					</ul>

					<input type="submit" class="btn loginBtn"
						value="로그인">
				</form>
			
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>