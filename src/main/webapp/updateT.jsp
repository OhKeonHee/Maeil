<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!-- 스크립트 문장 실행시 필요한 라이브러리 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="reply.Reply" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
.login {
overflow: hidden;
background-color: var(--app-container);
padding: 40px 30px 30px 30px;
border-radius: 10px;
position: absolute;
top: 50%;
left: 50%;
width: 70%;
height: 60%;
transform: translate(-50%, -50%);
}
</style>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID"); //로그인한 사람들은 해당아이디가 userID에 저장
        }
        if (userID == null) {//로그인이 안됐을 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'loginTest.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
       
        int bbsID = 0; // 게시글 번호
        if (request.getParameter("bbsID") != null) {
            bbsID = Integer.parseInt(request.getParameter("bbsID"));//게시글 번호 받아오기
        }
        Bbs bbs = new BbsDAO().getBbs(bbsID);
        
        
        int replyID = 0;
        if (request.getParameter("replyID") != null) {
            replyID = Integer.parseInt(request.getParameter("replyID"));//게시글 번호 받아오기
        }
        Reply reply = new ReplyDAO().getReply(replyID);
        
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
					<button id="login-btn" type="button" onclick="location.href='main.jsp';">log in</button>
					<button class="mode-switch" title="Switch Theme">
						<svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.3" width="40" height="40" viewBox="0 0 24 24">
						<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path></svg>
					</button> 
				</section>
			</div> 
			<div class="app-content">
				<div class="projects-section">
					<div class="login-section">
						<div class="login" id="formST">
							<div class = "container">
						        <div class="row">
						            <form method="post" action="replyUpdateAction.jsp?replyID=<%= replyID %>">
						            <!-- 데이터를 액션페이지로, 셀제로 글수정 -->
						                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						                    <thead>
						                        <tr><!-- 테이블의 행, 한줄 -->
						                            <th colspan="1" style="background-color: #eeeeee; text-align: center;">댓글 수정 양식</th>
						                        </tr>
						                    </thead>
						                    <tbody>
						                        <tr><!-- 테이블의 행, 한줄 -->
						                            <td><textarea class="form-control" placeholder="글 내용" name="replyContent" maxlangth="2048" style="height: 350px;"><%=reply.getReplyContent() %></textarea>
						                            </td>
						                        </tr>
						                    </tbody>
						                </table>
						                <!-- 데이터를 액션페이지로 -->
						                <input type="submit" class="btn btn-primary pull-right" value="글수정">
						            </form>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>