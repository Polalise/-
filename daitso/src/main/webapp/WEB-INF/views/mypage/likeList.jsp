<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/likeList.css">
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

			<div class="list">
				<a class="header">물품리스트</a>
				<c:if test="${empty likeList }">
					찜한 상품이 없어요!
				</c:if>
				<c:if test="${not empty likeList }">
					<c:forEach var="product" items="${likeListInfo }">
						<div class="product">
							<div class="thumbnail">
								<img src="${path}/resources/upload/${product.thumnails}">
								<span class="likeBtn"> <img alt="" src="images/likes.png"></span>
							</div>
							<div class="info">
								<a>${product.p_name }</a> <a>${product.price }</a> <a>${product.p_date }</a>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>