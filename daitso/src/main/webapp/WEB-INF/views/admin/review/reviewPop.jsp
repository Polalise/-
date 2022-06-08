<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/reviewPop.css">
<title>리뷰</title>
</head>
<body>
<div class="re_product">
        <span class="pic"><img alt="" src="${path }/resources/upload/${product.thumnails}"></span>
        <div class="re_product_info">
            <a>판매자</a><a><input type="text" value="${product.p_writer }" readonly="readonly"></a>
            <a>상품이름</a><a><input type="text" value="${product.p_name }" readonly="readonly"></a>
            <a>상품가격</a><a><input type="text" value="${product.price }" readonly="readonly"></a>
        </div>
    </div>
    <div class="My_review">
        <div class="My_review_info">
            <div class="starBox"><a>별점</a>⭐x <input type="number" readonly="readonly" value="${reply.rating }" readonly="readonly"></div>
        </div>
        <div class="re_textBox">
            <a>리뷰 내용</a>
            <p><input type="text" value="${reply.replytext }" readonly="readonly"></p>
        </div>
        
    </div>
</body>
</html>