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
	function reviewPop(p_num) {
		var pop = window.open(
			"reviewPop.do?p_num="+p_num, "content",
			"width=510 height=560");
	};
	
	function replywrite(p_num) {
		var pop = window.open(
				"replyWriteForm2.do?p_num="+p_num, "content",
				"width=420 height=610");
				location.reload();
	};
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
		<c:if test="${not empty myBuyList && product.p_del != 'y'}">
			<c:forEach var="product" items="${myBuyList }">
				<div class="viewList">
					<div class="product">
						<span class="thumbnail">
						<img src="${path}/resources/upload/${product.thumnails}"></span>
						<a class="mp_name" href="p_view.do?p_num=${product.p_num}">${product.p_name}</a>
						<a class="mp_date">${product.updateday}</a>
						<a class="mp_price">${product.price}</a>
						<a class="mp_writer">${product.p_writer}</a>
						
						<c:if test="${product.review == 'n' }">
							<a onclick="replywrite(${product.p_num})" class="mp_review">리뷰 쓰러가기 !</a>
						</c:if>
						<c:if test="${product.review == 'y' }">
							<a onclick="reviewPop(${product.p_num})" class="mp_review">리뷰 보러가기</a>
						</c:if>
						
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
</body>
</html>