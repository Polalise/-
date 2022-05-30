<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("resources/css/login.css");
</style>
</head>
<body>
	<div class="container" align="center">
		<h2 class="metion">로그인</h2>
		<div class="wap">
			<form action="login.do" method="post">
				<table class="table">
					<tr>
						<td><input type="text" name="id" required="required"
							autofocus="autofocus" class="form-control glyphicon"
							placeholder="&#xe008아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="password"
							required="required" class="form-control glyphicon"
							placeholder="&#xe033비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							id="login" value="로그인" class="btn btn-warning"
							style="background: #FBE0C4;"></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<a href="joinForm.do" class="btn">회원가입</a> <a href="findIdForm.do"
				class="btn">아이디찾기</a> <a href="findPasswordForm.do" class="btn">비밀번호찾기</a>
		</div>
	</div>
</body>
</html>
 