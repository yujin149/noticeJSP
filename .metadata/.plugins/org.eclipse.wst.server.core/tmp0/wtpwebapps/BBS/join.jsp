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
<body style="width: 100vw; height: 100vh; background: #f5f5f5;">
	<nav class="navWrap">
		<h1>
			<a href="bbs.jsp">JSP 프로그래밍 시험</a>
		</h1>

		<ul class="userMenu">
			<li><a href="login.jsp">로그인</a></li>
			<li class="active"><a href="join.jsp">회원가입</a></li>
		</ul>
	</nav>
	<div class="container loginWrap">
		<h2>회원가입</h2>
		<div class="jumbotron">
			<form method="post" action="joinAction.jsp">
			<ul>
				<li>
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</li>
				<li>
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</li>
				<li>
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
				</li>
				<li class="radioList">
					<label class="btn btn-primary active"> <input type="radio"
							name="userGender" autocomplete="off" value="남자" checked><span>남자</span></label>
					<label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="여자"><span>여자</span></label>
				</li>
				<li>
					<input type="email" class="form-control" placeholder="이메일"
						name="userEmail" maxlength="20">
				</li>
				
			</ul>
				
				<input type="submit" class="loginBtn" value="회원가입">
			</form>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>