<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">회원정보 상세</h2>
		<table class="table table-striped">
			<tr>
				<td>아이디</td>
				<td>${member.id }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.name }</td>
			</tr>
			<tr>
				<td>별명</td>
				<td>${member.nickName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.address }</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>${member.phone }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email }</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${member.regdate }</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><img alt="" src="resources/upload/${member.photoName}" width="200"></td>
			</tr>
		</table>
		<a href="m_main.do" class="btn btn-info">메인</a>
	</div>
</body>
</html>