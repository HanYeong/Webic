<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://use.fontawesome.com/a5389d1743.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>player</title>
<style>
    	html,
body {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  height: 100%;
  background-color: #f5e0e5;
  background-image: linear-gradient(45deg, #ff9b9c 0%, #ffd4a7 100%);
  position: relative;
  /* font-family: "Roboto", sans-serif; */
}
*::selection {
  background-color: unset;
}

.musicList {
	color:#495057;
	font-size: 1em;
	border-radius: 15px;
}

.player {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 330px;
  height: 530px;
  border-radius: 15px;
  background-color: #fff6e7;
  box-shadow: 0 15px 20px 0 #c58371;
}
  input[type="range"] {
    -webkit-appearance: none !important;
    margin: 0px;
    padding: 0px;
    background: #f2eae4;
    height: 5px;
    width: 150px;
    outline: none;
    cursor: pointer;
    overflow: hidden;
    border-radius: 5px;
  }

  input[type="range"]::-ms-fill-lower {
    background: #f2eae4;
  }

  input[type="range"]::-ms-fill-upper {
    background: #f2eae4;
  }

  input[type="range"]::-moz-range-track {
    border: none;
    background: #f2eae4;
  }

  input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none !important;
    background: #ff3677;
    height: 5px;
    width: 5px;
    border-radius: 50%;
    box-shadow: -100vw 0 0 100vw #f7d9b9;
  }

  input[type="range"]::-moz-range-thumb {
    background: #ff3677;
    height: 8px;
    width: 8px;
    border-radius: 100%;
  }

  input[type="range"]::-ms-thumb {
    -webkit-appearance: none !important;
    background: #ff3677;
    height: 8px;
    width: 8px;
    border-radius: 100%;
  }

  .cover {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    overflow: hidden;
    position: absolute;
    left: 50%;
    top: 50px;
    transform: translateX(-50%);
    box-shadow: 0 5px 20px 0 #d56c006d;
}
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  

  .info {
    position: absolute;
    left: 50%;
    top: 240px;
    transform: translateX(-50%);
    text-align: center;
	}
    .title {
      font-size: 20px;
      font-weight: 700;
      color: #444;
      margin-bottom: 2px;
    }

    .singer {
      font-size: 12px;
      color: #72646f;
    }
  

  .btn-box {
    position: absolute;
    top: 330px;
    width: 100%;
    display: flex;
    justify-content: center;
	}
    i {
      font-size: 24px;
      color: #72646f;
      margin: 0 30px;
      cursor: pointer;
    }

    
    i.active {
      color: #ff3677;
    }

  .volume-box {
    display: none;
    position: absolute;
    left: 50%;
    top: 295px;
    transform: translateX(-50%);
    z-index: 1;
    padding: 0 20px;
	}
	
    .volume-down {
      position: absolute;
      left: -35px;
      top: 60%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #72646f;
    }

    .volume-up {
      position: absolute;
      right: -35px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #72646f;
    }

    .volume-up::selection {
      background-color: unset;
    }

    input[type="range"] {
      height: 5px;
      width: 150px;
      margin: 0 0 15px 0;
    }
    
  .volume-box.active {
    display: block;
  }
  .music-box {
    position: absolute;
    left: 50%;
    top: 385px;
    transform: translateX(-50%);
	}
	
    input[type="range"] {
      height: 5px;
      width: 230px;
      margin: 0 0 10px 0;
    }
    
    input[type="range"]::-webkit-slider-thumb {
      height: 5px;
      width: 7px;
    }
    .current-time {
      position: absolute;
      left: -35px;
      top: 17%;
      transform: translateY(-50%);
      font-size: 12px;
      color: #72646f;
    }
    .duration {
      position: absolute;
      right: -35px;
      top: 17%;
      transform: translateY(-50%);
      font-size: 12px;
      color: #72646f;
    }
/*     .play,
    .pause {
      position: absolute;
      left: 50%;
      top: 55px;
      transform: translateX(-50%);
      width: 24px;
      height: 24px;
      border-radius: 50px;
      background-color: #fff6e7;
      cursor: pointer;
      transition: all 0.4s;
      

      i {
        font-size: 36px;
        color: #72646f;
        position: absolute;
        left: 100%;
        top: 100%;
        transform: translate(-48%, -50%);
      }
      }
    .pause {
      i {
        font-size: 32px;
        transform: translate(-50%, -50%);
      }
    } */
	
    </style>
</head>
<body>
<%
	String array = request.getParameter("num");
	int temp = 0;
	int listLength = 0;
	String audioSrc = "";
	if(array == null){
		temp = 0;
	}else{
		temp = Integer.parseInt(array);
	}
	
%>
<%
	String sessionId = (String)session.getAttribute("loginId");
	String sessionStatus = (String)session.getAttribute("logined");
%>
<div class="text-right" style="float: right;">
	<%if(sessionStatus != null && sessionStatus.equals("successLogin")){ %>
		<input type="button"  Onclick="location.href='/'" value="메 인" style="border-radius:5px; background: #5cb85c; border:none; padding: 10px; width:100px; color:white; font-size:110%; margin-right: 20px;">
		<input type="button" class="btn btn-outline-success mr-2" Onclick="location.href='edit'" value="음악 리스트" style="border-radius:5px; background: #5cb85c; border:none; padding: 10px; width:120px; color:white; font-size:110%; margin-right: 20px;">	
		<input type="button" class="btn btn-outline-primary mr-2" Onclick="location.href='logout'" value="로그아웃" style="border-radius:5px; background: #0275d8; border:none; padding: 10px; width:100px; color:white; font-size:110%; margin-right: 20px;">	
	<%}else{ %>
	<script>
	document.location.href= "/login";
	</script>
	<%} %>
	</div>
<div class="musicList" style="width:400px; border:1px solid #ced4da;">
  <button type="button" style="width:100%; background: #0275d8;  border:none;  height: 40px;" disabled="disabled">
    <b style="color:white; font-size:120%;">음악 리스트</b>
  </button>
  
  <c:forEach var="e" items="${list}">
	<input type="hidden" id="addr<%=listLength%>" value="${e.address}" />
	<button type="button" name="musicList" style="width:100%; font-size:105%; background: white; border:none; height: 40px;" onclick="musicChange(this);" id="title<%=listLength%>" value="${e.title}">${e.title }</button>
	<%listLength = listLength + 1; %>
</c:forEach>
</div>

    <div class="player">
        <div class="cover">
        <%if(temp == 0){ %>
            	<img src="/imgs/hyoshin.jpg" alt="">
            <%}else if(temp == 1){%>
            	<img src="/imgs/palette.jpg" alt="">
            <% }else if(temp == 2){%>
        	<img src="https://hosseinghanbari.ir/other/music-player/autumn.jpg" alt="">
        <% }else{%>
            <img src="/imgs/logo.png" alt="">
            <%} %>
        </div>
        <div class="info">
            <div class="title"><input type="text" id="inputTitle" value="aa" style="font-weight:bold; background: none; border:none; text-align: center;" disabled="disabled"/></div>
            <div class="singer">Webic Music</div>
        </div>
        <div class="volume-box">
            <span class="volume-down"><i class="material-icons">remove</i></span>
            <input type="range" class="volume-range" step="1" value="50" min="0" max="100"
                oninput="music.volume = this.value/100">
            <span class="volume-up"><i class="material-icons">add</i></span>
        </div>
        <div class="btn-box">
            <i class="material-icons repeat" onclick="handleRepeat()" style="margin-right: 60px;">repeat</i>
            <i class="material-icons volume" onclick="handleVolume()" style="margin-left: 60px;">volume_up</i>
        </div>
        <div class="music-box">
            <input type="range" step="1" class="seekbar" value="0" min="0" max="100" oninput="handleSeekBar()">

            <audio class="music-element" id="audioId">
                <source src="">
            </audio>
            <span class="current-time">0:0</span><span class="duration">0:0</span>
         <div>
         	<div class="text-center">
        		<i class="fa fa-angle-double-left fa-2x" onclick="previousMusic();" style="margin-left:50px; margin-top:30px;"></i>
        		<span class="play" onclick="handlePlay()">
                	<i class="material-icons" style="margin:0px;">play_arrow</i>
            	</span>
            	<i class="fa fa-angle-double-right fa-2x" onclick="nextMusic();"></i>
        	</div>
         	
         </div>  
        </div>
        	
    	</div>
<script>
//player
var list = <%=temp%>;
var tmp = "";

$('#tet').click(function(){
	alert(<%=listLength%>);
});

$('#inputTitle').val($('#title'+list).val());


	tmp = $('#addr'+list).val();
$('#audioId').attr('src', tmp);
$('#title'+list).css("background", "lightgray");

var music = document.querySelector('.music-element')
var playBtn = document.querySelector('.play')
var seekbar = document.querySelector('.seekbar')
var currentTime = document.querySelector('.current-time')
var duration = document.querySelector('.duration')

if(!isNaN(music.duration)){
	alert("yes");
	document.location.href= "/play?num="+list;
}



function nextMusic(){
	if(list < <%=listLength%>-1){
		list = list+1;	
		document.location.href= "/play?num="+list;
	}
	
}

function previousMusic(){
	if(list >= 1){
		list = list-1;	
		document.location.href= "/play?num="+list;
	}
	
}

function handlePlay() {
    if (music.paused) {
        music.play();
        playBtn.className = 'pause'
        playBtn.innerHTML = '<i class="material-icons" style="margin:0px;">pause</i>'
    } else {
        music.pause();
        playBtn.className = 'play'
        playBtn.innerHTML = '<i class="material-icons" style="margin:0px;">play_arrow</i>'
    }
    music.addEventListener('ended', function () {
        playBtn.className = 'play'
        playBtn.innerHTML = '<i class="material-icons" style="margin:0px;">play_arrow</i>'
        music.currentTime = 0
    });
}

music.onloadeddata = function () {
    seekbar.max = music.duration
    var ds = parseInt(music.duration % 60)
    var dm = parseInt((music.duration / 60) % 60)
    duration.innerHTML = dm + ':' + ds
}
music.ontimeupdate = function () { seekbar.value = music.currentTime }
handleSeekBar = function () { music.currentTime = seekbar.value }
music.addEventListener('timeupdate', function () {
    var cs = parseInt(music.currentTime % 60)
    var cm = parseInt((music.currentTime / 60) % 60)
    currentTime.innerHTML = cm + ':' + cs
}, false)



// repeat
var repIcon = document.querySelector('.repeat')
function handleRepeat() {
    if (music.loop == true) {
        music.loop = false
        repIcon.classList.toggle('active')
    }
    else {
        music.loop = true
        repIcon.classList.toggle('active')
    }
}

// volume
var volIcon = document.querySelector('.volume')
var volBox = document.querySelector('.volume-box')
var volumeRange = document.querySelector('.volume-range')
var volumeDown = document.querySelector('.volume-down')
var volumeUp = document.querySelector('.volume-up')

function handleVolume() {
    volIcon.classList.toggle('active')
    volBox.classList.toggle('active')
}

volumeDown.addEventListener('click', handleVolumeDown);
volumeUp.addEventListener('click', handleVolumeUp);

function handleVolumeDown() {
    volumeRange.value = Number(volumeRange.value) - 10
    music.volume = volumeRange.value / 100
}
function handleVolumeUp() {
    volumeRange.value = Number(volumeRange.value) + 10
    music.volume = volumeRange.value / 100
}
</script>
<script>
	function musicChange(val){
		
	}
</script>
</body>
</html>