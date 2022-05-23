<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이벤트</title>
<link rel="stylesheet" href="resources/default.css">
<link rel="stylesheet" href="resources/style.css">
</head>
<body>

	<div>
		<h5 style="font-size: xx-large; margin-bottom: 20px;">이벤트 게시판</h5>
	</div>
	<form action=" eventList.do?pageNum=1"
		style="margin-left: 780px; margin-bottom: 20px;">
		<select name="search">
			<c:forTokens var="sh" items="id,e_subject,e_content,subcon"
				delims="," varStatus="i">
				<c:if test="${sh==board.search }">
					<option value="${sh }" selected="selected">${title[i.index]}</option>
				</c:if>
				<c:if test="${sh!=board.search }">
					<option value="${sh }">${title[i.index]}</option>
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

		<ul>
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
	<div align="center">
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

	<div align="center">
		<a href="eventWriteForm.do?e_num=0&pageNum=1" class="btn btn-success">게시글
			입력</a>
	</div>






</body>
</html>