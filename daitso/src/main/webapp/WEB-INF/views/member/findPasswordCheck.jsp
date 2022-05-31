<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("resources/css/login.css");</style>
<script type="text/javascript">
	function Chk() {
		if (frm.num.value == frm.numChk.value) {
			frm.action = "findPasswordResultForm.do";
			frm.submit();			
		} else {
			alert("인증번호가 일치 하지 않습니다.")
			history.back();
		}
		return false;
	}
</script>
</head>
<body>
	<div class="container" align="center">
	
	<!-- 이름과 이메일이 일치한 회원이 있을 때 나타남 -->
	<c:if test="${result == 1}">
	<h2 class="metion">${member.id}님, 전송 받은 인증 번호를 입력하시오</h2>
	<div class="wap">
		<form name="frm" method="post" onsubmit="return Chk()">
		<input type="hidden" name ="num" value="${msg }">
		<input type="hidden" name ="name" value="${member.name }">
		<input type="hidden" name ="id" value="${member.id }">
			<table class="table">
				<tr>
					<td><input type="number" name="numChk" required="required" autofocus="autofocus" placeholder="인증번호를 입력하세요"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="확인" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
	</c:if>
	
	<!-- 이름과 이메일이 일치하지 않으면 나타남 -->
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("잘못된 회원 정보입니다. 다시 입력해 주세요");
			history.back();
		</script>
	</c:if>
	</div>
</body>
</html>