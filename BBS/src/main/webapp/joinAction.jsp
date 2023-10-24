<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>

<!--로그인 페이지에서 넘겨준 userID 를 받아서 한명의 사용자에 userID에 넣어줌  -->
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name ="viewport" content ="width-device-width",initial-scale="1">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>


	<%	String userID = null;
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
	
	
		if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName() ==null || 
		user.getUserGender() ==null || user.getUserEmail()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			//이 전으로 돌려보냄
			script.println("history.back()");
			script.println("</script>");
			
		} else{
			
			//데이터 베이스 접근할 수 있는 객체
			UserDAO userDAO = new UserDAO();
		
			//join사용 각각의 변수들을 입력받아서 join함수를 수행
			int result = userDAO.join(user);
	
			//데이터베이스 오류가 발생하면서 result가 -1
			//userId = primary key
			if(result == -1){
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				//이 전으로 돌려보냄
				script.println("history.back()");
				script.println("</script>");
				
			}
		
		
			//회원가입 완료
			else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
		
			//성공하면 메인페이지
			script.println("location.href='main.jsp'");
			script.println("</script>");
			
			}
		
			
		}
	
		
	%>

</body>
</html>