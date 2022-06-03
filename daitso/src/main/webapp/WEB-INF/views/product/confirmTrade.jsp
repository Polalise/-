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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
		alert("구매 확정처리 되었습니다");
		window.open("replyWriteForm2.do?p_num=${product.p_num}", "content","width=420 height=610");
		history.back();
	</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
		alert("실패");
		history.back();
	</script>
	</c:if>
</body>
</html>