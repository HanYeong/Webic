<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<body>
	<%
		String imgsrc = "/imgs/account_person.png";
	%>
<form action="create" method="POST">

<div class="text-center">
	<h1 class="mb-0">회원가입</h1>
	<h5 class="mb-3">account</h5>
	<div class="input-group text-center p-5 border border-primary rounded" style="width:600px; margin-left: auto; margin-right: auto; background:white;">
		<div class="pr-3" style="width:50%; height:100%;">
			<div class="text-left">
				<label>아이디</label>
			</div>
			<div>
				<input type="text" class="form-control border-left-0 border-right-0 border-top-0 rounded-0"
				placeholder="아이디 account" name="accountId" id="accountId" onkeyup="nick_example();" onfocusout="idcheck();">
			</div>
			<div class="text-left mb-4">
				<label class="m-0" id="okayId" style="display: none; color: green;">사용 가능한 아이디입니다.</label>
				<label style="display: none;">이미 사용 중인 아이디입니다.</label>
			</div>
			<div class="text-left">
				<label class="m-0">비밀번호</label>
			</div>
			<div class="mb-4">
				<input type="password" class="form-control border-left-0 border-right-0 border-top-0 rounded-0" placeholder="비밀번호 password">
			</div>
			<div class="text-left">
				<label class="m-0">비밀번호 확인</label>
			</div>
			<div>
				<input type="password" class="form-control border-left-0 border-right-0 border-top-0 rounded-0" onfocusout="pwdcheck();" placeholder="비밀번호 확인">
			</div>
			<div class="text-left mb-4">
				<label class="m-0" id="okayPwd" style="display: none; color: green;">비밀번호가 일치합니다.</label>
				<label style="display: none;">비밀번호가 일치하지 않습니다.</label>
			</div>
			<div class="mb-4">
				<input type="text" class="form-control border-left-0 border-right-0 border-top-0 rounded-0" placeholder="이름 name">
			</div>
			<div class="mb-4">
				<input type="text" class="form-control border-left-0 border-right-0 border-top-0 rounded-0"
				placeholder="닉네임 nickname" onkeyup="nick_example();" id="nickId">
			</div>
		</div>
		<div class="pl-3" style="width:50%; height:100%;">
			<div class="border-top border-bottom" style="width:100%; height:100%; margin-left: auto; margin-right: auto;">
				<img src="<%=imgsrc%>" style="width:50%; height:50%; ">
			</div>
			<div class="mt-2">
				<input type="button" class="btn btn-outline-primary" style="float:right;" value="변 경"/>	
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<div class="text-left">
				<label>미리보기</label>
			</div>
			<div>
				<img src="<%=imgsrc%>" class="float-left" style="width:30px; height:30px;">
				<input type="text" id="exampleId" readonly="readonly" style="width:200px; height:30px; border:0px;" value="example">
			</div>
			<input type="submit" class="btn btn-primary" style="float:right; margin-top:90px;" value="제 출"/>	
		</div>
	</div>
</div>
</form>
<script>

function idcheck(){
	$('#okayId').css("display", "block");
}

function pwdcheck(){
	$('#okayPwd').css("display", "block");
}

function nick_example(){
	if(document.getElementById('nickId').value == ""){
		if(document.getElementById('accountId').value == ""){
			document.getElementById('exampleId').value = "example";
		}else{
			document.getElementById('exampleId').value = document.getElementById('accountId').value;
		}
	}else{
		document.getElementById('exampleId').value = document.getElementById('nickId').value;
	}
}
</script>
</body>
</html>