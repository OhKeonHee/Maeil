<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 스크립트 문장 실행시 필요한 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>

<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %> 
<%@ page import="java.util.ArrayList" %><!-- 게시판의 목록을 출력하기 위해서 필요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>



	<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); //로그인한 사람들은 해당아이디가 userID에 저장
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
</nav>
	
	

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
						<form class="bbs">
						<h1>QnA 게시판</h1><br>
							<div class = "container">
								<div class="row">
									<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
										<thead>
											<tr><!-- 테이블의 행, 한줄 -->
												<th style="background-color: var(--chatbox-color); text-align: center; color: #fff;">번호</th>
												<th style="background-color: var(--chatbox-color); text-align: center; color: #fff;">제목</th>
												<th style="background-color: var(--chatbox-color); text-align: center; color: #fff;">작성자</th>
												<th style="background-color: var(--chatbox-color); text-align: center; color: #fff;">작성일</th>
											</tr>
										</thead>
										<tbody><!-- 게시글 업로드 될부분 -->
											<%
												BbsDAO bbsDAO = new BbsDAO(); //게시글을 뽑아올 수 있도록 인스턴스생성
												ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
												for(int i = 0; i < list.size(); i++) { // 모든 게시글 불러옴
											%>
											<tr>
												<td><%= list.get(i).getBbsID() %></td> <!--게시글 번호 리턴-->
												<!-- 제목을 눌렀을때 해당 게시물로 이동, 해당번호에 맞는 페이지 나올 수 있게 -->
												<td><a style="color: #000000;" href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a>
												</td> <!-- 게시글 제목 리턴 -->
												<td><%= list.get(i).getUserID() %></td><!-- UserID리턴 -->
												<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td><!-- 작성 시간 리턴 -->
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
									 <!-- 페이지 이동 -->
									 <div class="reply-area">
									<%
										if(pageNumber != 1) { //현재 페이지가 있는지, 버튼 생성
									%>
										<a href = "bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn text-white float-left" style="background-color:var(--chatbox-color);">이전</a>
									<%
										} if(bbsDAO.nextPage(pageNumber + 1)) { //다음 페이지가 존재하는지
									%>
										<a href = "bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn text-white float-right" style="background-color:var(--chatbox-color);">다음</a>
									<% 
										}
									%>			
									<div style="position: absolute; bottom: 7%;">
									<a href="write.jsp" class="btn text-white" style="background-color:var(--chatbox-color);">글쓰기</a></div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>

 