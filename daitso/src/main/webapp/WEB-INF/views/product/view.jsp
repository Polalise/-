<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<style type="text/css">
@import url("resources/css/main.css");
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
select option[value=""][disabled] {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#rbdListDisp').load("replyList.do", "bno=${product.p_num}");
		$('#rInsert').click(function() { 
			var sendData = $('#frm1').serialize();
			$.post("rInsert.do", sendData, function(data) {
				alert("댓글이 입력 되었습니다");
				$('#rbdListDisp').html(data);
				frm1.replytext.value = ""; // 댓글 지우기
			});
		});
		 var like = "${likes}"
			 $("#addL").on("click",function () {
		    	   if (like == ''){
		               $.post('addLikes.do', "id=${id}&p_num=${product.p_num}", function(data) {
		                  location.reload();
		                   $(".heart").attr("src","${path}/resources/images/likes.png"); 
		               });
		           } else if (like != '') {
		           $.post('deleteLikes.do', "id=${id}&p_num=${product.p_num}", function(data) {
		                 location.reload();
		                   $(".heart").attr("src","${path}/resources/images/unlikes.png");
		               });
		           };
		           location.reload();
		       });
		 $('#report').click(function() {
	           var pop = window.open("reportForm.do?p_num=${product.p_num}","content","width=620 height=700");
	       });
		
		
	});
      
</script>
</head>
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
			<button class="chats">
				<img src="${path }/resources/images/main2.png" width="15"
					height="16" alt="번개톡버튼 이미지">다있톡
			</button>
			<a class="shop" href="myProfileForm.do">
			<img	src="${path }/resources/images/main1.png" width="15" height="16"
				alt="내상점버튼 이미지">내상점</a> 
			<a class="products"><img src="${path }/resources/images/main3.png" width="15" height="16"
				alt="판매하기버튼 이미지" onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
			<c:if test="${id != 'admin' }">
				<a class="shop" href='adminMain2.do'>고객센터</a>
			</c:if>
			<c:if test="${id == 'admin' }">
				<a class="shop" href="adminMain.do">관리자페이지</a>
			</c:if>
			<c:if test="${member.id == null }">
				<a class="log" href='logout.do'>로그인</a>
			</c:if>
			<c:if test="${member.id != null }">
				<a class="log" href='logout.do'>로그아웃</a>
			</c:if>
		</div>
	</div>
		<div class="product">
			<div class="productlist">		
				<div class="slide">					
					<ul class="slide_list">
						<li><a href="#"> <img
								alt="${path}/resources/images/noimg.png"
								src="${path}/resources/upload/${product.thumnails}"></a></li>
						<li><c:if test="${not empty  product.thumnails2} ">
								<a href="#"><img alt="" 
									src="${path}/resources/upload/${product.thumnails2}"></a>
							</c:if> <c:if test="${empty product.thumnails2}">
								<a href="#"><img alt=""
									src="${path}/resources/images/noimg.png" style="width: 100%"></a>
							</c:if></li>
						<li><c:if test="${not empty  product.thumnails3} ">
								<a href="#"><img alt=""
									src="${path}/resources/upload/${product.thumnails3}"></a>
							</c:if> <c:if test="${empty product.thumnails3}">
								<a href="#"><img alt=""
									src="${path}/resources/images/noimg.png" style="width: 100%"></a>
							</c:if></li>
						<li><c:if test="${not empty  product.thumnails4} ">
								<a href="#"><img alt=""
									src="${path}/resources/upload/${product.thumnails4}"></a>
							</c:if> <c:if test="${empty product.thumnails4}">
								<a href="#"><img alt=""
									src="${path}/resources/images/noimg.png" style="width: 100%"></a>
							</c:if></li>
						<li><c:if test="${not empty  product.thumnails5} ">
								<a href="#"><img alt=""
									src="${path}/resources/upload/${product.thumnails5}"></a>
							</c:if> <c:if test="${empty product.thumnails5}">
								<a href="#"><img alt=""
									src="${path}/resources/images/noimg.png" style="width: 100%"></a>
							</c:if></li>
					</ul>
				</div>
			</div>
			<div class="product_list">
				<div class="viewupdate">
					<c:if test="${product.p_writer == member.nickName }">
						<button class="update"
							onclick="location.href='p_delete.do?p_num=${product.p_num }&pageNum${pageNum}'">
								삭제하기</button>
						<button class="update"
							onclick="location.href='p_updateForm.do?p_num=${product.p_num }&pageNum${pageNum}'">
								수정하기</button>
						</c:if>
					</div>
				<div class="productname">${product.p_name }</div>				
				<div class="productprice">${product.price }원</div>
				<div class="productview">
					<div class="productlike">
						<img
							src="${path }/resources/images/view.png" 
							width="30" height="30" alt="상품 상태 아이콘">
							${likesCount}
					</div>
					<div class="productcount">
						<img
							src="${path }/resources/images/view2.png"
							width="41" height="30" alt="상품 상태 아이콘">${product.readcount }
					</div>
					<div class="productreg">
						<img
							src="${path }/resources/images/view3.png"width="35" height="30" alt="상품 상태 아이콘">${product.p_date }
					</div>
					<button class="reput" id="report" style=" float:right; margin-right:20px;">
						<img src="${path }/resources/images/view4.png">신고하기</button>
				</div>
				<div class="pcontent">
					<textarea  readonly="readonly" 	onclick="this.select()" onfocus="this.select()"
					 	style="width: 552px; height: 255px; margin-top: 10px;">${product.p_content }
					</textarea></div>
				<div class="productbutton"> 
					<button class="btnlike"  id="addL">
						<c:if test="${likes == '' }">
							<img src="${path }/resources/images/unlikes.png" width="18"
								height="15">
							<span style="margin-left: 5px;">찜</span>
							<span>${likesCount}</span>
						</c:if>
						<c:if test="${likes != '' }">
							<img src="${path }/resources/images/likes.png" width="18"
								height="15">
							<span style="margin-left: 5px;">찜</span>
							<span>${likesCount}</span>
						</c:if>
					</button>
					<button class="coll">연락하기</button>
					<button class="nowsell">바로구매</button>
					<button onclick="location.href='buyer.do'">구매하기</button>
					<button onclick="location.href='sendProduct.do?p_num=${product.p_num}'">배송완료</button>
					<button onclick="location.href='confirmTrade.do?p_num=${product.p_num}'">구매확정</button>
					<button onclick="location.href='replyWriteForm2.do?p_num=${product.p_num}&pageNum=${pageNum}'">리뷰작성</button>
				</div>
			</div>
		</div>
		<div class="reply">
			<div id="rbdListDisp"></div>
			<h2 class="text-primary">댓글 작성</h2>
			<form action="" name="frm1" id="frm1" method="post">
				<input type="hidden" name="bno" value="${product.p_num }">
				<table class="table table-hover">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="replier"
							value="${product.p_writer }">
						<td>댓글</td>
						<td><textarea rows="3" cols="30" name="replytext"></textarea></td>
						<td><input type="button" value="댓글 입력" id="rInsert">
				</table>
			</form>
			<tr>
				<td colspan="10" align="center"><a
					href="p_list.do?pageNum=${pageNum }" class="btn btn-info">게시글
						목록</a> <a
					href="p_updateForm.do?p_num=${product.p_num }&pageNum${pageNum}"
					class="btn btn-warning">수정</a> <!-- 회원게시팡인 경우 폼없이 삭제 여부를 묻고 삭제, 비회원인 경우에는 암호를 획인하기 위한 화면 -->
					<a href="p_delete.do?p_num=${product.p_num }&pageNum${pageNum}"
					class="btn btn-danger">삭제</a> <a
					href="p_insertForm.do?p_num=${product.p_num }&pageNum${pageNum}"
					class="btn btn-success">답글</a></td>
			</tr>
		</div>
	</div>
</body>
</html>