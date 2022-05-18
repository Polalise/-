<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function preview(file) {
	var reader = new FileReader();
	reader.onload = (function(f) {
		return function(e) {
			var div = "<div class='thumb'><div class='close'>X</div><img src='"+
			e.target.result+"'/></div>'";
			$('#thumnails').append(div);
		}
	})(file);
	reader.readAsDataURL(file); // readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
}
</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 입력</h2>
<form action="insert.po" method="post" name="frm" enctype="multipart/form-data"> <!-- onsubmit="return chk()" -->
	<input type="hidden" name="p_num" value="${p_num }">
	<input type="hidden" name="pageNum" value="${pageNum }">
<table class="table table-bordered table-hover">
	<c:if test="${p_num == 0 }">
		<tr><td>제목</td><td><input type="text" name="p_name" required="required"
			autofocus="autofocus"></td></tr>
	</c:if>
		<c:if test="${p_num != 0 }">
		<tr><td>제목</td><td><input type="text" name="p_name" required="required"
			autofocus="autofocus" value="답변)"></td></tr>
	</c:if>		
<!-- 	회원게시판에서 사용안하고 id나 이름을 가지고 fk설정
		회원게시판은 login하지 않으면 조회하지만 입력/수정/삭제는 불가능 비회원 게시판은 암호를 확하여 맞으면 수정/삭제 가능	 -->
	<tr><td>작성자</td><td><input type="text" name="p_writer" required="required"></td></tr>
	<tr><td>가격</td><td><input type="number" name="price" required="required"></td></tr>
	<tr><td>지역</td><td><input type="text" name="p_local" required="required"></td></tr>
	<tr><td>판매/구매</td><td>
		<select id="selbox" class="selbox" name="p_value">				
					<option value="판매"> 판매합니다</option>
					<option value="구매">	 구매합니다</option>
		</select></td></tr>
	<tr><td>분류</td><td>
		<select id="selbox2" class="selbox2" name="p_tag">				
					<option value="의류">의류</option>
					<option value="전자기기">전자기기</option>
					<option value="생활가전">생활가전</option>
					<option value="차량/오토바이">차량/오토바이</option>
					<option value="음반/악기">음반/악기</option>
					<option value="도서/티켓/문구">도서/티켓/문구</option>
					<option value="패션/악세사리">패션/악세사리</option>
		</select></td></tr>	 
	<tr><td>사진<span class="glyphicon glyphicon-picture"></span></td>
		<td><input type="file" name="file" required="required">
			<input type="file" name="file2" >
			<input type="file" name="file3" >
			<input type="file" name="file4" >
			<input type="file" name="file5" ></td></tr>
			<%-- <img alt="" src="resources/upload/${product.thumnails }" width="200"></td></tr>  --%>
	<tr><td>내용</td><td><textarea rows="5" cols="40" name="p_content" 	required="required"></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="확인" 	class="btn btn-info"></td></tr>
</table>
</form>
</div> 
</body>
</html>