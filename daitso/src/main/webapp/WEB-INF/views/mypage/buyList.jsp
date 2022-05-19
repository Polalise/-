<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../../resources/css/myPage.css">
<link rel="stylesheet" href="../../../resources/css/buyList.css">
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
					<li>프로필 이에요</li>
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
			<div class="list">
				<div class="header">
					<div>구매목록</div>
					<br> <a>구매 물품</a> <a>구매 날짜</a> <a>구매 가격</a> <a>판매자</a>
				</div>
				<div class="viewList">
					<div class="product">
						<span class="thumbnail">썸네일</span> <a>상품이름</a> <a>언제샀을까</a> <a>얼마에샀니</a>
						<a>누구야</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>