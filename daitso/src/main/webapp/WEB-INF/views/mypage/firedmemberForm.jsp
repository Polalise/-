<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="${path }/resources/css/fired.css">
</head>
<body>
	<div class="Fired_layout">
		<div class="Fired_bg">
			<div class="Fired_main">
				<div class="Fired_Header">
					<a>비밀번호를 입력해 주세요</a>
				</div>
				<form action="firedPasswordChk.do" name="frm">
					<div class="fired_btn_div">
						<input type="password" name="password" required="required" class="passInput">
						<input type="hidden" name="id" value="${member.id }">
						<input type="submit" value="확인" class="fired_submit">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>