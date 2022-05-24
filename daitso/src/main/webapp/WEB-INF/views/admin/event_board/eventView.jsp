<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%@  taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
  margin-top: 100px; 
border: 2px solid blue;
}
</style>
</head>
<style type="text/css">
.sideMenu{
  /*   margin-left: 300px; */
  position: relative;
    left: 270px;
    top: 100px;
}
#total{
    display: flex;
   /*  margin-top: 200px; */
}
#sub{
  margin-right: 300px;
}
.snb{
  font-size: 26px
}
/* 사이드 */
 ul.mylist {
          list-style-type: none;
          background-color: #fff;
          width: 200px;
          padding: 0;
          margin: 0;
          border: 2px solid;
          font-size: 20px;
     }

     li a {
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li a:hover {
          background-color: tomato;
          color: #fff;
     }
</style>
<body>
<div id="total" style="display: flex;">
  <div class="sideMenu" style="border: 2px solid red;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist">
            <li class='a1'><a href="noticeList.do">공지사항<i></i></a></li>
            <li class='a2'><a href="eventList.do">이벤트<i></i></a></li>
            <li class='a3'><a href="">신고문의<i></i></a></li>
            <li class='a4'><a href="adminMemberList.do">회원관리<i></i></a></li>               
        </ul>
    </div>
    </div>
<div class="container" align="center">
  <h2 class="text-primary">이벤트 상세</h2>
  <table class="table">
  <tr><td style="width: 50%;"><b>${board.e_subject }</b></td><td style="text-align:right;">조회수${board.e_readcount }</td><td style="text-align:right;">이벤트기간</td><td>${board.e_start_date} ~ ${board.e_end_date}</td></tr>
	<tr><td colspan="6"><c:set var = "testStr" value = "${board.e_fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }" width="800"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }" width="800"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }" width="800"></td></tr></c:if>
	   <%--   <c:if test = "${fn:contains(testStr, 'null')}">
	     <tr><td colspan="5"><img alt="" src="resources/images/2.png" width="200"></td></tr></c:if> --%>
	     </tr>
	     <td colspan="7">${board.e_content }</td>

   <%-- <tr><td>사진</td><td><img alt="" src="resources/upload/${board.e_fileName }" width="200"></td></tr> --%>
  <%--  <c:set var = "testStr" value = "${board.e_fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <tr><td><img alt="" src="resources/upload/${board.e_fileName }" width="200"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <tr><td><img alt="" src="resources/upload/${board.e_fileName }" width="200"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	     <tr><td><img alt="" src="resources/upload/${board.e_fileName }" width="200"></td></tr></c:if>
	     <c:if test = "${fn:contains(testStr, 'null')}">
	     <tr><td><img alt="" src="resources/images/2.png" width="200"></td></tr></c:if> --%>
	<tr><td colspan="6" align="center">
      <a href="eventList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
      <a href="eventUpdateForm.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="eventDelete.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a>
   </td></tr>
  </table>
</div>
</div>
</body>
</html>