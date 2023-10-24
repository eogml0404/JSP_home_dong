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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>	
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
			</div>
			</nav>
			<div class="container">
				<div class = "row">
				
				<!-- 보내지는 내용이 숨겨서 보내짐 -->
				<form method="post" action="writeAction.jsp">
					<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align : center;">게시판 글쓰기 양식</th>
			
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- input은 특정 값을 보내기 위해 사용 -->
							<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>	
						
							<!-- textarea : 장문의 글을 입력할 때 -->
							<td><textarea class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048" style="height : 350px;"></textarea></td>
						</tr>
						
						
					
					</tbody>
					</table>
				
					<input type ="submit" class="btn brimary pull-right" value="글쓰기">
				</form>

				
				</div>
			
			</div>
			
	
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js">	</script>
	<script src ="js/bootstrap.js"></script>
</body>
</html>