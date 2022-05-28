<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/buyList.css">
<meta charset="UTF-8">
<title>구매목록</title>
<script type="text/javascript">
	$(function() {
		$('#reviewPop').click(
				function() {
					var pop = window.open(
							"reviewPop.do?p_num=${product.p_num}", "content",
							"width=620 height=700");
				});
	});
</script>
</head>
<div class="list">
	<div class="header">
		<div class="header_title">구매목록</div>
		<div class="header_info">
			<a class="title">구매 물품</a> <a class="b_date">구매 날짜</a> <a
				class="b_price">구매 가격</a> <a class="dealer">판매자</a> <a
				class="b_review">리뷰</a>
		</div>
		<c:if test="${empty myBuyList}">
			<div class="viewList">
				<div class="product">아직 구매한 적이 없어요!</div>
			</div>
		</c:if>
		<c:if test="${not empty myBuyList && p_del != 'y'}">
			<c:forEach var="product" items="${myBuyList }">
				<div class="viewList">
					<div class="product">
						<span class="thumbnail"> <img
							src="${path}/resources/upload/${product.thumnails}"></span> <a>${product.p_name}</a>
						<a>${product.updateday}</a> <a>${product.price}</a> <a>${product.p_writer}</a>
						<%-- <c:if test="${product.review == 'n' }">
										<a>리뷰 쓰러가기 !</a>
									</c:if>
									<c:if test="${product.review == 'y' }">
										<a id="reviewPop">리뷰 보러가기</a>
									</c:if> --%>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
</body>
</html>