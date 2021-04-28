<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
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
	int listLength = 0;
	int listPlayLength = 0;
%>
<body>
<div>

	<div class="text-right mb-5">
	<%if(sessionStatus != null && sessionStatus.equals("successLogin")){ %>
		<input type="button" class="btn btn-outline-success mr-2" Onclick="location.href='/'" value="메 인">
		<input type="button" class="btn btn-outline-success mr-2" Onclick="location.href='play'" value="음악 플레이어">	
		<input type="button" class="btn btn-outline-primary mr-2" Onclick="location.href='logout'" value="로그아웃">	
	<%}else{ %>
	<script>
	document.location.href= "/login";
	</script>
	<%} %>
	</div>

<div class="list-group float-left" style="width:40%; margin-left:5%; margin-right:5%;">
  <button type="button" class="list-group-item list-group-item-action active" disabled>
    음악 리스트
  </button>
  <c:forEach var="e" items="${list}">
	<%listLength = listLength+1; %>
	<button type="button" name="musicList" onclick="addPlayList(this);" id="${e.no }" value="${e.title}" class="list-group-item list-group-item-action">${e.title }</button>
</c:forEach>
</div>
<div class="list-group" id="list-tab" role="tablist" style="width:45%;">
	    <button type="button" class="list-group-item list-group-item-action" style="color:white; background: #5cb85c;" disabled>
				플레이 리스트
  		</button>
		 
		 <c:forEach var="d" items="${list2}">
		 	<%listPlayLength = listPlayLength+1; %>
		 	 <div class="input-group mb-3" name="divList" id="divList<%=listPlayLength%>">
		 	  <input type="hidden" id="listId<%=listPlayLength%>" value="${d.no}" >
			  <input type="text" class="form-control" value="${d.title}" readonly="readonly" style="background: white;">
			  <div class="input-group-append">
			    <button class="btn btn-outline-danger" type="button" onclick="test(this);" id="<%=listPlayLength%>">삭 제</button>
			  </div>
		 </div>
		 	
		 </c:forEach>
</div>
	<input type="button" class="btn btn-success float-right" id="tes" value="저 장"/>
</div>
<form method="POST" id="submitId" action="save">
	<input type="hidden" name="listData" id="listData"/>
</form>
<script>
var listNum = 0;
listNum = <%=listPlayLength%>;
function addPlayList(val){
	var temp = $(val).attr('value');
	var temp2 = $(val).attr('id');
	listNum = listNum + 1;
	var html = '<div class="input-group mb-3" name="divList" id="divList'+listNum+'">'+
					'<input type="hidden" id="listId'+listNum+'" value="'+temp2+'" >'+
					'<input type="text" class="form-control" value="'+temp+'" readonly="readonly" style="background: white;">'+
						'<div class="input-group-append">'+
							'<button class="btn btn-outline-danger" type="button" onclick="test(this);" id="'+listNum+'">삭 제</button>'+
						'</div>'+
				'</div>';
	
		$('#list-tab').append(html);
}

function test(id){
	var temp = $(id).attr('id');
	$('#divList'+temp+'').remove();
	//alert($("div[name=divList]").length);
}


$('#tes').click(function(){
		var data = "";
		for(let i=1; i<=listNum;i++){
			if($('#listId'+i).val() !== undefined){
			data = data +"_"+ $('#listId'+i).val();
			}
		}
		$('#listData').val(data.substring(1));
		$('#submitId').submit();
});
</script>

</body>
</html>