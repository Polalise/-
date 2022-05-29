<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		body {
			background-color: #f4f7f6;
			margin-top: 20px;
		}
		
		.card {
			background: #fff;
			transition: .5s;
			border: 0;
			margin-bottom: 30px;
			border-radius: .55rem;
			position: relative;
			width: 100%;
			box-shadow: 0 1px 2px 0 rgb(0 0 0/ 10%);
		}
		
		.chat-app .people-list {
			width: 280px;
			position: absolute;
			left: 0;
			top: 0;
			padding: 20px;
			z-index: 7
		}
		
		.chat-app .chat {
			margin-left: 280px;
			border-left: 1px solid #eaeaea
		}
		
		.people-list {
			-moz-transition: .5s;
			-o-transition: .5s;
			-webkit-transition: .5s;
			transition: .5s
		}
		
		.people-list .chat-list li {
			padding: 10px 15px;
			list-style: none;
			border-radius: 3px
		}
		
		.people-list .chat-list li:hover {
			background: #efefef;
			cursor: pointer
		}
		
		.people-list .chat-list li.active {
			background: #efefef
		}
		
		.people-list .chat-list li .name {
			font-size: 15px
		}
		
		.people-list .chat-list img {
			width: 45px;
			border-radius: 50%
		}
		
		.people-list img {
			float: left;
			border-radius: 50%
		}
		
		.people-list .about {
			float: left;
			padding-left: 8px
		}
		
		.people-list .status {
			color: #999;
			font-size: 13px
		}
		
		.chat .chat-header {
			padding: 15px 20px;
			border-bottom: 2px solid #f4f7f6
		}
		
		.chat .chat-header img {
			float: left;
			border-radius: 40px;
			width: 40px
		}
		
		.chat .chat-header .chat-about {
			float: left;
			padding-left: 10px
		}
		
		.chat .chat-history {
			padding: 20px;
			border-bottom: 2px solid #fff
		}
		
		.chat .chat-history ul {
			padding: 0
		}
		
		.chat .chat-history ul li {
			list-style: none;
			margin-bottom: 30px
		}
		
		.chat .chat-history ul li:last-child {
			margin-bottom: 0px
		}
		
		.chat .chat-history .message-data {
			margin-bottom: 15px
		}
		
		.chat .chat-history .message-data img {
			border-radius: 40px;
			width: 40px
		}
		
		.chat .chat-history .message-data-time {
			color: #434651;
			padding-left: 6px;
		}
		
		.chat .chat-history .message {
			color: #444;
			padding: 18px 20px;
			line-height: 26px;
			font-size: 16px;
			border-radius: 7px;
			display: inline-block;
			position: relative
		}
		
		.chat .chat-history .message:after {
			bottom: 100%;
			left: 7%;
			border: solid transparent;
			content: " ";
			height: 0;
			width: 0;
			position: absolute;
			pointer-events: none;
			border-bottom-color: #fff;
			border-width: 10px;
			margin-left: -10px
		}
		
		.chat .chat-history .my-message {
			background: #efefef;
			display: flex;
		}
		
		.chat .chat-history .my-message:after {
			bottom: 100%;
			left: 30px;
			border: solid transparent;
			content: " ";
			height: 0;
			width: 0;
			position: absolute; 
			pointer-events: none;
			border-bottom-color: #efefef;
			border-width: 10px;
			margin-left: -10px
		}
		
		.chat .chat-history .other-message {
			background: #e8f1f3;
			text-align: right;
			display: flex;
			flex-direction: row-reverse;
			
		}
		
		.chat .chat-history .other-message:after {
			border-bottom-color: #e8f1f3;
			left: 93%
		}
		
		.chat .chat-message {
			padding: 20px
		}
		
		.online, .offline, .me {
			margin-right: 2px;
			font-size: 8px;
			vertical-align: middle
		}
		
		.online {
			color: #86c541
		}
		
		.offline {
			color: #e47297
		}
		
		.me {
			color: #1d8ecd
		}
		
		.float-right {
			float: right
		}
		
		.clearfix:after {
			visibility: hidden;
			display: block;
			font-size: 0;
			content: " ";
			clear: both;
			height: 0
		}
		
		@media only screen and (max-width: 767px) {
			.chat-app .people-list {
				height: 465px;
				width: 100%;
				overflow-x: auto;
				background: #fff;
				left: -400px;
				display: none
			}
			.chat-app .people-list.open {
				left: 0
			}
			.chat-app .chat {
				margin: 0
			}
			.chat-app .chat .chat-header {
				border-radius: 0.55rem 0.55rem 0 0
			}
			.chat-app .chat-history {
				height: 300px;
				overflow-x: auto
			}
		}
		
		@media only screen and (min-width: 768px) and (max-width: 992px) {
			.chat-app .chat-list {
				height: 650px;
				overflow-x: auto
			}
			.chat-app .chat-history {
				height: 600px;
				overflow-x: auto
			}
		}
		
		@media only screen and (min-device-width: 768px) and (max-device-width:
			1024px) and (orientation: landscape) and
			(-webkit-min-device-pixel-ratio: 1) {
			.chat-app .chat-list {
				height: 480px;
				overflow-x: auto
			}
			.chat-app .chat-history {
				height: calc(100vh - 350px);
				overflow-x: auto
			}
		}
		
		#chat-history{
			overflow: scroll;
		}
</style>
<script type="text/javascript">
	var websocket; // function 밖으로 빼면 전역변수, function안에 있으면 지역변수로 활용
	var nickname;

	window.onload = function() {
		connect();
	};

	$(function() {
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
			if (keycode == 13) {
				send();
			}
		});
	});

	function connect() {
		// 172.30.1.37:8080/ch11: 채팅 서버의 ip값	// chat-ws.do : servlet-context에 등록된 이름
		// 다른 프로젝트를 통해 불러 오는 방법을 사용 해도 된다
		// websocket = new WebSocket("ws://61.75.24.60:8080/daitso/chat-ws.do");
		websocket = new WebSocket("ws://61.75.24.60:8080/daitso/chat-ws.do");
		// 뒤에 ()안해도 알아서 함수 불러옴
		websocket.onopen = Open;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}

	function disconnect() {
		websocket.close();
	}

	function send() {
		var msg = $('#message').val(); // 입력한 메세지 읽기
		//		websocket.send(nickname+" : "+msg);	// 별명과 메세지를 묶어서 보냄
		
		// ajax로 채팅 내용 저장
		$(function() {
			$.ajax({
				url : 'saveMessage.do',
				data : {
					msg : msg,
					nickname : nickname,
					p_num : '${product.p_num}',
					room_num : '${chat.room_num}'
				},
				type : 'post'
			});
		});
		var option = {
			type : "message",
			sessionId : $("#sessionId").val(),
			msg : $("#message").val()
		}
		websocket.send(JSON.stringify(option));
		$('#message').val(""); // 메세지 보내면 메세지창에 내가 적은 내용 지움
	}

	function Open() {
		nickname = '${member.nickName}'; // 별명 가져오기
		appendMessage(nickname + "님이 입장 하였습니다.");
	}

	function onMessage(event) {
		var msg = event.data; // 메세지는 event에 data속성으로 들어온다
		appendMessage(msg);
	}

	function onClose() {
//		nickname = ${member.nickName};
		appendMessage(nickname + "님이 퇴장 하였습니다.");
	}

	function appendMessage(msg) {
		if (msg != null && msg.trim() != '') {
			var d = JSON.parse(msg);
			if (d.type == "getId") {
				var si = d.sessionId != null ? d.sessionId : "";
				if (si != '') {
					$("#sessionId").val(si);
				}
			} else if (d.type == "message") {
				if (d.sessionId == $("#sessionId").val()) {
					$('#chatMessage').append( "<div class='message-data text-right'><ul><div><img alt='' src='${path}/resources/upload/${member.photoName}'></div><li class='message other-message' id='mymessage'>" + d.msg + "<br>" + "</li></ul></div>");
				} else {
					$('#chatMessage').append( "<ul><li class='message my-message' id='othermessage'>" + d.msg + "<br>" + "</li></ul>");
				}
			}
		} else {
			alert("누구 타입인지 모르겠어");
		}

		// 채팅창에 글이 꽉 찼을 경우 최신글이 하단에 보이게 하기 위한 이벤트
		var objDiv = document.getElementById("chatMessage");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	
	// 채팅 시간 보여주기
	function showClock(){
        var currentDate = new Date();
        var time = document.getElementById("time");
         
        var msg = currentDate.getHours()+"시"
        msg += currentDate.getMinutes()+"분";
         
        time.innerText = msg;
    }
</script>
</head>
<body>
<div class="container">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Search...">
                </div>
                <ul class="list-unstyled chat-list mt-2 mb-0">
                <c:if test="${member.nickName != product.p_writer }">
                	<c:forEach var="chatlog" items="${chatlog}">	
                    <li class="clearfix" onclick="location.href='chatClick.do?room_num=${chatlog.room_num}'">
                    	<img alt="" src="${path}/resources/upload/${chatlog.user1_photo}">
                        <div class="about">
                            <div class="name">${chatlog.user1_nick }</div>
                            <div class="status">${chatlog.room_num }</div>
                            <div class="status">${chatlog.p_num }</div>                                     
                        </div>
                    </li>
                    </c:forEach>
                </c:if>
                <c:if test="${member.nickName == product.p_writer }">
                	<c:forEach var="chatlog2" items="${chatlog2}">	
                    <li class="clearfix" onclick="location.href='chatClick.do?room_num=${chatlog2.room_num}'">
                    	<img alt="" src="${path}/resources/upload/${chatlog2.user2_photo}">
                        <div class="about">
                            <div class="name">${chatlog2.user2_nick }</div>
                            <div class="status">${chatlog2.room_num }</div>   
                            <div class="status">${chatlog2.p_num }</div>                                
                        </div>
                    </li>
                    </c:forEach>
                </c:if>
                </ul>
            </div>
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="row">
                        <div class="col-lg-6">
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                <img alt="" src="${path}/resources/upload/${member.photoName}">
                            </a>
                            <div class="chat-about">
                                <h6 class="m-b-0">${member.nickName }</h6>
                                <small>${product.p_name }</small>
                            </div>
                        </div>
                        <div class="col-lg-6 hidden-sm text-right">
                            <a href="javascript:void(0);" class="btn btn-outline-secondary"><i class="fa fa-camera"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-primary"><i class="fa fa-image"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-info"><i class="fa fa-cogs"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-warning"><i class="fa fa-question"></i></a>
                        </div>
                    </div>
                </div>
                
                
                <!-- 판매자와 채팅 방이 없는 경우 -->
                <c:if test="${result == 1}">
                	<div><a href="createChatRoom.do?p_num=${product.p_num }" class="btn btn-success">판매자와 채팅 시작하기</a></div>
                </c:if>
                
                <!-- 글을 쓴 사람이 채팅하기 누른 경우 -->
                <c:if test="${result == 0}">
                	<h2>오른쪽 채팅을 찾아 채팅을 시작하세요</h2>
                </c:if>
                
                <!-- 판매자와 채팅 방이 있는 경우 -->
                <c:if test="${result == -1}">
	                <div class="chat-history" id="chatMessage">
	                	<input type="hidden" id="sessionId" value="">
	                    <c:forEach var="chathistory" items="${log }">
	                    	<c:if test="${chathistory.sender == member.nickName}">
	                    	<div class="message-data text-right">
	                    		<ul>
	                    			<div><img alt="" src="${path}/resources/upload/${member.photoName}"></div>	
	                    			<li class="message other-message" id="mymessage" value="${chathistory.text}">${chathistory.text}</li>
	                    		</ul>
	                    	</div>
	                    	</c:if>
	                    	<c:if test="${chathistory.sender != member.nickName}">
	                    		<ul>
	                    			<li class="message my-message" id="othermessage" value="${chathistory.text}">${chathistory.text}</li>
	                    		</ul>
	                    	</c:if>
	                    </c:forEach>
	                </div>
	                
	                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
                        <div>
                        	<input type="text" id="message" class="form-control" placeholder="Enter text here...">
                        	<input type="button" id="sendBtn" value="메세지 보내기" class="btn btn-success">
                        </div>                                    
                    </div>
                    <div><a href="p_list.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a> </div>           
                	</div>
                </c:if>
                
                <!-- 판매자와 채팅 방이 있는 경우 -->
                <c:if test="${result == -2}">
	                <div class="chat-history" id="chatMessage">
	                	<input type="hidden" id="sessionId" value="">
	                    <c:forEach var="chathistory" items="${log2 }">
	                    	<c:if test="${chathistory.sender == member.nickName}">
	                    	<div class="message-data text-right">
	                    		<ul>
	                    			<div><img alt="" src="${path}/resources/upload/${member.photoName}"></div>
	                    			<li class="message other-message" id="mymessage" value="${chathistory.text}">${chathistory.text}</li>
	                    		</ul>
	                    	</div>
	                    	</c:if>
	                    	<c:if test="${chathistory.sender != member.nickName}">
	                    		<ul>
	                    			<li class="message my-message" id="othermessage" value="${chathistory.text}">${chathistory.text}</li>
	                    		</ul>
	                    	</c:if>
	                    </c:forEach>
	                </div>
	                
	                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
                        <div>
                        	<input type="text" id="message" class="form-control" placeholder="Enter text here...">
                        	<input type="button" id="sendBtn" value="메세지 보내기" class="btn btn-success">
                        </div>                                    
                    </div>
                    <div><a href="p_list.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a> </div>           
                	</div>
                </c:if>
                
                <c:if test="${result == 2 }">
                	<h2 style="text-aline:center;">문의 채팅이 아직 없습니다.</h2>
                </c:if>
                
                
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>