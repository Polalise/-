<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
  		display: flex; 
  		flex-direction: column;
  		justify-content: center;
  		align-items: center;
  		min-height: 90vh;	
	}
	
	form{
		width: 460px;
	}
	
	.mention { color: 444444;}
</style>
</head>
<body>
	<div class="container" align="center">
	<h2 class="metion">아이디 찾기</h2>
	<h3>회원 정보로 등록한 이메일 인증</h3>
		<form action="findIdCheck.do" method="post">
			<table class="table">
				<tr>
					<td><input type="text" name="name" required="required" autofocus="autofocus" class="form-control glyphicon" placeholder="&#xe177이름"></td>
				</tr>
				<tr>
					<td><input type="email" name="email" required="required" class="form-control glyphicon" placeholder="&#x2709이메일"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" id="login" value="아이디 찾기" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
		<div>
			<a href="joinForm.do" class="btn">회원가입</a> 
			<a href="findIdForm.do" class="btn">아이디찾기</a> 
			<a href="findPasswordForm.do" class="btn">비밀번호찾기</a>
		</div>
	</div>
</body>
</html>