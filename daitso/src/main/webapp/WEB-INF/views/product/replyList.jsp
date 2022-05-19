<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rUpdate(bno, rno) {
			var txt = $('#td_'+rno).text();
			$('#td_'+rno).html('<textarea row="3" colos="40" id="rt">'+txt+'</textarea>');
			$('#btn_'+rno).html("<input type='button' onclick='up("+bno+","+rno+
				")' class='btn btn-danger btn-sm' value='확인'> "+
				"<input type='button' onclick='lst("+bno+")' class='btn btn-info btn-sm' value='취소'>");
		}
		function lst(bno) {
			$('#rbdListDisp').load('replyList.po?bno='+bno);		
		}
		function up(bno, rno) {
			var sendData = "replytext=" +$("#rt").val()+"&bno="+bno+"&rno="+rno;
			$.post('rUpdate.do',sendData, function(data) {
				alert("수정 되었습니다"); 
				$("#rbdListDisp").html(data);
			});	
	}
	function rDelete(bno, rno) {
		var sendData = "bno="+bno+"&rno="+rno;
		$.post("rDelete.po",sendData, function(data) {
			alert("삭제 되었습니다");
			$("#rbdListDisp").html(data);			
		});		
	}
</script>
</head><body>
<c:if test="${not empty rbdList }">
	<h3 class="text-primary">댓글</h3>
<table class="table table-striped">
	<tr><th width="15%">작성자</th>
	<th>내용</th>	<th width="15%">수정일</th><th width="20%"></th></tr>
<c:forEach var="rbd" items="${rbdList }">
	<c:if test="${rbd.del == 'y' }">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${rbd.del!='y' }">
		<tr><td>${rbd.replier }</td>
			<td id="td_${rbd.rno }">${rbd.replytext }</td>
			<td>${rbd.updatedate}</td>
			<c:if test="${rbd.replier == product.p_writer }">
				<td id="btn_${rbd.rno }">
					<input type="button" class="btn btn-success btn-sm" value="채팅"
						onclick="">
					<input type="button" class="btn btn-warning btn-sm" value="수정"
						onclick="rUpdate(${rbd.bno},${rbd.rno })">
					<input type="button" class="btn btn-danger btn-sm" value="삭제"
						onclick="rDelete(${rbd.bno},${rbd.rno })"></td>
			</c:if>
	</c:if>
</c:forEach>
</table>
</c:if>
</body>
</html>