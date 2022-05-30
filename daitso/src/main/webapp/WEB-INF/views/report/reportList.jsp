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
    margin-top: 80px;
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
								class="input" type="submit" value="검색">
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
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
              <c:if test="${id != 'admin'}">
            <li class=''><a href="reportmyList.do">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class=''><a href="reportList.do">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>
            </c:if>               
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
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="report" items="${list }">

					<tr>
						 <td>${num}<c:set var="num" value="${num - 1}"></c:set><%-- ${board.num } --%></td> 
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
				</c:forEach>
			</c:if>
		</table>
		</div>
			<form action="reportList.do?pageNum=1">
<select name="search">
   <c:forTokens var="sh" items="id,reasonChk,reasonText,subcon" delims="," varStatus="i">
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
					<li><a href="reportList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
				</c:if>
				<!-- 블럭 뒤로오게하기 -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li><a href="reportList.do?pageNum=${pb.startPage-1 }"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<!-- 갯수만큼 1로시작해서 ~10깨까지 보여주기 -->
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
					<!-- page 누를때 안누를때 구분하려고 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="reportList.do?pageNum=${i }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="reportList.do?pageNum=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<!-- 블럭 움직이는것 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="reportList.do?pageNum=${pb.endPage+1 }"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
				</c:if>
				<!-- 제일끝으로가는거 -->
				<!-- 보여줄것이 남아 있으면 endPage보다 totalpage가 크다 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="reportList.do?pageNum=${pb.totalPage }"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
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