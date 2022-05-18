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
<div class="container" align="center">
  <h2 class="text-primary">이벤트 상세</h2>
  <table class="table table-striped">
  <tr><td>제목</td><td>${board.e_subject }</td>
		<td>조회수</td><td>${board.e_readcount }</td></tr>
	<tr><td>작성자</td><td>${board.id }</td>
		<td>이벤트기간</td><td>${board.e_start_date} ~ ${board.e_end_date}</td></tr>
	<tr><td>내용</td><td colspan="3"><pre>${board.e_content }</pre></td></tr>
	<tr><td colspan="2">
   <tr><td>사진</td><td><img alt="" src="resources/upload/${board.e_fileName }" width="200"></td></tr>
	<tr><td colspan="3" align="center">
      <a href="eventList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
      <a href="eventUpdateForm.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="eventDeleteForm.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a>
   
  </table>
</div>

</body>
</html>