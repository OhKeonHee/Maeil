<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>login</title>
		<link rel="stylesheet" href="css/custom.css">
	</head>
	<body>
		<div class="app-container">
			<div class="app-header">
				<button class="home-btn" onClick="location.href='main.jsp';">
					<img src=https://ifh.cc/g/AtNydN.png />
				</button>
				<section>
					
					<button class="mode-switch" title="Switch Theme">
						<svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.3" width="40" height="40" viewBox="0 0 24 24">
						<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path></svg>
					</button> 
				</section>
			</div> 
			<div class="app-content">
				<div class="projects-section">
				  <div class="login-section">
					<h3>서일대학교 챗봇 "매일" 로그인</h3>
					<p>챗봇 "매일" 서비스를 이용하시려면 <br/> 아이디와 비밀번호를 입력하시기 바랍니다.
					<form class="login" method="post" action="loginAction.jsp">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						<input type="submit" class="btn btn-primary form-control" value="로그인">
					</form>
					<p>
						<!-- 공지 삽입 -->
					</p>
				</div>
			</div>
		</div>
	</div>
	<script src="script/main.js"></script>
	</body>
</html>