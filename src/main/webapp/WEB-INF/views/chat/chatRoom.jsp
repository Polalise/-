<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{ margin: 0; padding: 0; }
 
	.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
	.chat_wrap .chat { padding-bottom: 80px; }
	.chat_wrap .chat ul { width: 100%; list-style: none; }
	.chat_wrap .chat ul li { width: 100%; }
	.chat_wrap .chat ul li.left { text-align: left; }
	.chat_wrap .chat ul li.right { text-align: right; }
 
	.chat_wrap .chat ul li > div { font-size: 13px;  }
	.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
	.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
	.chat_wrap .input-div { position: fixed; bottom: 0; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
	.chat_wrap .input-div > textarea { width: 100%; height: 80px; border: none; padding: 10px; }
 
	.format { display: none; }
</style>
<script type="text/javascript">
	var websocket;	// function 밖으로 빼면 전역변수, function안에 있으면 지역변수로 활용
	var nickname;
	
	window.onload = function() {
		connect();
	};
	
	$(function () {		
		$('#exitBtn').click(function() {
			disconnect();
		});
		
		$('#sendBtn').click(function() {
			send();
		});
		
		$('#message').keypress(function() {
			// 입력한 키 값       인터넷 익스플로어면?     인터넷 익스플로어에서의 입력값: 인터넷익스플로어를 제외한 브라우저의 key값 (삼단 논리)
			var keycode = event.keyCode ? event.keyCode : event.which;
			// ASCII 값으로 13이 enter key
			if (keycode == 13){
				send();
			}
		});
	});
	
	function connect() {
		// 172.30.1.37:8080/ch11: 채팅 서버의 ip값	// chat-ws.do : servlet-context에 등록된 이름
		// 다른 프로젝트를 통해 불러 오는 방법을 사용 해도 된다
		websocket = new WebSocket("ws://172.30.1.43:8080/daitso/chat-ws.do");
		// 뒤에 ()안해도 알아서 함수 불러옴
		websocket.onopen = Open;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	
	function disconnect() {
		websocket.close();
	}
	
	function send() {
		var msg = $('#message').val();  	// 입력한 메세지 읽기
		websocket.send(nickname+" : "+msg);	// 별명과 메세지를 묶어서 보냄
		$('#message').val("");				// 메세지 보내면 메세지창에 내가 적은 내용 지움
	}
	
	function Open() {
		nickname = '${member.nickName}';  // 별명 가져오기
		appendMessage(nickname+"님이 입장 하였습니다.");
	}
	
	function onMessage(event) {
		var msg = event.data;  // 메세지는 event에 data속성으로 들어온다
		appendMessage(msg);
	}
	
	function onClose() {
//		nickname = ${member.nickName};
		appendMessage(nickname+"님이 퇴장 하였습니다.");
	}
	
	function appendMessage(msg) {
		$('#chatMessage').append(msg+"<br>");
		
		// 채팅창에 글이 꽉 찼을 경우 최신글이 하단에 보이게 하기 위한 이벤트
		var objDiv = document.getElementById("chatMessage");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
</script>
</head>
<body>
<div class="chat_wrap">
	<input type="hidden" name="nickName" value="${member.nickName }">
    <div class="header">
        CHAT
    </div>
    <div id="chatMessage">
        <ul>
            <!-- 동적 생성 -->
        </ul>
    </div>
    <div class="input-div">
        <textarea id="message" placeholder="Press Enter for send message."></textarea>
        <div><input type="button" id="sendBtn" value="메세지 보내기" class="btn btn-success"></div>
    </div>
 
    <!-- format -->
 
    <div class="chat format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>