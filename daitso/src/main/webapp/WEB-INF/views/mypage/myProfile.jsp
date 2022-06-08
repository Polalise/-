<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/myProfile.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="profileBox">
		<div class="tier" id="tier-${tierBC}">
			<div class="content">
				<!-- 프로필 사진 -->
				<div class="pic">
					<img alt="" src="${path}/resources/upload/${member.photoName}">
					<!-- 티어 아이콘 -->
					<span class="tierPic"> <img alt=""
						src="${path}/resources/images/${tierBC}.png"></span>
				</div>
			</div>
			<div class="profile">
				<div class="name">${member.nickName}님</div>
				<div class="etc">
					<a>판매한 횟수 : <c:if test="${productCountS ==  null}">아직 판매 이력이 없어요!!</c:if>  <c:if test="${productCountS != null}">${productCountS} 회</c:if></a>
					<br/>
					<a>구매한 횟수 : <c:if test="${productCountB == null}">아직 구매 이력이 없어요!!</c:if>    <c:if test="${productCountB != null}">${productCountB} 회</c:if> </a>
					<br/>
					<a>찜한 횟수 : <c:if test="${likesCount == null || likesCount == 0}">아직 찜한 상품이 없어요!!</c:if> <c:if test="${likesCount != null && likesCount != 0}">${likesCount} 회</c:if> </a>
					<br/>
					<a>이메일 : ${member.email }</a>
				</div>
			</div>
			<!-- 레벨 진행도 -->
			<!-- 레벨 bar -->
			<meter class="level" value="${member.grade}" min="${minGrade}"
				max="${maxGrade}"></meter>
			<%-- <progress  value="${member.grade}" max="${maxGrade}" ></progress> --%>
		</div>
	</div>
	<div class="recent">
		<div class="buy">
			<div class="buy_header">최근 찜한거!</div>
			<c:if test="${empty likeList }">
						아직 찜한 상품이 없어요!!
					</c:if>
			<c:if test="${not empty likeList }">
				<c:forEach var="product" items="${likeList }">
					<div class="likePic">
						<img src="${path}/resources/upload/${product.thumnails}">
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="event">
			<img src="${path}/resources/images/event.PNG" />
		</div>
	</div>
</body>
</html>