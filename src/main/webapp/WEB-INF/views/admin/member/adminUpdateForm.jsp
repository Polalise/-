<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.narrowWidth1-1 {
   	 width: 70%;  
   	} 
   	.inputline1{  
	    border: none;
	    outline: 0;
	    width: 64%;  
     }
     .narrowWidth2 {
   	 width: 65%;  
   	} 
</style>
</head>
<body>
	<div class="container narrowWidth1-1" align="center">
		<h2 class="title">회원정보 수정</h2>
		<form action="adminUpdate.do" method="post" name="frm">
			<input type="hidden" name="id" value="${member.id }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table narrowWidth2">
				<tr>
					<td class="col-md-5 text-center">아이디</td>
					<td class="col-md-7">${member.id }</td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">비밀번호</td>
					<td class="col-md-7"><input type="text" name="password" value="${member.password }" class="inputline1"
						autofocus="autofocus" required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">이름</td>
					<td class="col-md-7"><input type="text" name="name" value="${member.name }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">닉네임</td>
					<td class="col-md-7"><input type="text" name="nickName" value="${member.nickName }"
						  class="inputline1"  required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">연락처</td>
					<td class="col-md-7"><input type="text" name="phone" value="${member.phone }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">주소</td>
					<td class="col-md-7"><input type="text" name="address" value="${member.address }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">이메일</td>
					<td class="col-md-7"><input type="text" name="email" value="${member.email }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">레벨</td>
					<td class="col-md-7"><input type="text" name="level" value="${member.level }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"
						class="btn_sm_full"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>