<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.table2{
    margin-top: 250px;
   
    border: 2px solid black;
}
.table{
    border: 2px solid blue;
}
#member_box{
 margin-left: 600px;
 margin-top:  200px;
}
</style>

</head>
<body>
	<!-- 회원정보 테이블 -->
	<div class="col-md-5" id="member_box" align="center">
		<h2 class="title">회원정보</h2>
		<table class="table">
			<tr>
				<th class="col-md-2 text-center">아이디</th>
				<td class="col-md-5">${member.id }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">비밀번호</th>
				<td class="col-md-5">${member.password }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">이름</th>
				<td class="col-md-5">${member.name }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">닉네임</th>
				<td class="col-md-5">${member.nickName }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">연락처</th>
				<td class="col-md-5">${member.phone }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">주소</th>
				<td class="col-md-5">${member.address }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">이메일</th>
				<td class="col-md-5">${member.email }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center">레벨</th>
				<td class="col-md-5">${member.grade}</td>
			</tr>
				<tr>
				<th class="col-md-2 text-center">등록일</th>
				<td class="col-md-5">${member.regdate }</td>
			</tr>	
		</table>
		<div align="center">
			<a href="adminUpdateForm.do?id=${member.id }&pageNum=${pageNum }" class="btn_sm_full">회원정보수정</a>
			<a href="adminMemberList.do?pageNum=${pageNum }" class="btn_sm_stroke">이전</a>
		</div>
	</div>  
	

</body>
</html>    