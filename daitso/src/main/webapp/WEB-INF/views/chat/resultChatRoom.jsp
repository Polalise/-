<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("채팅 시작합니다.");
		location.href="http://61.75.24.60:8080/daitso/chatRoom.do?p_num=${product.p_num }";
		// location.href="http://172.30.1.43:8080/daitso/chatRoom.do?p_num=${product.p_num }";
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("채팅 실패 ㅠㅠ");
		hisotry.go(-1);
	</script>
</c:if>
</body>
</html>