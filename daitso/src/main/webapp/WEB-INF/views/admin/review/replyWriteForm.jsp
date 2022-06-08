<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/replyWriteForm.css">
<title>리뷰작성</title>
<script type="text/javascript">
	function closeConfrim() {
		if (window.confirm("정말 리뷰작성을 취소하시겠습니까?")) {
			history.back();
		} else {};
	};
</script>
</head>
<body>
	<div class="review2">
		<a class="review_header">리뷰 작성</a>
		<!-- submit할 때 action에 값이 없으면 자신(view.do)을 한번 더 수행 -->
		<form action="replyWrite2.do" name="review" id="review">
			<input type="hidden" name="p_num" value="${p_num }">
			<input type="hidden" name="rno" value="${rno }">
			<input type="hidden" name="id" value="${id }">
			<div class="review_info">
				<h3>${product.p_writer} 님과하신 거래는 어떠셨나요?</h3>
				<h4>평점을 남겨주세요.</h4>
			</div>
			<!-- 회원게시판에서 작성자는 로그인 사람의 이름이나 별명(여기서는 게시글 쓴 사람으로 정의) -->
			<!-- <tr><th>작성자</th><td><input type="text" name="id" value="admin"></td></tr> -->
			<div class="bgColor3">
				<span class="rating_div_header">거래 만족도</span>
				<div class="rating_div">
					<fieldset>
						<legend style="display: none;"></legend>
						<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
						<input type="radio" name="rating" value="4"id="rate2"><label for="rate2">⭐</label>
						<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
						<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
						<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
					</fieldset>
				</div>
			</div>
			<span class="review_textBox_header">상세 설명</span>
			<div class="review_text">
				<textarea rows="5" cols="50" name="replytext" class="review_textBox"
					placeholder="거래가 어떠셨는지 상세하게 남겨주세요!"></textarea>
			</div>
			<div class="footer_btn">
				<input type="submit" value="확인" id="rInsert"
					class="review_submit_button_yes"> <input type="button"
					value="취소" onclick="closeConfrim()" class="review_submit_button_no">
			</div>
		</form>
	</div>
</body>
</html>