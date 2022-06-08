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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="script/slide.js"></script>
<style type="text/css">
select option[value=""][disabled] {
	display: none;
}
</style>
<script type="text/javascript">
	function submit1(kind) {
		if (!frm1.keyword3.value)
			frm1.keyword3.value = kind;
		if (frm1.keyword3.value)
			frm1.keyword3.value = kind;
		frm1.p_tag.value = kind;
		frm1.submit();
	}
	function sub1() {
		var kind = frm2.search2[frm2.search2.selectedIndex].value;
		if (!frm2.keyword2.value)
			frm2.keyword2.value = kind;
		if (frm2.keyword2.value)
			frm2.keyword2.value = kind;
		frm2.submit();
	}
</script>
</head>
<body>
<body>
	<div class="intro_bg" id="intro2">
		<img alt="" id="Im2g" src="${path }/resources/images/logo.png"
			onclick="location.href='main.do?p_num=${product.p_num}&pageNum=${pageNum }'"
			style="width: 190px; position: relative; top: 40px;">
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
							<li><a href="myProfile.do">◾마이페이지</a></li>
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
				<form action="p_list.do?pageNum=1">
					<div class="searchs">
						<select name="search" style=" height: 48px;">
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
							class="searchinput" type="submit" value="검색">
					</div>
				</form>
			</div>
			<button class="chats" >
				<img src="${path }/resources/images/main2.png" width="15"
					height="16" alt="번개톡버튼 이미지">다있톡
			</button>
			<a class="shop" href="myProfile.do">
			<img	src="${path }/resources/images/main1.png" width="15" height="16"
				alt="내상점버튼 이미지">내상점</a> 
			<a class="products"><img src="${path }/resources/images/main3.png" width="15" height="16"
				alt="판매하기버튼 이미지" onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
			<c:if test="${id != 'admin' }">
				<a class="shop" href='adminMain2.do'>고객센터</a>
			</c:if>
			<c:if test="${id == 'admin' }">
				<a class="shop" href="adminMain.do">관리자</a>
			</c:if>
			<c:if test="${member.id == null }">
				<a class="log" href='logout.do'>로그인</a>
			</c:if>
			<c:if test="${member.id != null }">
				<a class="log" href='logout.do'>로그아웃</a>
			</c:if>
		</div>
	</div>
	<div class="container" align="center">
		<div class="tagbox">
			<form action="p_list.do?pageNum=1" name="frm1">
				<div class="search3">
					<button class="btn-tag" onclick="submit1('의류')" name="search3" value="의류">의류</button>
					<button class="btn-tag" onclick="submit1('전자기기')" name="search3" value="전자기기">전자기기</button>
					<button class="btn-tag" onclick="submit1('생활가전')" name="search3" value="생활가전">생활가전</button>
					<button class="btn-tag" onclick="submit1('차량/오토바이')" name="search3" value="차량/오토바이">차량/오토바이</button>
					<button class="btn-tag" onclick="submit1('음반/악기')" name="search3" value="음반/악기">음반/악기</button>
					<button class="btn-tag" onclick="submit1('도서/티켓/문구')" name="search3" value="도서/티켓/문구">도서/티켓/문구</button>
					<button class="btn-tag" onclick="submit1('패션/악세사리')" name="search3" value="패션/악세사리">패션/악세사리</button>
				</div>
				<input type="hidden" name="keyword3" value="${product.search3 }">
			</form>
			<form action="p_list.do?pageNum=1" name="frm2">
				<select class="search2" name="search2" onchange="sub1()">
					<option value="" disabled selected>선택하세요</option>
					<option value="판매">판매</option>
					<option value="구매">구매</option>
					<option value="전체보기">전체보기</option>
				</select><input type="hidden" name="keyword2" value="${product.search2 }">
			</form>
		</div>
		<div class="list">
			<c:if test="${not empty list }">
				<c:forEach var="product" items="${list }">
					<c:set var="p_num" value="${p_num - 1}"></c:set>
					<c:if test="${product.p_del == 'y'}">
						<div class="listpage" style="display: none"></div>
					</c:if>
					<c:if test="${product.sel =='y' }">
                  <div class="listbox"
                     onclick="location.href='p_view.do?p_num=${product.p_num}&pageNum=${pb.currentPage}'"
                     style="cursor: pointer;">
                     <figure class="snip1200">
                        <img alt="${product.thumnails }"
                           src="${path}/resources/upload/del.jpg"
                           style="width: 100%; height: 100%;">
                        <figcaption>
                           <p>${product.p_writer }<br> ${product.price }원<br>
                              ${product.p_local }
                           </p>
                           <div class="heading">
                              <h2>
                                 <span>${product.p_name }</span>
                              </h2>
                           </div>
                        </figcaption> 
                     </figure>
                  </div>
                  </c:if>
					<c:if test="${product.sel != 'y'}">
						<div class="listbox"
							onclick="location.href='p_view.do?p_num=${product.p_num}&pageNum=${pb.currentPage}'"
							style="cursor: pointer;">
							<figure class="snip1200">
								<img alt="${product.thumnails }"
									src="${path}/resources/upload/${product.thumnails}"
									style="width: 100%; height: 100%;">
								<figcaption>
									<p>${product.p_writer }<br> ${product.price }원<br>
										${product.p_local }
									</p>
									<div class="heading">
										<h2>
											<span>${product.p_name }</span>
										</h2>
									</div>
								</figcaption>
								<a href="#"></a>
							</figure>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div align="center">
		<ul class="pagination">
			<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li><a
					href="p_list.do?pageNum=1&search=${product.search }&keyword=${product.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
				</a></li>
				<li><a href="p_list.do?pageNum=${pb.startPage - 1 }"> <span
						class="glyphicon glyphicon-triangle-left"></span></a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a
						href="p_list.do?pageNum=${i }&search=${product.search }&keyword=${product.keyword}">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a
						href="p_list.do?pageNum=${i }&search=${product.search }&keyword=${product.keyword}">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
			<c:if test="${pb.endPage < pb.totalPage }">
				<li><a
					href="p_list.do?pageNum=${pb.endPage + 1 }&search=${product.search }&keyword=${product.keyword}">
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
				<li><a
					href="p_list.do?pageNum=${pb.totalPage}&search=${product.search }&keyword=${product.keyword}">
						<span class="glyphicon glyphicon-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>