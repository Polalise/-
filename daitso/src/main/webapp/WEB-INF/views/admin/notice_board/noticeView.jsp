<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<%@  taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#total{
 display: flex;
 margin-top: 200px;
}
.container{
  border: 2px solid blue;
}
#sub{
  margin-right: 300px;
}
.sideMenu{
    margin-left: 300px;
}
.snb{
  font-size: 26px
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="total">
   <div class="sideMenu" style="border: 2px solid red;">
     <h2>메뉴</h2> 
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul>
            <!-- <li class=''><a href="">고객센터 메인<i></i></a></li> -->
            <!-- <li class=''><a href="" title="현재선택">자주찾는 질문<i></i></a></li> -->
            <li class=''><a href="">공지사항<i></i></a></li>
            <li class=''><a href="">이벤트<i></i></a></li>
            <li class=''><a href="">신고문의<i></i></a></li>
            <li class=''><a href="">회원관리<i></i></a></li>            
             
        </ul>
    </div>
    </div>
<div class="container" align="center" id="sub" >
  <h2 class="text-primary">공지사항 상세</h2>
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
</div>
</body>
</html>