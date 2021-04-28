<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<style>
		html, body {
			display: flex;
			align-items: center;
 			justify-content: center;
			margin:0;
			height:100%;
			width:100%;
			height:100%;
			background:#f2f4f7;
		}
		
	a:link { color:#858585; }
	a:visited { color:#858585; }
	a:hover { color:#0068ff; }
	a:active { color:blue; }
	</style>
</head>
<%
	String sessionId = (String)session.getAttribute("loginId");
	String sessionStatus = (String)session.getAttribute("logined");

%>
<body>
<%if(sessionStatus.equals("successLogin")){%>
<script>
	document.location.href= "/";
</script>
<% }%>
<form method="POST" action="login">
<div class="text-center mb-5">
	<h1 class="mb-0">로그인</h1>
	<h5 class="mb-3">login</h5>
	<div class="input-group text-center p-5 border border-primary rounded" style="width:400px; margin-left: auto; margin-right: auto; background:white;">
		<div style="width:100%;">
			<div class="text-left">
				<label>아이디</label>
			</div>
			<input type="text" id="inputId" name="inputId" class="form-control border-left-0 border-right-0 border-top-0 rounded-0" placeholder="아이디를 입력하세요." required="required">
			<div class="text-right mt-2 mb-5">
				<a href="#" class="text-right" style="text-decoration: none;">계정을 잊으셨나요?</a>
			</div>
			<div class="text-left">
				<label>비밀번호</label>
			</div>
			<input type="password" name="inputPwd" class="form-control border-left-0 border-right-0 border-top-0 rounded-0" placeholder="비밀번호를 입력하세요." required="required">
				<% if(sessionStatus.equals("failed")){ %>
					<label style="font-size:80%; color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</label>
				<%} %>
				<div class="mt-5">
					<a href="account" class="text-right" style="text-decoration: none; float:left;">회원가입</a>		
					<input type="submit" class="btn btn-primary" style="float:right;" value="제 출"/>				
				</div>
		</div>
	</div>
</div>
</form>
</body>
</html>