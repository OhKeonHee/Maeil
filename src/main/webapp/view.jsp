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

        int bbsID = 0;
        if (request.getParameter("bbsID") != null) {
            bbsID = Integer.parseInt(request.getParameter("bbsID"));//게시글 번호 받아오기
        }
        
        int pageNumber=1;
		// pageNumber는 URL에서 가져온다.
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		
        if (bbsID == 0) {//번호가 반드시 존재하는지 확인
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = 'bbs.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
  
        Bbs bbs = new BbsDAO().getBbs(bbsID); // 유효한 글이라면 구체적인 정보를 bbs에 담음
        
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
    <div class="container">
		<div class="row">
			<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd;">
				<tr>
					<th colspan="3"
						style="background-color: var(--chatbox-color); text-align: center; color: #fff;">게시판 글보기					
					</td>
				</tr>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성자</td>
					<td colspan="2"><%=bbs.getUserID()%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일자</td>
					<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
					+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
				</tr>
				<tr>
					<td colspan="2" style="height: 200px; width:100%; text-align: left;">
					<%=
					bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") 
					%></td>
				</tr>
			</table>
			<form method="post" action="replyAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table" style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: var(--chatbox-color); text-align: center; color: #fff;">댓글</th>
						</tr>
					</thead>
					<tbody>
			
			
						<%
							ReplyDAO replyDAO=new ReplyDAO();
							ArrayList<Reply> list=replyDAO.getList(bbsID);
							for(int i=0; i<list.size(); i++){
							
						%>

						<tr>
							<td style="text-align: left;"><%= list.get(i).getReplyContent() %></td>
							<td style="text-align: right;"><%= list.get(i).getUserID() %>
							<a href="updateT.jsp?replyID=<%= list.get(i).getReplyID() %>" class="btn btn-link">수정</a>
							<a href="deleteReplyAction.jsp?bbsID=<%= bbsID %>" class="btn btn-link">삭제</a>
							</td>
						</tr>
					
						<%
								}
						%>
					</tbody>
				</table>
			<div class="reply-area">
						<textarea placeholder="댓글을 입력하세요." class="replybox" name="replybox" maxlength="2048" resize: "none" minlength="2" rows="3"></textarea>
						<input type="submit" class="btn text-white float-right" style="background-color:var(--chatbox-color);" value="댓글입력">
				<div class="container">
				<a href="bbs.jsp" class="btn text-white" name="list" style="background-color:var(--chatbox-color);">목록</a>
				
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
				<div class="btn-group float-right">
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn text-white" style="background-color:var(--chatbox-color);">수정</a>		
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"  href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn text-white" style="background-color:var(--chatbox-color);">삭제</a>
			
				<%
					}
				%>
				</div>
				</div>
				</div>
		</div>
	</div>
	</form>
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
