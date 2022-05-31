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
	$(function () {
		var id1 = '${id}';
//		alert(id1.length);
		id = id1.substr(0, 2) + '*' + '*' + id1.substr(4, id1.length); 
//		alert(id);
		$('#realId').text(id);
//		alert($('#realId').text(id));
	});
	
	
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="metion">${name }님의 아이디는 '<span id="realId"></span>'입니다.</h2>
	<div><a href="loginForm.do">로그인 하러 가기</a></div>
	<div class="list">
		<a href="loginForm.do" class="btn">로그인</a> 
		<a href="findIdForm.do" class="btn">아이디찾기</a> 
		<a href="findPasswordForm.do" class="btn">비밀번호찾기</a>
	</div>
</div>
</body>
</html>