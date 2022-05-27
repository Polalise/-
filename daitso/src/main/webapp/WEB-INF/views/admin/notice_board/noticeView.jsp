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
 margin-top: 100px;
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
     #privateBtn{
     margin-left: 900px;
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
				style="width: 190px; margin-left: 0px; position: relative; top: 90px; left: 310;"></a>

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
   <div class="sideMenu" style="border: 2px solid red;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist">
            <!-- <li class=''><a href="">고객센터 메인<i></i></a></li> -->
            <!-- <li class=''><a href="" title="현재선택">자주찾는 질문<i></i></a></li> -->
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
            <li class=''><a href="reportList.do">신고문의<i></i></a></li>
            <c:if test="${id == 'admin'}">
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>
            </c:if>        
             
        </ul>
    </div>
    </div>
<div class="container" align="center" id="sub" >
  <h2 class="text-primary">공지사항 상세</h2>
   <c:if test="${id == 'admin'}">
  <div id="privateBtn">
    <a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a></td>
       </div>
       </c:if>
  <table class="table">
  <tr><td style="width: 50%;"><b>${board.subject }</b></td><td style="text-align:right;">&nbsp;조회수&nbsp;${board.readcount }&nbsp;&nbsp;&nbsp;작성일</td><td>${board.reg_date}</td></tr>
  	<c:set var = "testStr" value = "${board.fileName }"/>
  <c:if test = "${fn:contains(testStr, 'pdf')}"><tr><td id="s1" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- ${board.fileName } --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'ppt')}"><tr><td id="s2" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- ${board.fileName } --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'hwp')}"><tr><td id="s3" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- <a href="download.do?fileName=${board.fileName }">${board.fileName }</a> --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'txt')}"><tr><td id="s4" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- <a href="download.do?fileName=${board.fileName }">${board.fileName }</a> --%></td></tr></c:if>
  <tr colspan="5">
         <c:set var = "testStr" value = "${board.fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	    <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
    </td></tr> <tr><td colspan="5">${board.content }</td>
  
	
	<%-- 	<c:set var = "testStr" value = "${board.fileName }"/>
  <c:if test = "${fn:contains(testStr, 'pdf')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'ppt')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'hwp')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'txt')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if> 
 --%>

		
	<tr><td colspan="5" align="center">
      <a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
<%--       <a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a> --%></td></tr>
   
  </table>
</div>
</div>
</body>
</html>