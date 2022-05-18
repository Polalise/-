<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="header.jsp" %> --%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<style type="text/css">
.review2{
  height : 300px;

  border: 2px solid red;
  margin-top: 300px;
  margin-left: 650px
}
       
 #review fieldset{
    margin-left: 50px;
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 2px solid black; /* 필드셋 테두리 제거 */
}
#review input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#review label{
    font-size: 2em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #dedede; /* 새 이모지 색상 부여 */
}
#review label:hover{
    text-shadow: 0 0 0 rgb(243, 239, 27); /* 마우스 호버 */
}
#review label:hover ~ label{
    text-shadow: 0 0 0 rgb(243, 239, 27); /* 마우스 호버 뒤에오는 이모지들 */
}
#review fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#review fieldset legend{
    text-align: left;
}
#review input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgb(243, 239, 27); /* 마우스 클릭 체크 */
}
</style>
<link rel="stylesheet" href="replyWriteForm.css">
<title>Insert title here</title>
<script type="text/javascript">
/*  	$(function() {
		$('#rbdListDisp').load('${path}/replyList/bno/${board.num}');
		$('#boardListDisp').load("${path}/list/pageNum/${pageNum}");
		$('#rInsert').click(function() {
			/* var sendData = "bno="+frm1.bno.value+"&replier="+frm1.replier.value+
				"&replytext="+frm1.replytext.value; 
			var sendData = $('#frm1').serialize();
			$.post("${path}/rInsert", sendData, function(data) {
				alert("댓글이 입력 되었습니다");
				$('#rbdListDisp').html(data);
				frm1.replytext.value = ""; // 댓글 지우기
			});
		});
	});
 */
</script></head><body>
<div class="review2" align="center" style="width: 35%"  >
<h2 class="text-primary">리뷰 작성</h2>
<!-- submit할 때 action에 값이 없으면 자신(view.do)을 한번 더 수행 -->
<form action="replyWrite.do" name="review" id="review" style="margin-top: 50px;">
	<input type="hidden" name="num" value="1">
	<input type="hidden" name="rno" value="${rno }">
 <table class="table table-hover"> 
	<!-- 회원게시판에서 작성자는 로그인 사람의 이름이나 별명(여기서는 게시글 쓴 사람으로 정의) -->
	<tr><th>작성자</th><td><input type="text" name="id" value="admin"></td></tr>
	 <tr><th>별점</th> <td> <fieldset>
            <legend></legend>
            <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
            <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
            <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
            <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
            <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
     </fieldset></td></tr>
		<tr><td>리뷰</td><td><textarea rows="5" cols="50" name="replytext"></textarea></td>
		<td><input type="submit" value=" 입력" id="rInsert"></td>
		</table>
</form>
<!-- <div id="rbdListDisp"></div>
<div id="boardListDisp"></div> -->
</div>
</body>
</html>