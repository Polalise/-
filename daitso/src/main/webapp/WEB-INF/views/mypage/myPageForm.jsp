<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/myPage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="my_layout">
		<tiles:insertAttribute name="myPage_header"></tiles:insertAttribute>
		<div class="main">
			<tiles:insertAttribute name="myPage_menu"></tiles:insertAttribute>
			<tiles:insertAttribute name="myPage_body"></tiles:insertAttribute>
		</div>
	</div>
	<tiles:insertAttribute name="myPage_footer"></tiles:insertAttribute>
</body>
</html>