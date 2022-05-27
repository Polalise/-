<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bigReview{
  width:50%;
  margin-top: 200px;,
}
</style>
<script type="text/javascript">
    // 댓글 삭제
	function rDelete(p_num, rno) {
		var sendData = "p_num="+p_num+"&rno="+rno;
		$.post("rDelete2.do", sendData, function(data) {
			alert("삭제 되었습니다");
			$("#rbdListDisp").html(data);
		});
	}
	//댓글 수정누르면 확인 취소 나오게
	function rUpdate(p_num, rno) {
	/*  input에 있는 데이터를 읽어서 textarea에 넣어서 변경할 수 있게 만들어야 한다
		input, textarea, select에 데이터를 읽을 때는 jquery에서 val()
		td, div, span등에서 데이터를 읽을 때는 jquery에서 text() */
		var txt = $('#td_'+rno).text();
		/* 읽은 데이터를 textarea에 넣어서 수정할 수 있게 만든다 */
		$('#td_'+rno).html('<textarea row="3" colos="40" id="rt">'+txt+'</textarea>');
		/* 버튼 처리를  확인과 취소로 변경 */
		$('#btn_'+rno).html("<input type='button'onclick='up("+p_num+","+rno+
				")' class='btn btn-danger btn-sm' value='확인'> "+
				"<input type='button' onclick='lst("+p_num+")' class='btn btn-info btn-sm' value='취소'>");
	}
	//댓글 수정중 취소 누르면 다시 목록보이게
	function lst(p_num) {
		$('#rbdListDisp').load('replyList2.do?p_num='+p_num);
	}
	function up(p_num, rno) {
		var sendData = "replytext="+$('#rt').val()+"&p_num="+p_num+"&rno="+rno;
		$.post('rUpdate2.do' , sendData, function(data){
			alert("수정 되었습니다.")
			$('#rbdListDisp').html(data); 
		})
	}
</script>
<style type="text/css">
 #review {
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
    font-size: 1em; /* 이모지 크기 */
    color: 0 0 0 rgb(243, 239, 27); /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
      display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}




</style>
</head><body>
<div  id="bigReview" style="margin-left: 500px;">
<c:if test="${not empty rbdList }">
	<h3 class="text-primary">리뷰</h3>
<table class="table table-striped">
	<tr><th width="15%">작성자</th><th>평점</th><th>내용</th><th width="20%">작성일</th><th width="15%"></th></tr>
<c:forEach var="rbd" items="${rbdList }">
	<c:if test="${rbd.del=='y' }">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${rbd.del!='y' }">
		<tr><td>${rbd.id}</td><!-- 댓글 작성자 -->
		<td><div id="review"><c:if test="${rbd.rating  == 1 }">⭐</c:if>
		    <c:if test="${rbd.rating == 2 }">⭐⭐</c:if>
		    <c:if test="${rbd.rating  == 3 }">⭐⭐⭐</c:if>
		    <c:if test="${rbd.rating  == 4 }">⭐⭐⭐⭐</c:if>
		    <c:if test="${rbd.rating  == 5 }">⭐⭐⭐⭐⭐</c:if>
		    </div>
		</td>
			<td id="td_${rbd.rno }">${rbd.replytext }</td><!-- 댓글 -->
			<td>${rbd.regdate}</td><!-- 댓글 수정일 -->
			<!-- 댓글 작성자와 로그인 한사람의 이름을 비교 같으면 수정/삭제 권한 제공
				  회원게시판이 아니라서 임으로 게시글 작성자와 비교 -->
			<%-- <c:if test="${rbd.id==member.id }"> --%> 	  
			<c:if test="${rbd.id==id }"> 
			<%-- <c:if test="${rbd.id}"> --%>
				<td id="btn_${rbd.rno }">
				<input type="button" class="btn btn-warning btn-sm" value="수정"
						onclick="rUpdate(${p_num},${rbd.rno })">
					<input type="button" class="btn btn-danger btn-sm" value="삭제"
						onclick="rDelete(${p_num},${rbd.rno })"></td>
			</c:if>
	</c:if>
</c:forEach>
</table>
</c:if>
</div>
<!-- <div id="rbdListDisp"></div> 나중에 덮어씌우자 -->
</body>
</html>