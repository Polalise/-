<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/likeList.css">
<meta charset="UTF-8">
<title>찜목록</title>
<script type="text/javascript">
function delAction(p_num,id) {
	 $.post('deleteLikes.do', "id="+id+"&p_num="+p_num, function(data) {
 		location.reload();
     });
}
</script>
</head>
<body>
<input type="hidden" value="${product.p_num}">
<input type="hidden" value="${id }">
	<div class="list">
		<a class="header">물품리스트</a>
		<c:if test="${empty likeList }">
					찜한 상품이 없어요!
				</c:if>
		<c:if test="${not empty likeList }">
			<c:forEach var="product" items="${likeList }">
				<div class="product">
					<div class="thumbnail">
						<img src="${path}/resources/upload/${product.thumnails}">
						<span class="likeBtn" onclick="delAction(${product.p_num},'${id}')">
							<img alt="" src="${path}/resources/images/likes.png">
						</span>
					</div>
					<div class="info">
						<a>${product.p_name }</a>
						<a>${product.price }</a>
						<a>${product.p_date }</a>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>