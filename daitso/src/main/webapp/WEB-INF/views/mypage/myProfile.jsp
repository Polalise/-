<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/myProfile.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
	<div class="my_layout">
		<div class="top">global menu</div>
		<div class="main">
			<div class="leftMenu">
				left menu
				<h2>마이페이지</h2>
				<ul class="ulc">
					<li><a href="myProfileForm.do">내 정보</a></li>
					<li><a href="">채팅목록</a></li>
					<li><a href="myBuyList.do">구매한 물품</a></li>
					<li><a href="mySellList.do">판매한 물품</a></li>
					<li><a href="myLikeList.do">찜한 물품</a></li>
					<li><a href="">리뷰 목록</a></li>
				</ul>
				<div class="fired">
					<a>회원 탈퇴</a>
				</div>
			</div>
			<div class="profileBox">
				<div class="tier" id="tier-">
					<div class="content">
					<!-- 프로필 사진 -->
						<div class="pic">
							<img alt="" src="${path}/resources/upload/${member.photoName}">
					<!-- 티어 아이콘 -->		
							<span class="tierPic">
							<img alt="" src="images/vip.png"></span>
						</div>
					</div>
					<div class="profile">
						<div class="name">${member.nickName} 님 의 가입일은 ${member.regdate} 입니다</div>
						<div class="etc">
							<a>판매한 횟수 : ${productCountS}</a> <br/>
							<a>구매한 횟수 : ${productCountB}</a> <br/>
							<a>찜한 횟수 : ${likesCount} </a> <br/>
							<a>본명 : ${member.name }</a>
						</div>
					</div>
					<!-- 레벨 진행도 -->
						<!-- 각 왼쪽 Lv , 오른쪽 % 표시 -->
						<span class="Lv">lv</span>
						<span class="Per">%</span>
					<!-- 레벨 bar -->
					<progress class="level" value="10" max="100" ></progress>
				</div>
			</div>
			<div class="recent">
				<div class="buy">
					<div class="buy_header">최근 찜한거!</div>
					<div class="likePic">
						<img src="images/im3.jpg" />
					</div>
					<div class="likePic">
						<img src="images/jang.jpg">
					</div>
					<div class="likePic">
						<img src="images/kim.jpg">
					</div>
					<div class="likePic">
						<img src="images/jang.jpg">
					</div>
					<div class="likePic">
						<img src="images/kim.jpg">
					</div>
					<div class="likePic">
						<img src="images/jang.jpg">
					</div>
					<div class="likePic">
						<img src="images/kim.jpg">
					</div>
					<div class="likePic">
						<img src="images/jang.jpg">
					</div>
				</div>
				<div class="event">
					<img src="images/event.PNG" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>