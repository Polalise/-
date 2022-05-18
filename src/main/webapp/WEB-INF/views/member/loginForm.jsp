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
	
	table {
		width: 460px;
		border: none;
		align-items: center;
	}
	
	td {
		text-align: center; 
		border: none;
	}
	
	.glyphicon {
		height: 65px;
		font-size: 20px;
	}
	
	#login {
		width: 460px;
		height: 60px;
		align-items: center;
		font-size: 25px;
	}
	
	div>a{ 
	text-align: center;
	text-decoration-line: none;
	color: 444444;
	}
</style>
</head>
<body>
	<div class="container" align="center">
		<h2 class="metion">로그인</h2>
		<form action="login.do" method="post">
			<table class="table">
				<tr>
					<td><input type="text" name="id" required="required" autofocus="autofocus" class="form-control glyphicon" placeholder="&#xe008아이디"></td>
				</tr>
				<tr>
					<td><input type="password" name="password" required="required" class="form-control glyphicon" placeholder="&#xe033비밀번호"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" id="login" value="로그인" class="btn btn-warning"></td>
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