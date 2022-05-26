<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("resources/css/main.css");
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
    margin-top: 100px;
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
<div class="intro_bg">
			<a><img alt="" id="Im2g" src="${path }/resources/images/logo.png"
				style="width: 190px; margin-left: 0px; position: relative; top: 90px; left: 200;"></a>

			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon" style="display: none;"> <label
						for="icon"> <span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="/Project2/main/main.do">◾메인</a></li>
							<br>
							<c:if test="${id != 'admin' }">
								<li><a href="myProfileForm.do">◾마이페이지</a></li>
								<br>
							</c:if>
							<c:if test="${id == 'admin' }">
								<li><a href="/Project2/manager/masterUpdate.do">◾회원관리</a></li>
								<br>
							</c:if>
							<li><a href="/Project2/notice/Notice.no">◾공지사항</a></li>
							<br>
							<li><a href="/Project2/board/View_BoardForm.wo">◾취미</a></li>
							<br>
							<li><a href="/Project2/sell_board/sell_notice.so">◾거래게시판</a></li>
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
								class="input" type="submit" value="검색">
						</div>
					</form>
				</div>
				<button class="chats">
					<img src="${path }/resources/images/main2.png" width="23"
						height="24" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="myProfileForm.do"><img
					src="${path }/resources/images/main1.png" width="23" height="24"
					alt="내상점버튼 이미지">내상점</a> <a class="products"><img
					src="${path }/resources/images/main3.png" width="23" height="26"
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
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
            <li class=''><a href="">신고문의<i></i></a></li>
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>               
        </ul>
    </div>
    </div>
	<div class="container" id="sub" align="center" style="border: 2px solid blue;">
		<h2 class="text-primary">공지사항</h2>
		    
	   
		<div class="table-responsive">  
		<table class="table">
			<tr>
			    <th style="width:10%;">번호</th>
				<th>제목</th>
				<!-- <th>작성자</th> -->
				<th style="width:10%;">조회수</th>
				<th style="width:10%;">작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }">

					<tr>
						 <td>${num }<c:set var="num" value="${num - 1}"></c:set><%-- ${board.num } --%></td> 
						<c:if test="${notice.del == 'y' }">
							<td colspan="4">삭제된 글입니다.</td>
						</c:if>
						<c:if test="${notice.del != 'y' }">
							<td title="${notice.content}" class="sub2"><a
								href="noticeView.do?num=${notice.num }&pageNum=${pb.currentPage}"
								<%-- href="noticeView.do?num=${notice.num }&pageNum=${pb.currentPage}&id=${notice.id}" --%>
								class="sub2">${notice.subject }</a> <!-- 조회수 늘리면 hot.gif 보여줘 -->
								<c:if test="${notice.readcount > 50 }">
									<img alt="" src="resources/images/hot.gif">
								</c:if></td>
							<%-- <td>${notice.id}</td> --%>
							<td>${notice.readcount }</td>
							<td>${notice.reg_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
<form action="noticeList.do?pageNum=1">
<select name="search">
   <c:forTokens var="sh" items="id,subject,content,subcon" delims="," varStatus="i">
      <c:if test="${sh==board.search }">
       <option value="${sh }" selected="selected">${title[i.index]}</option>
      </c:if>
      <c:if test="${sh!=board.search }">
       <option value="${sh }">${title[i.index]}</option>
      </c:if>
   </c:forTokens>
</select>
 <input type="text" name="keyword" value="${board.keyword }">
 <input type="submit" value="확인">
</form>	
		<div align="center">
			<ul class="pagination">
				<!-- 제일처음으로 가기 -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li><a href="noticeList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
				</c:if>
				<!-- 블럭 뒤로오게하기 -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li><a href="noticeList.do?pageNum=${pb.startPage-1 }"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<!-- 갯수만큼 1로시작해서 ~10깨까지 보여주기 -->
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
					<!-- page 누를때 안누를때 구분하려고 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="noticeList.do?pageNum=${i }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="noticeList.do?pageNum=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<!-- 블럭 움직이는것 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="noticeList.do?pageNum=${pb.endPage+1 }"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
				</c:if>
				<!-- 제일끝으로가는거 -->
				<!-- 보여줄것이 남아 있으면 endPage보다 totalpage가 크다 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="noticeList.do?pageNum=${pb.totalPage }"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	
       <c:if test="${id == 'admin'}">
		<div align="center">
			<a href="noticeWriteForm.do?num=0&pageNum=1" class="btn btn-success">게시글
				입력</a>
		</div>
	   </c:if>
	</div>
	</div>
</body>
</html>