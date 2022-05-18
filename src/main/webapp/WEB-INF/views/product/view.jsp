<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#rbdListDisp').load("replyList.po","bno=${product.p_num}");
		$('#rInsert').click(function() {
			var sendData = $('#frm1').serialize();
			$.post("rInsert.po", sendData, function(data) {
				alert("댓글이 입력 되었습니다");
				$('#rbdListDisp').html(data);
				frm1.replytext.value = ""; // 댓글 지우기
			});
		});
	});	
</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 상세 내용</h2>
<table class="table table-boardred table-striped">
	<tr><td>제목</td><td>${product.p_name }</td>
		<td>조회수</td><td>${product.readcount }</td>
		<td>가격</td><td>${product.price }</td>
		<td>작성자</td><td>${product.p_writer }</td>
		<td>작성일</td><td>${product.p_date }</td></tr>
	<tr><td>사진</td><td><img alt="${product.thumnails }" src="${path}/resources/upload/${product.thumnails}" width="100"></td>
		<td><img alt="${product.thumnails2 }" src="${path}/resources/upload/${product.thumnails2}" width="100"></td>
		<td><img alt="${product.thumnails3 }" src="${path}/resources/upload/${product.thumnails3}" width="100"></td>
		<td><img alt="${product.thumnails4 }" src="${path}/resources/upload/${product.thumnails4}" width="100"></td>
		<td><img alt="${product.thumnails5 }" src="${path}/resources/upload/${product.thumnails5}" width="100"></td></tr>
	<tr><td>내용</td><td colspan="10"><pre>${product.p_content }</pre></td></tr>
	
</table>
<div id="rbdListDisp"></div>
<h2 class="text-primary">댓글 작성</h2>
<form action="" name="frm1" id="frm1" method="post">
	<input type="hidden" name="bno" value="${product.p_num }">
<table class="table table-hover">
	<tr><th>작성자</th><td><input type="text" name="replier" value="${product.p_writer }">
		<td>댓글</td><td><textarea rows="2" cols="60" name="replytext"></textarea></td>
		<td><input type="button" value="댓글 입력" id="rInsert"></td>
	</table>
</form>
<tr><td colspan="10" align="center">
	<a href="list.po?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
	<a href="updateForm.po?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-warning">수정</a>
	<!-- 회원게시팡인 경우 폼없이 삭제 여부를 묻고 삭제, 비회원인 경우에는 암호를 획인하기 위한 화면 -->
	<a href="delete.po?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-danger">삭제</a>
	<a href="insertForm.po?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-success">답글</a>
</td></tr>
</div>
</body>
</html>