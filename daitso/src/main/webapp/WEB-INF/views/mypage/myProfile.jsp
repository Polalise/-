<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../../resources/css/myPage.css">
<link rel="stylesheet" href="../../../resources/css/myProfile.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<li>채팅이에요</li>
					<li>찜했어요</li>
					<li>샀어요</li>
					<li>팔았어요</li>
					<li>리뷰에요</li>
				</ul>
				<div class="fired">
					<a>회원 탈퇴</a>
				</div>
			</div>
			<div class="profileBox">
				<div class="tier" id="platinum">
					<div class="content">
						<div class="pic">
							<img alt="" src="images/jang.jpg"> <span class="tierPic"><img
								alt="" src="images/vip.png"></span>
						</div>
					</div>
					<div class="profile">
						<div class="name">이름</div>
						<div class="etc">
							<a>내용 1</a> <br /> <a>내용 2</a> <br /> <a>내용 3</a> <br /> <a>내용
								4</a>
						</div>
					</div>
					<span class="Lv">lv</span> <span class="Per">%</span>
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