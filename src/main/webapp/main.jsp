<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="meail.GetWorddic" %>
    <%@ page import="meail.CompareKeyword" %>
    <%@ page import="meail.Request" %>
    <%@ page import="meail.SelectQuest" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서일대학교 챗봇</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); //로그인한 사람들은 해당아이디가 userID에 저장
	}
%>

<nav class="main-menu">
	<ul>
		<li>
			<i class="fa fa-bars" aria-hidden="true"></i>
			<span class="nav-text"></span>
		</li>
		<li>
			<a href="mypage.jsp">
				<i class="fa fa-address-card" aria-hidden="true"></i>
				<span class="nav-text">마이페이지</span>
			</a>
		</li>
		<li>
			<a href="main.jsp">
				<i class="fa fa-commenting-o" aria-hidden="true"></i>
				<span class="nav-text">챗봇</span>
			</a>
		</li>
		<li>
			<a href="bbs.jsp">
				<i class="fa fa-laptop fa-2x"></i>
				<span class="nav-text">게시판</span>
			</a>
		</li>
	</ul>
	
	<% // 로그인이 되어있지 않은 사람들만 로그인 회원가입 보이게
		if(userID == null) {
	%>
	<ul class="logout">
		<li>
			<a href="loginTest.jsp">
				<i class="fa fa-power-off fa-2x"></i>
				<span class="nav-text">Login</span>
			</a>
		</li>  
	</ul>
	<%//로그인이 되어있다면
		} else {
	%>
	<ul class="logout">
		<li>
			<a href="logoutAction.jsp">
				<i class="fa fa-power-off fa-2x"></i>
				<span class="nav-text">Logout</span>
			</a>
		</li>  
	</ul>
	<%
		}
	%>
	
<!-- 	
	<ul class="logout">
		<li>
			<a href="loginTest.jsp">
				<i class="fa fa-power-off fa-2x"></i>
				<span class="nav-text">Login</span>
			</a>
		</li>  
	</ul> -->
</nav>



	<div class="app-container">
		<div class="app-header">
			<button class="home-btn" onClick="location.href='main.jsp';">
				<img src=https://ifh.cc/g/AtNydN.png />
			</button>
			<button class="mode-switch" title="Switch Theme">
				<svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.3" width="40" height="40" viewBox="0 0 24 24">
				<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path></svg>
			</button> 
		</div> 
		
		 <!--챗봇영역-->
		<div class="app-content">
			<div class="projects-section">
				<main class="page__main">
					<div class="block--background">
						<div class="chatbot__overview">
							<!-- 채팅 내용 -->
							<ul class="chatlist">
								<li class="bot__output bot__output--standard">안녕하세요, 서일대학교 챗봇 "매일"이에요😊</li>
								<li class="bot__output bot__output--standard">궁금한 부분이 있나요? 언제나 여러분의 궁금증을 해결해주는 챗챗이 바로 답변해 드려요!😘</li>
							</ul>
						</div>
						<!-- 채팅 입력 -->
						<div class="chatbox-area">
							<form action="realAction.jsp" id="chatform" >
								<textarea placeholder="질문을 입력하세요." class="chatbox" name="chatbox" resize: "none" minlength="2"></textarea>
								<input class="submit-button" type="submit" value="전송">
							</form>
						</div>
					</div>
				</main>
			</div>
			<!--  FAQ -->
			<div class="messages-section">
				<div class="container">
					<h1 class="title">자주 질문하는 정보</h1>
					<p class="message-line">
						신입생/재학생에 따라 자주 질문하는 카테고리를 모아놨어요.  
					</p>
					<ul>
						<li class="dropdown">
							<a href="#" data-toggle="dropdown">신입생</a>
							<ul class="dropdown-menu">
								<li><img src="images/학사일정.png" ><input type="button" id="button1" value="학사일정" onclick="buttonchat1()" ></li>
								<li><img src="images/등록금 안내.png"><input type="button" id="button2" value="등록금 안내" onclick="buttonchat2()" ></li>
								<li><img src="images/교내연락처.png"><input type="button" id="button3" value="교내 연락처" onclick="buttonchat3()" ></li>
								<li><img src="images/캠퍼스 맵.png"><input type="button" id="button4" value="캠퍼스 맵" onclick="buttonchat4()" ></li>
								<li><img src="images/학점관리.png"><input type="button" id="button5" value="학점관리" onclick="buttonchat5()" ></li>
								<li><img src="images/장학금 안내.png"><input type="button" id="button6" value="장학금 안내" onclick="buttonchat6()" ></li>
								<li><img src="images/e-Campus.png"><input type="button" id="button7" value="e-Campus" onclick="buttonchat7()" ></li>									<li><img src="images/수강신청.png"><input type="button" id="button8" value="수강신청" onclick="buttonchat8()" ></li>
								<li><img src="images/도서관.png"><input type="button" id="button9" value="도서관" onclick="buttonchat9()" ></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" data-toggle="dropdown">재학생</a>
							<ul class="dropdown-menu">
							</ul>
						 </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
        <script src="script/main.js"></script>
</body>
</html>