<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap: 해상도에 맞게 알아서 조절되는 탬플릿 같은거 -->  
<meta name ="viewport" content ="width-device-width",initial-scale="1">
<link rel = "stylesheet" href ="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		//로그인안하면 null 값
		//로그인한 사람이면 userid에 userid 변수값이 담기게된다.
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID =(String) session.getAttribute("userID");	
		}
	%>
	<nav class ="navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			<span class = "icon-bar"> </span>	
			<span class = "icon-bar"> </span>	
			<span class = "icon-bar"> </span>	
				
			</button>	
			<a class = "navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
	
		</div>
		
		<div class ="collapse navbar-collapse" id ="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>	
			</ul>
			<%
			
				//로그인 되어있지 않을 때만
				if(userID == null){
			%>	
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class = "droptown-toggle"
						data-toggle="dropdown" role ="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span> 
					
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>				
					
			<% 		
				//로그인이 되어있을 때
				} else {
			
			%>
			

			
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class = "droptown-toggle"
						data-toggle="dropdown" role ="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span> 
					
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
			
				}
			%>
			
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class = "droptown-toggle"
						data-toggle="dropdown" role ="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span> 
					</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		
		</div>
	
	</nav>
	
	<div class = "container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class=jumbotron" style="padding-top : 20px">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align:center;">로그인화면</h3>
				<div class ="from-group">
					<input type = "text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				
				</div>
				<div class ="from-group">
					<input type = "password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
				
				
				</form>
			</div>
	
	
		</div>
	
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js">	</script>
	<script src ="js/bootstrap.js"></script>
</body>
</html>