<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("resources/css/main.css");
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="script/slide.js"></script>
<style type="text/css">
select option[value=""][disabled] {
	display: none;
}
</style>
<script type="text/javascript">
$(function() {
	
});
</script>
</head>
<body>
<body>
	<div class="wrap">
		<div class="topheader">
			<a><img alt="" src="${path }/resources/images/logo.png" style="width: 190px; margin-left: 650px;"></a>
			<div class="nav" style="margin-right: 350px;">
				<b>${member.name }님 </b>&nbsp;
				<c:if test="${id != 'master' }">
					<a href="myProfileForm.do">마이페이지</a>
				</c:if>
				<c:if test="${id == 'master' }">
					<a href='adminMain2.do'>관리자페이지</a>
					<a href="adminMain.do">회원관리</a>
				</c:if>
				<a href='logout.do'>로그아웃</a>
			</div>
		</div>
		<div class="intro_bg">
			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon" style="display: none;">  <label for="icon">
						<span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="/Project2/main/main.do">◾메인</a></li>
							<br>
							<c:if test="${id != 'master' }">
								<li><a href="myProfileForm.do">◾마이페이지</a></li>
								<br>
							</c:if>
							<c:if test="${id == 'master' }">
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
					<img
					src="${path }/resources/images/main2.png"
						width="23" height="24" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="/shop//products"><img
				src="${path }/resources/images/main1.png"
					width="23" height="24" alt="내상점버튼 이미지">내상점</a> <a
					class="products"><img
					src="${path }/resources/images/main3.png"
					width="23" height="26" alt="판매하기버튼 이미지" onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록하기</a>
			</div>
		</div>
		<div class="container" align="center">
			<div class="tagbox">
				<form action="p_list.do?pageNum=1">
					<select class="search2" name="search2"
						onchange="this.form.submit()">
						<option value="" disabled selected>선택하세요</option>
						<option value="판매">판매</option>
						<option value="구매">구매</option>
						<option value="전체보기">전체보기</option>
					</select> <input type="hidden" name="keyword2" value="${product.search2 }">
				</form>
			</div>
			<div class="list">
				<c:if test="${not empty list }">
					<c:forEach var="product" items="${list }">
						<c:set var="p_num" value="${p_num - 1}"></c:set>
						<c:if test="${product.p_del == 'y'}">
							<div class="listpage" style="display: none"></div>
						</c:if>
						<%-- <c:if test="${product.sel =='y' }">
						
						</c:if> --%>
						<c:if test="${product.p_del != 'y'}">
							<div class="listbox"
								onclick="location.href='p_view.do?p_num=${product.p_num}&pageNum=${pb.currentPage}'" style="cursor: pointer;">
								<div class="listpoto">
									<img alt="${product.thumnails }"
										src="${path}/resources/upload/${product.thumnails}"
										style="width: 100%; height: 100%;">
								</div>
								<div class="listlist">
									<div>${product.p_name }</div>
									<div>${product.price }원</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<div align="center">
		<ul class="pagination">
			<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li><a
					href="list.do?pageNum=1?search=${product.search }$keyword=${product.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
				</a></li>
				<li><a href="p_list.do?pageNum=${pb.startPage - 1 }"> <span
						class="glyphicon glyphicon-triangle-left"></span></a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a
						href="p_list.do?pageNum=${i }?search=${product.search }$keyword=${product.keyword}">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a
						href="p_list.do?pageNum=${i }?search=${product.search }$keyword=${product.keyword}">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
			<c:if test="${pb.endPage < pb.totalPage }">
				<li><a
					href="p_list.do?pageNum=${pb.endPage + 1 }?search=${product.search }$keyword=${product.keyword}">
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
				<li><a
					href="p_list.do?pageNum=${pb.totalPage}?search=${product.search }$keyword=${product.keyword}">
						<span class="glyphicon glyphicon-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>