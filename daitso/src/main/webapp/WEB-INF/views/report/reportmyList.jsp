<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a:link {
  text-decoration: none;
}
 
a:visited {
  text-decoration: none;
}
 
a:hover {
  text-decoration: underline;
  font-weight: bold;
}
 
a:active {
  text-decoration: underline;
   font-weight: bold;
}
.sideMenu{
    margin-left: 300px;
}
#total{
    display: flex;
    margin-top: 200px;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="total">
   <div class="sideMenu" style="border: 2px solid red;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist">
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
            <li class=''><a href="">신고문의<i></i></a></li>
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>               
        </ul>
    </div>
    </div>
    
	<div class="container" id="sub" align="center" style="border: 2px solid blue;">
		<h2 class="text-primary">신고내역</h2>
		    
	   
		<div class="table-responsive">  
		<table class="table">
			<tr>
			    <th style="width:10%;">번호</th>
				<th style="width:10%;">신고자</th>
				<th style="width:10%;">피신고자</th>
				<!-- <th>작성자</th> -->
				<th style="width:20%;">내용</th>
				<th style="width:10%;">작성일</th>
				<th style="width:10%;">상태</th>
			</tr>
			<!-- 신고 한사람 리스트 -->
			<c:if test="${empty list2}">
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:if> 
			<c:if test="${not empty list2}">
				<c:forEach var="report" items="${list2}">
               <c:if test="${report.reporter_id == id or report.criminal_id == id}"> 
                <%-- <c:if test="${id == 'report.reporter_id'}" > --%>
					<tr> 
						  <td>${num}<c:set var="num" value="${num - 1}"></c:set>${board.num }</td>
						<%-- <c:if test="${report.del == 'y' }">
							<td colspan="4">삭제된 글입니다.</td>
						</c:if> --%>
						        <td>${report.reporter_id}</td>
						        <td>${report.criminal_id}</td>
							<td title="${report.reasonChk}" class="sub2"><a
								href="reportView.do?report_num=${report.report_num }&pageNum=${pb.currentPage}"
								<%-- href="noticeView.do?num=${notice.num }&pageNum=${pb.currentPage}&id=${notice.id}" --%>
								class="sub2">[${report.reasonChk}] ${report.reasonText}</a> 
							 		<td>${report.report_date}</td>
							 		<td>${report.progress}</td>
						
					</tr>
					 </c:if>  
				</c:forEach>
				</c:if>
			 
			<!-- 신고 당한사람 리스트 -->
		<%-- 	<c:if test="${id == '${criminalId}'}" >
			<c:if test="${empty list3 }">
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list3 }">
				<c:forEach var="report" items="${list3 }">
               
					<tr>
						 <td>${num2}<c:set var="num" value="${num2 - 1}"></c:set>${board.num }</td> 
						<c:if test="${report.del == 'y' }">
							<td colspan="4">삭제된 글입니다.</td>
						</c:if>
						        <td>${report.reporter_id}</td>
						        <td>${report.criminal_id}</td>
							<td title="${report.reasonChk}" class="sub2"><a
								href="reportView.do?report_num=${report.report_num }&pageNum=${pb.currentPage}"
								href="noticeView.do?num=${notice.num }&pageNum=${pb.currentPage}&id=${notice.id}"
								class="sub2">[${report.reasonChk}] ${report.reasonText}</a> 
							 		<td>${report.report_date}</td>
							 		<td>${report.progress}</td>
						
					</tr>
				</c:forEach>
				</c:if>
			</c:if> --%>
			
		</table>
		</div>
		</div>
	
 <%-- <c:if test="${id == 'admin'}">
		<div align="center">
			<a href="noticeWriteForm.do?num=0&pageNum=1" class="btn btn-success">게시글
				입력</a>
		</div>
		</c:if> --%>
	</div>
	</div>
</body>
</html>