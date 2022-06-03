<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("resources/css/login.css");</style>
</head>
<body>
	<div class="container" align="center">
		<h2 class="metion">아이디 찾기</h2>
		<h3>회원 정보로 등록한 이메일 인증</h3>
		<div class="wap">
			<form action="findIdCheck.do" method="post">
				<table class="table">
					<tr>
						<td><input type="text" name="name" required="required"
							autofocus="autofocus" class="form-control glyphicon"
							placeholder="&#xe177이름"></td>
					</tr>
					<tr>
						<td><input type="email" name="email" required="required"
							class="form-control glyphicon" placeholder="&#x2709이메일"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" id="login" value="아이디 찾기" 
						class="btn btn-warning" style="background: #FBE0C4;"></td>
					</tr>
				</table>
			</form>
			<a href="joinForm.do" class="btn">회원가입</a>
			<a href="findIdForm.do" class="btn">아이디찾기</a> 
			<a href="findPasswordForm.do" class="btn">비밀번호찾기</a>
		</div>
		</div>
</body>
</html>