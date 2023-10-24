<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 자바빈즈 -->
<jsp:useBean id="user" class="user.User" scope="page"/>

<!--로그인 페이지에서 넘겨준 userID 를 받아서 한명의 사용자에 userID에 넣어줌  -->
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name ="viewport" content ="width-device-width",initial-scale="1">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
	
		//null이 아니면
		if(session.getAttribute("userID") != null){
			
		//세션값 넣기
		userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		//각각 입력된 값을 가져와서 login 함수 실행
		int result = userDAO.login(user.getUserID(),user.getUserPassword());

		//로그인 성공하면 메인페이지로
		if(result ==1){
			
			//세션값 넣기
			session.setAttribute("userID", user.getUserID());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'");
			script.println("</script>");
			
		}
		//비밀번호 실패
		else if(result == 0){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			//이 전으로 돌려보냄
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result == -1){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			//이 전으로 돌려보냄
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result == 2){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			//이 전으로 돌려보냄
			script.println("history.back()");
			script.println("</script>");
			
		}
		
	%>

</body>
</html>