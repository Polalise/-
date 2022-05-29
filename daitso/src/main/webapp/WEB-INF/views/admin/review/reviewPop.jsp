<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	img{
		width: 150px;
		height: 150px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<input type="text" value="${product.p_writer }">
	<img alt="" src="${path }/resources/upload/${product.thumnails}">
	<input type="text" value="${reply.rno }">
	<input type="text" value="${reply.replytext }">
	<input type="text" value="${reply.regdate }">
	<input type="text" value="${reply.del }">
	<input type="text" value="${reply.p_num }">
	<input type="text" value="${reply.id }">
	<input type="text" value="${reply.rating }">
	<input type="text" value="${reply.seller }">
</body>
</html>