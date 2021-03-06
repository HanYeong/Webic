<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Webic</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="/js/howler.js"></script>
	<style>
		.body {
			width:100%;
			height:100%;
		}
	</style>
</head>
<%
	String sessionId = (String)session.getAttribute("loginId");
	String sessionStatus = (String)session.getAttribute("logined");
%>
<body>
<input type="hidden" id="idc" value="<%=sessionId %>"/>
<div class="text-center">
	<div class="text-right mb-5">
	<%if(sessionStatus != null && sessionStatus.equals("successLogin")){ %>
		<input type="button" class="btn btn-outline-success mr-2" Onclick="location.href='edit'" value="음악 리스트">
		<input type="button" class="btn btn-outline-success mr-2" Onclick="location.href='play'" value="음악 플레이어">	
		<input type="button" class="btn btn-outline-primary mr-2" Onclick="location.href='logout'" value="로그아웃">	
	<%}else{ %>
		<input type="button" class="btn btn-outline-primary mr-2" Onclick="location.href='login'" value="로그인">	
	<%} %>
	</div>
	<a href="/"><img src="/imgs/webic.png" style="margin-bottom:30px;"/></a>
	<div class="input-group text-center" style="width:50%; margin-left: auto; margin-right: auto;">
	<%if(sessionStatus != null && sessionStatus.equals("successLogin")){ %>
		<input type="text" class="form-control" id="inputUrl" placeholder="url을 입력하세요.">
  		<div class="input-group-append">
    		<button class="btn btn-outline-danger" id="btnUrl" type="button">검 색</button>
		</div>
	<%}else{ %>
		<input type="text" class="form-control" id="inputUrl" placeholder="로그인 후 이용하실 수 있습니다." readonly="readonly">
  		<div class="input-group-append">
    		<button class="btn btn-outline-danger" id="btnUrl" type="button" disabled="disabled">검 색</button>
		</div>
	<%} %>
	  
	</div>
	<div class="text-left border border-top-0" id="videoPreview" style="display:none; width:30%; height:300px; margin-left: auto; margin-right: auto;">
		<div>
			<iframe src="" id="iframeVideo"></iframe>
		</div>
		<div class="m-4">
			<input type="text" id="inputTitle" class="form-control rounded-0 border-top-0 border-left-0 border-right-0" style="width:100%;" placeholder="제목을 입력하세요"/><br/>
			<input type="button" id="btnAdd" class="btn btn-primary float-right" value="추 가"/>
			<input type="hidden" id="hiddenUrl" value=""/>
		</div>
	</div>
	<div class="alert alert-success mt-4" id="alertSuccess" style="display:none; width:50%; margin-left:auto; margin-right:auto;">
		<strong>성공!</strong> 요청한 음악을 음악 리스트에 <strong>추가</strong>하였습니다.
	</div>
</div>

<script>
$('#btnUrl').click(function(){
	var url = $('#inputUrl').val();
	var temp = url.substring(url.indexOf("v=")+2);
	var urlcode = "https://www.youtube.com/embed/"+temp;
	$('#hiddenUrl').val(urlcode);
	$('#iframeVideo').attr('src', urlcode);
	$('#videoPreview').show();
});

$('#btnAdd').click(function(){
	var title = $('#inputTitle').val();
	var sendUrl = $('#hiddenUrl').val();
	var id = $('#idc').val();
	//$('#btnAdd').attr('onclick', "window.location.href='http://localhost:3000/download?URL="+sendUrl+"&title="+title+"'");
	//$('#alertSuccess').show();
	$('#alertSuccess').show();
	$(location).attr('href', "http://localhost:3000/download?URL="+sendUrl+"&title="+title+"&id="+id+"");
	//$(location).attr('href', "down");
}); 


</script>
</body>
</html>