<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<%@  taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
  <h2 class="text-primary">게시글 상세</h2>
  <table class="table table-striped">
  <tr><td>제목</td><td>${board.subject }</td></tr>
		<tr><td>조회수</td><td>${board.readcount }</td></tr>
	<tr><td>작성자</td><td>${board.id }</td></tr>
		<tr><td>작성일</td><td>${board.reg_date}</td></tr>
	<tr><td>내용</td><td colspan="3"><pre>${board.content }</pre></td></tr>
	
		<c:set var = "testStr" value = "${board.fileName }"/>
  <c:if test = "${fn:contains(testStr, 'pdf')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'ppt')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'hwp')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'txt')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if> 


			<c:set var = "testStr" value = "${board.fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <tr><td>사진</td><td><img alt="" src="resources/upload/${board.fileName }" width="200"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <tr><td>사진</td><td><img alt="" src="resources/upload/${board.fileName }" width="200"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	     <tr><td>사진</td><td><img alt="" src="resources/upload/${board.fileName }" width="200"></td></tr></c:if>
	<tr><td colspan="3" align="center">
      <a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
      <a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a></td></tr>
   
  </table>
</div>

</body>
</html>