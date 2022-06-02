<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="leftMenu">
		<h2>마이페이지</h2>
		<ul class="ulc">
			<li><a href="myProfile.do">내 정보</a></li>
			<li><a href="updateForm.do">내 정보 수정</a></li>
			<li><a href="myBuyList.do">구매한 물품</a></li>
			<li><a href="mySellList.do">판매한 물품</a></li>
			<li><a href="myLikeList.do">찜한 물품</a></li>
		</ul>
		<div class="fired">
			<a href="firedmemberForm.do">회원 탈퇴</a>
		</div>
	</div>
</body>
</html>