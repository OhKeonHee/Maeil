<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meail.GetWorddic" %>
<%@ page import="meail.CompareKeyword" %>
<%@ page import="meail.Request" %>
<%@ page import="meail.SelectQuest" %>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
	

	<%
		String userQuestion = request.getParameter("chatbox");
		String result = null; 
	
		GetWorddic gw = new GetWorddic();
		gw.GetWorddic();
		
		Request rq = new Request();
		rq.setQuestion(userQuestion);
		rq.Request();
		
		CompareKeyword ck = new CompareKeyword();
		ck.CompareKeyword();
		
		SelectQuest sq = new SelectQuest();
		sq.SelectQuest();
		
		
	%>
	
