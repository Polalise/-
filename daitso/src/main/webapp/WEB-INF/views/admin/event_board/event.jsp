<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("resources/css/main2.css");
.sideMenu{
    /* margin-left: 300px; */
       /*  margin-top: 100px; */
}
#total{
  /*  margin-left: 250px;
       margin-top: 300px; */
}
#sub{
  margin-right: 300px;
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
          text-align: center;
     }

     li.a1{
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li.a1:hover {
          background-color: tomato;
          color: #fff;
     }
     li.a2 {
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li.a2:hover {
          background-color: tomato;
          color: #fff;
     }
        li.a3 {
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li.a3:hover{
          background-color: tomato;
          color: #fff;
     }
     li.a4{
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li.a4:hover {
          background-color: tomato;
          color: #fff;
     }
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이벤트</title>
<link rel="stylesheet" href="resources/default.css">
<link rel="stylesheet" href="resources/style.css">
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

					<form action="eventlist.do?pageNum=1">
						<div class="searchs">
							<select name="search" style="height: 50px;">
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
								value="${product.keyword }" placeholder="검색어 입력" style="height: 50px;"> <input
								class="input" type="submit" value="검색" style="margin-right: 0;width: 9%;height: 50px;  ">
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
					<a class="links" href="adminMain.do" style="width: 160px;">관리자페이지</a>
				</c:if>
				<a class="links" href='logout.do'>로그아웃</a>
			</div>
		</div>
<div id="total" style="display: flex;">
  <div class="sideMenu" style="font-size: 26px; background-color: #FBE0C4;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist" style="border-top: 1px solid white; background-color: #FBE0C4;">
            <li class='a1'><a href="noticeList.do" style="color: white; font-weight: 200px; text-align: center;">공지사항<i></i></a></li>
            <li class='a2'><a href="eventList.do" style="color: white; font-weight: 200px; text-align: center;">이벤트<i></i></a></li>
            <c:if test="${id != 'admin'}">
            <li class='a3'><a href="reportmyList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='a3'><a href="reportList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='a4'><a href="adminMemberList.do" style="color: white; font-weight: 200px; text-align: center;">회원관리<i></i></a></li>
            </c:if>               
        </ul>
    </div>
    </div>
    <div id="second" style="">
	<!-- <div>
		<h5 style="font-size: xx-large; ">이벤트 게시판</h5>
	</div> -->
	<h5 style="font-size: xx-large; margin-left: 50px; margin-top: 50;">이벤트 게시판</h5>
	<form action=" eventList.do?pageNum=1"
		style="margin-left: 1210px; margin-bottom: 20px;">
		<select name="search">
			<c:forTokens var="sh" items="e_subject,e_content,subcon"
				delims="," varStatus="i">
				<c:if test="${sh==board.search }">
					<option value="${sh}" selected="selected">${title[i.index]}</option>
				</c:if>
				<c:if test="${sh!=board.search }">
					<option value="${sh}">${title[i.index]}</option>
				</c:if>
			</c:forTokens>
		</select> <input type="text" name="keyword" value="${board.keyword }">
		<input type="submit" id="btn1" value="검색">
	</form>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
	</c:if>



	<div class="event_list">

		<ul style="margin-left: 153px;">
			<c:if test="${not empty list }">
				<c:forEach var="event" items="${list }">

					<li><a 
						href="eventView.do?e_num=${event.e_num }&pageNum=${pb.currentPage}&id=${event.id}">
							<div class="img">
								<c:set var="testStr" value="${event.e_fileName }" />
								<c:if test="${fn:contains(testStr, 'png')}">

									<img alt="" src="resources/upload/${event.e_fileName }">
								</c:if>
								<c:if test="${fn:contains(testStr, 'jpg')}">

									<img alt="" src="resources/upload/${event.e_fileName }">
								</c:if>
								<c:if test="${fn:contains(testStr, 'jpeg')}">

									<img alt="" src="resources/upload/${event.e_fileName }">
								</c:if>
								<c:if test="${fn:contains(testStr, 'null')}">


									<img alt="" src="resources/images/2.png">

								</c:if>
							</div> <em>
								<%-- <c:if test="sysdate < ${event.e_end_date} ">
							
							진행중
							</c:if> --%> <c:set var="today" value="<%=new java.util.Date()%>" />



								<c:choose>

									<c:when
										test="${today ge event.e_start_date && today le event.e_end_date}">진행중</c:when>

									<c:otherwise>종료</c:otherwise>

								</c:choose>
						</em>
							<div class="info">
								<strong>${event.e_subject }</strong>
								<p>
									<span>이벤트기간</span>&nbsp;&nbsp;&nbsp;${event.e_start_date} ~
									${event.e_end_date}
								</p>
							</div>
					</a></li>
				</c:forEach>
			</c:if>
		</ul>

	</div>

	<!-- <p class="aaa"></p>
	<div class="paging">
		<ul>
			<li class="first"><a href=""><span class="hide">첫페이지</span></a></li>
			<li class="prev"><a href=""><span class="hide">이전페이지</span></a></li>
			<li><a href="" class="on">1</a></li>
			<li><a href="">2</a></li>
			<li class="next"><a href=""><span class="hide">다음페이지</span></a></li>
			<li class="last"><a href=""><span class="hide">마지막페이지</span></a></li>
		</ul>
	</div> -->
	<div align="center" style="margin-left: 60;">
		<ul class="pagination">
			<!-- 제일처음으로 가기 -->
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li><a href="eventList.do?pageNum=1"> <span
						class="glyphicon glyphicon-backward"></span>
				</a></li>
			</c:if>
			<!-- 블럭 뒤로오게하기 -->
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li><a href="eventList.do?pageNum=${pb.startPage-1 }"> <span
						class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<!-- 갯수만큼 1로시작해서 ~10깨까지 보여주기 -->
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
				<!-- page 누를때 안누를때 구분하려고 -->
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a href="list.do?pageNum=${i }">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="eventList.do?pageNum=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- 블럭 움직이는것 -->
			<c:if test="${pb.endPage < pb.totalPage}">
				<li><a href="eventList.do?pageNum=${pb.endPage+1 }"> <span
						class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
			</c:if>
			<!-- 제일끝으로가는거 -->
			<!-- 보여줄것이 남아 있으면 endPage보다 totalpage가 크다 -->
			<c:if test="${pb.endPage < pb.totalPage}">
				<li><a href="eventList.do?pageNum=${pb.totalPage }"> <span
						class="glyphicon glyphicon-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
 <c:if test="${id == 'admin'}">
	<div align="center" style="margin-left: 60;;">
		<a href="eventWriteForm.do?e_num=0&pageNum=1" class="btn btn-success">게시글
			입력</a>
	</div>
	</c:if>
</div> <!-- second -->
</div>




</body>
</html>