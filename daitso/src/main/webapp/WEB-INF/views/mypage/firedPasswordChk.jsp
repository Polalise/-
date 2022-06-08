
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 확인</title>
<link rel="stylesheet" href="${path }/resources/css/fired.css">
</head>
<body>
	<c:if test="${result > 0 }">
	<div class="Fired_layout">
		<div class="Fired_bg">
			<div class="Fired_main">
				<div class="Fired_Header">
					<a>정말로 탈퇴 하시겠습니까?</a>
				</div>
				<form action="firedPasswordChk.do" name="frm">
					<div class="fired_btn_div">
						<input type="hidden" name="id" value="${member.id }">
						<a href="firedmember.do?id=${member.id }" class="fired_submit_a">확인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("암호가 일치하지 않어요");
			history.back();
		</script>
	</c:if>
</body>
</html>