<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 삭제</h2>
		<form action="noticeDelete.do" method="post" name="frm">
			<input type="hidden" name="num" value="${board.num }"> <input
				type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-bordered table-hover">
				<tr>
					<td>암호</td>
					<td><input type="password" name="password"
						autofocus="autofocus" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"
						class="btn btn-info"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>