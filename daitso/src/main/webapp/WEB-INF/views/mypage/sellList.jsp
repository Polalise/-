<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/sellList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#reviewPop').click(
				function() {
					var pop = window.open(
							"reviewPop.do?p_num=${product.p_num}", "content",
							"width=510 height=560");
				});
	});
</script>
</head>
<body>
	<div class="list">
		<div class="header">
			<div class="header_title">판매목록</div>
			<div class="header_info">
				<a class="title">판매 물품</a> <a class="s_date">판매 날짜</a> <a
					class="s_price">판매 가격</a> <a class="s_review">리뷰</a>
			</div>
		</div>
		<c:if test="${empty mySellList}">
			<div class="viewList">
				<div class="product">아직 판매한 적이 없어요!</div>
			</div>
		</c:if>
		<c:if test="${not empty mySellList}">
			<c:forEach var="product" items="${mySellList }">
				<%-- <c:forEach var="" items=""> --%>
				<div class="viewList">
					<div class="product">
						<span class="thumbnail"> <img
							src="${path}/resources/upload/${product.thumnails}">
						</span> <a class="mp_name">${product.p_name}</a>
						<c:if test="${product.updateday == null}">
							<a class="mp_date">${product.p_date}</a>
						</c:if>

						<c:if test="${product.updateday != null}">
							<a class="mp_date">${product.updateday}</a>
						</c:if>

						<a class="mp_price">${product.price}</a>

						<c:if test="${product.sel == 'n'}">
							<a class="mp_review">판매중</a>
						</c:if>
						<c:if test="${product.sel == 'i'}">
							<a class="mp_review">거래중</a>
						</c:if>
						<c:if test="${product.sel == 'y' && product.review == 'n'}">
							<a class="mp_review">아직 리뷰가 없어요</a>
						</c:if>
						<c:if test="${product.sel == 'y' && product.review == 'y'}">
							<a class="mp_review" id="reviewPop">리뷰보기</a>
						</c:if>

					</div>
				</div>
			</c:forEach>
			<%-- </c:forEach> --%>
		</c:if>
	</div>
</body>
</html>