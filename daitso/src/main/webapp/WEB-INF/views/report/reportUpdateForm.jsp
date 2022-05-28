<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<%@  taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("resources/css/main.css");
#total{
 display: flex;

}
.container{
  border: 2px solid blue;
}
#sub{
 width:90%;
 padding: 20px;
}
.sideMenu{

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
     #privateBtn{
     margin-left: 950px;
     }
     #s1{
     width: 10%
     }
        #s2{
     width: 10%
     }
        #s3{
     width: 10%
     }
        #s4{
     width: 10%
     }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="intro_bg">
			<a href="p_list.do"><img alt="" id="Im2g" src="${path }/resources/images/logo.png"
				style="width: 190px; margin-left: 0px; position: relative; top: 35px; left: 310;"></a>

			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon" style="display: none;"> <label
						for="icon"> <span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="p_list.do">◾메인</a></li>
							<br>
							<c:if test="${id != 'admin' }">
								<li><a href="myProfileForm.do">◾마이페이지</a></li>
								<br>
							</c:if>
							<c:if test="${id == 'admin' }">
								<li><a href="adminMemberList.do">◾회원관리</a></li>
								<br>
							</c:if>
							<li><a href="noticeList.do">◾공지사항</a></li>
							<br>
							<li><a href="eventList.do">◾이벤트</a></li>
							<br>
							
						</ul>
					</div>

					<form action="list.do?pageNum=1">
						<div class="searchs">
							<select name="search" style="height: 63px;">
								<!-- select바 한글화 -->
								<c:forTokens var="sh" items="subcon,p_writer,p_name,p_content"
									delims="," varStatus="i">
									<c:if test="${sh == product.search }">
										<option value="${sh }" selected="selected">${title[i.index] }</option>
									</c:if>
									<c:if test="${sh != product.search }">
										<option value="${sh }">${title[i.index] }</option>
									</c:if>
								</c:forTokens>
							</select><input class="searchr" type="text" name="keyword"
								value="${product.keyword }" placeholder="검색어 입력"> <input
								class="input" type="submit" value="검색" style="margin-right: 65;">
						</div>
					</form>
				</div>
				<button class="chats">
					<img src="${path }/resources/images/main2.png" width="15"
						height="16" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="myProfileForm.do"><img
					src="${path }/resources/images/main1.png" width="15" height="16"
					alt="내상점버튼 이미지">내상점</a> <a class="products"><img
					src="${path }/resources/images/main3.png" width="15" height="16"
					alt="판매하기버튼 이미지"
					onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
				<c:if test="${id != 'admin' }">
					<a class="links" href='adminMain2.do'>고객센터</a>
				</c:if>
				<c:if test="${id == 'admin' }">
					<a class="links" href="adminMain.do">관리자페이지</a>
				</c:if>
				<a class="links" href='logout.do'>로그아웃</a>
			</div>
		</div>
<div id="total">
  <div class="sideMenu" style="border-left: 1px solid; border-top: 1px solid white;  background-color: #FBE0C4; height: 900px;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist" style=" background-color: #FBE0C4;  ">
            <li class='' ><a href="noticeList.do" style="color: white; font-weight: 200px; text-align: center;">공지사항<i></i></a></li>
            <li class='' ><a href="eventList.do" style="color: white; font-weight: 200px; text-align: center;">이벤트<i></i></a></li>
            <c:if test="${id != 'admin'}">
            <li class='' ><a href="reportmyList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="reportList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="adminMemberList.do" style="color: white; font-weight: 200px; text-align: center;"><b>회원관리</b><i></i></a></li>    
            </c:if>           
        </ul>
    </div>
    </div>
  
<div class="" id="sub" >
    <h3 class="title"style="font-size: xx-large; position: relative; bottom: 30px; margin-top: 50px;">
				<b>신고처리</b>
			</h3>
  
  <table class="table">
  <form method="post" action="reportUpdate.do">
  <input type="hidden" name="report_num" value="${report_num}">
  <input type="hidden" name="criminal_id" value="${report.criminal_id}">
  <tr><td style="width:10%;">신고항목 <b>[${report.reasonChk}]</b></td><td style="text-align:right;">상태<b> ${report.progress}</b>&nbsp;&nbsp;작성일<b> ${report.report_date}</b></td></tr>
  <tr><td style="width:20%;">신고자<b> ${report.reporter_id}</b><td colspan="2">피신고자<b> ${report.criminal_id}</b></td></tr>
  <tr><td style="width:10%;">신고내용</td><td colspan="2">${report.reasonText}</td>
  <tr><td colspan="5">벌점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="score"></td></tr>
  <tr><td colspan="1">코멘트</td><td><textarea rows="10" cols="100" name="adminText" required="required"></textarea></td></tr>
  <tr><td colspan="5" ><input type="submit" value="확인" style="margin-left: 800px;"></td></tr>
  	</form>
	<tr><td colspan="5" align="center">
      <a href="reportList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
<%--<a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a>--%></td></tr>
   
  </table>
</div>
</div>
</body>
</html>