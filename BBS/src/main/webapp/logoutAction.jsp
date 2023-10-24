<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Contents-Type" content="text/html; charset=UTF-8">


<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		
		//접속한 회원 세션뻇어서 로그아웃시켜줌
		session.invalidate();
	
	
		
	%>
	<script>
		location.href= 'main.jsp';
	</script>
</body>
</html>