<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div class="top">
            <span class="logoImg">
                <img src="${path }/resources/images/logo.png" onclick="location.href='main.do'">
            </span>
            <div class="top_bg1">
                <div class="tier_bg">현재 ${tierBC} 등급 입니다</div>
            </div>
        </div>
</body>
</html>