<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	비밀번호를 입력해 주세요
	<form action="firedPasswordChk.do" name="frm">
		<input type="password" name="password" required="required">
		<input type="hidden" name="id" value="${member.id }" >
		<input type="submit" value="탈퇴">
	</form>
</body>
</html>