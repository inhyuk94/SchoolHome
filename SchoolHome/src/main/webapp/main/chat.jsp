<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>
<link href="../main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
<link href="../main/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
#chatArea{
  width: 400px;
  height: 250px;
  overflow-y:auto;
  border: 1px solid black; 
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#startBtn').click(function(){
		connection();
	});
	$('#endBtn').click(function(){
		disconnection();
	});
	$('#sendBtn').click(function(){
		var msg=$('#sendMsg').val();
		if(msg.trim()=="")
		{
			$('#sendMsg').focus();
			return;
		}
		send();
	});
});
var sock;
// 연결 
function connection()
{
	sock=new WebSocket("ws://localhost:8080/tiles/main/chat-ws");
	sock.onopen=onOpen; //afterConnectionEstablished
	sock.onmessage=onMessage; //handleTextMessage메소드 호출 (서버)
	sock.onclose=onClose;//afterConnectionClosed
}
function onOpen(event) //afterConnectionEstablished
{
	alert("채팅서버에 연결되었습니다!!");
}
// 해제
function disconnection()// 사용자 요청 
{
	sock.close();
}
function onClose(event) //afterConnectionClosed ==> 서버에서 결과값 
{
	alert("서버연결이 해제되었습니다!!");
	location.href="../main/main.do";
}
// 메세지 전송 
function send()
{
	// 전송 
	var name=$('#name').val();
	var msg=$('#sendMsg').val();
	sock.send("["+name+"]"+msg); //handleMessage=> 접속자 전체에 메세지 전송 
	$('#sendMsg').val("");
}
function onMessage(event) //handleMessage
{
	var msg=event.data;
	$('#recvMsg').append(msg+"<br>");
	var ch=$('#chatArea').height();
	var m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);
	
}
</script>
</head>
<body>
  <center>
   <table class="table">
    <tr>
      <td class="text-left">
       이름:<input type=text id="name">
       <input type=button value="입장" class="btn btn-sm btn-primary" id="startBtn">
       <input type=button value="퇴장" class="btn btn-sm btn-danger" id="endBtn">
      </td>
    </tr>
    <tr>
      <td>
       <div id="chatArea">
         <div id="recvMsg"></div>
       </div>
      </td>
    </tr>
    <tr>
      <td>
       <input type=text id="sendMsg" size=40>
       <input type=button value="전송" class="btn btn-sm btn-success" id="sendBtn">
      </td>
    </tr>
   </table>
  </center>
</body>
</html>





