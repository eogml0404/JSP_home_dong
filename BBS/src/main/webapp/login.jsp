<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap: 해상도에 맞게 알아서 조절되는 탬플릿 같은거 -->  
<meta name ="viewport" content ="width-device-width",initial-scale="1">

<!-- 스타일 시트참조 -->
<link rel = "stylesheet" href ="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class ="navbar navbar-default">
		<!-- 로그같은걸 담는 영역 -->
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			<!-- 하나의 작대기 -->
			<span class = "icon-bar"> </span>	
			<span class = "icon-bar"> </span>	
			<span class = "icon-bar"> </span>	
				
			</button>	
			<!-- brand : 로고 -->
			<a class = "navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
	
		</div>
		
		<div class ="collapse navbar-collapse" id ="bs-example-navbar-collapse-1">
			<!-- 리스트 보여줄 때 사용 -->
			<ul class = "nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>	
			</ul>
			
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class = "droptown-toggle"
						data-toggle="dropdown" role ="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span> 
					
					</a>
					<ul class="dropdown-menu">
						<!-- active : 현재 선택이 되었다는 뜻 -->
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		
		</div>
	
	</nav>
	
	<div class = "container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 로그인 양식이 들어가는곳 -->
			<div class=jumbotron" style="padding-top : 20px">
				<!-- form 양식 post: 숨기면서 보냄 -->
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align:center;">로그인화면</h3>
				<div class ="from-group">
					<!-- placeholder : 아무것도 입력안됐을 때 아이디 길이 20 -->
					<input type = "text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				
				</div>
				<div class ="from-group">
					<input type = "password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				
				</div>
				<!-- 로그인 버튼 -->
				<input type="submit" class="btn btn-primary form-control" value="로그인">
				
				
				</form>
			</div>
	
	
	</div>
	
	<!-- 애니메이션을 담당할 jsp ,j쿼리와 js참조 -->
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js">	</script>
	<script src ="js/bootstrap.js"></script>
</body>
</html>