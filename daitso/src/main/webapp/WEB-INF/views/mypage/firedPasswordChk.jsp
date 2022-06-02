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
	정말 탈퇴?
		<a href="firedmember.do?id=${member.id }">ㄱㄱㄱ</a>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
		alert("암호가 일치하지 않어요");
		history.back();
	</script>
	</c:if>
</body>
</html>