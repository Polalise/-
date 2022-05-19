<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function preview(file) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close'>X</div><img src='"+
			e.target.result+"'/></div>'";
				$('#thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file); // readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 수정</h2>
		<form action="p_update.do" method="post" name="frm"
			enctype="multipart/form-data">
			<input type="hidden" name="p_num" value="${product.p_num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-bordered table-hover">
				<tr>
					<td>제목</td>
					<td><input type="text" name="p_name" required="required" autofocus="autofocus" value="${product.p_name }"></td>
				</tr>
				<!-- 	회원게시판에서 사용안하고 id나 이름을 가지고 fk설정
	회원게시판은 login하지 않으면 조회하지만 입력/수정/삭제는 불가능 비회원 게시판은 암호를 확하여 맞으면 수정/삭제 가능	 -->
				<tr>
					<td>작성자</td>
					<td><input type="text" name="p_writer" required="required" value="${product.p_writer }"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" required="required"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input type="text" name="p_local" required="required" value="${product.p_local }"></td>
				</tr>
				<tr>
					<td>판매/구매</td>
					<td><select id="selbox" class="selbox" name="p_value">
							<option value="판매">판매합니다</option>
							<option value="구매">구매합니다</option>
					</select></td>
				</tr>
				<tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td><input type="file" name="file" required="required">
						<input type="file" name="file2"> 
						<input type="file" name="file3"> 
						<input type="file" name="file4"> 
						<input type="file" name="file5"></td>
				</tr>
				<!-- 	비회원 게시내용 종료 -->
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="40" name="p_content" required="required">${product.p_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-info"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>