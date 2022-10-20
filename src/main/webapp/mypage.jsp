<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 스크립트 문장 실행시 필요한 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %> <!-- view.jsp에서 추가생성 -->
<%@ page import="bbs.BbsDAO" %> <!-- view.jsp에서 추가생성 -->
<%@ page import="reply.Reply" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
					<div class="p-3">			
		    			<div>
		    			   	<form class="bbs" style="display: flex; justify-content: center;">		
					    	<div class="row">
							<div class="col-12 col-md-auto text-center">
						        <img src="images/유저이미지.png" class="rounded" alt="user">
						    </div>
						    <div class="col">
							    <div class="row p-5">
								    <div class="col-auto">
									    <div class="title mb-5">내 정보</div>
									    <ul class="list-unstyled">
										    <h5>아이디 : userID불러오기</h5>
										    <h5>이름 : username불러오기</h5>
										    <h5>이메일 : userE-mail불러오기</h5>
									    </ul>
								    </div><!--//primary-info-->
								    <div class="col-auto mt-2">
									    <ul class="list-unstyled">
							                <li class="mb-2"><a class="user-text-link" href="#">회원정보 변경</a></li>
							                <li><a class="text-link" href="#">회원탈퇴</a></li>
							            </ul>
								    </div>
							    </div>					    
						    </div>
					        </div>
					        </form>
					    </div>
					  </div>
					    <div class="p-3">
			    			<div>
			    			<form class="bbs">
						    	<h1>내가 작성한 게시글</h1>
						    	<br>
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
										
									</table>
									 <!-- 페이지 이동 -->
									 
							</div>
					        </div>
					        </form>
					    </div>
					 </div>
					</div>
				</div>
			</div>

			    
		  
		    
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
