<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
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
	function test() {
		alert("test");
	}
</script>
</head>
<body>
	<form action="p_list.do?pageNum=1">
		<select name="search">
			<!-- select바 한글화 -->
			<c:forTokens var="sh" items="p_writer,p_name,p_content,subcon"
				delims="," varStatus="i">
				<c:if test="${sh == product.search }">
					<option value="${sh }" selected="selected">${title[i.index] }</option>
				</c:if>
				<c:if test="${sh != product.search }">
					<option value="${sh }">${title[i.index] }</option>
				</c:if>
			</c:forTokens>
		</select> <input type="text" name="keyword" value="${product.keyword }">
		<input type="submit" value="검색">
	</form>
	<form action="p_list.do?pageNum=1">
		<select name="search2" onchange="this.form.submit()">
			<option value="" disabled selected>선택하세요</option>
			<option value="판매">판매</option>
			<option value="구매">구매</option>
			<option value="전체보기">전체보기</option>
		</select> <input type="hidden" name="keyword2" value="${product.search2 }">
	</form>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 목록</h2>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>가격</th>
				<th>지역</th>
				<th>판매/구매</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6">게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="product" items="${list }">
					<tr>
						<td>${p_num }<c:set var="p_num" value="${p_num - 1}"></c:set>
							<%-- ${board.num } --%></td>
						<c:if test="${product.p_del == 'y'}">
							<td colspan="6">삭제된 글 입니다</td>
						</c:if>
						<c:if test="${product.sel =='y' }">
							<td colspan="6">거래 완료된 글입니다
						</c:if>
						<c:if test="${product.p_del != 'y'}">
							<td title="${product.p_name }"><a
								href="p_view.do?p_num=${product.p_num}&pageNum=${pb.currentPage}">
									${product.p_name }</a></td>
							<td>${product.p_writer }</td>
							<td>${product.readcount }</td>
							<td>${product.price }</td>
							<td>${product.p_local }</td>
							<td>${product.p_value }</td>
							<td>${product.p_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="p_list.do?pageNum=1?search=${product.search }$keyword=${product.keyword}">
							<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="p_list.do?pageNum=${pb.startPage - 1 }"> <span
							class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="active">
						<a href="p_list.do?pageNum=${i }?search=${product.search }$keyword=${product.keyword}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li>
						<a href="p_list.do?pageNum=${i }?search=${product.search }$keyword=${product.keyword}">${i }</a></li>
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
		<div align="center">
			<a href="p_insertForm.do?p_num=0&pageNum=1" class="btn btn-success">게시글 입력</a>
			<a href="myProfileForm.do" class="btn">마이페이지</a>
		</div>
	</div>
</body>
</html>