<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meail.GetWorddic" %>
<%@ page import="meail.CompareKeyword" %>
<%@ page import="meail.Request" %>
 <%@ page import="meail.SelectQuest" %>  
 <%@ page import="meail.Main" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
    
<!DOCTYPE html>
<html>
<head>	<meta charset="UTF-8">
	<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			var d = $("#chatbox").serialize()
			$.ajax({
				url: "realAction.jsp",
				type: "POST",
				data: d,
				success: function (result) {
					$("#res").text(result);
				}
				});
		});
	});
 
</script>

</head>
<body>

	질문을 입력하세요 : 
	<div id="chatform" >
		<input id="chatbox" type="text" name="chatbox">
		<button id="btn">질문 입력</button>
	</div>
	

	<p id="res"></p> 
	
	
  	<%= SelectQuest.FinalQuest %>
  	<%= SelectQuest.QR %>
  	
</body>

</html>