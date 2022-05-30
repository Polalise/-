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
@import url("resources/css/main2.css");
.container{
  margin-top: 100px; 
border: 2px solid blue;
}
</style>
</head>
<style type="text/css">
.sideMenu{
  /*   margin-left: 300px; */
/*   position: relative;
    left: 270px;
    top: 100px; */
}
#total{
    display: flex;
   /*  margin-top: 200px; */
}
#sub{
   width: 90%;
   padding: 20px;
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
       margin-left: 1540px;
       margin-bottom: 20px;
     }
</style>
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
<div id="total" style="display: flex;">
   <div class="sideMenu" style="border-left: 1px solid; border-top: 1px solid white;  background-color: #FBE0C4;">
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
<div class="" id="sub">
  <h2 class="text-primary">이벤트 상세</h2>
    <c:if test="${id == 'admin'}">
  <div id="privateBtn">
    <a href="eventUpdateForm.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="eventDelete.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a>
       </div>
       </c:if>
  <table class="table">
  <tr><td style="width: 50%;"><b>${board.e_subject }</b></td><td style="text-align:right; width: 30%;">조회수${board.e_readcount }</td><td style="text-align:right;">이벤트기간</td><td>${board.e_start_date} ~ ${board.e_end_date}</td></tr>
	<tr><td colspan="6"><c:set var = "testStr" value = "${board.e_fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }"  width="900" style="margin-left: 350;"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }"  width="900" style="margin-left: 350;"></td></tr></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	     <tr><td colspan="5"><img alt="" src="resources/upload/${board.e_fileName }"  width="900" style="margin-left: 350;"></td></tr></c:if>
	   <%--   <c:if test = "${fn:contains(testStr, 'null')}">
	     <tr><td colspan="5"><img alt="" src="resources/images/2.png" width="200"></td></tr></c:if> --%>
	     </tr>
	     <td colspan="7"><pre style=" white-space: pre-wrap;">${board.e_content }</pre></td>

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
    <%--   <a href="eventUpdateForm.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="eventDelete.do?e_num=${board.e_num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a> --%>
   </td></tr>
  </table>
</div>
</div>
</body>
</html>