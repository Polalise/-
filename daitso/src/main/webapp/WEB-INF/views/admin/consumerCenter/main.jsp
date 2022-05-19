<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html><html><head>
<link rel="stylesheet" type="text/css" href="/daitso/resources/main.css">
<meta charset="UTF-8">

<title>Insert title here</title></head><body>
<div id="btn group" style="text-align: center; margin-top: 200px">
<h2>관리자페이지</h2>
<p>관리자님어서오세요</p>
<div style="display: flex; margin-left: 500px; margin-top: 60px; ">
<div id="g1" style="margin-right: 30px;">
<button id="b1" onClick="location.href='noticeList.do'">공지사항</button>
</div>
<div id="g2" style="margin-right: 30px;">
<button id="b2" onClick="location.href='eventList.do'">Event</button>
</div>
<div id="g4" style="margin-right: 30px;">
<button id="b4" onClick="location.href='replyWriteForm2.do?rno=0&pageNum=1&num=1'">신고관리</button>
</div>
<div id="g3">
  <button id="b3" onClick="location.href='adminMemberList.do?'">회원관리</button>
 <!-- <button id="b3" onClick="location.href='chart.do?'">차트</button> -->

</div>
</div>
</div>
</body>
</html>