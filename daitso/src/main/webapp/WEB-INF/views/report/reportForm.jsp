<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("${path}/resources/css/report.css");
</style>
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body>
	<div class="first">
		<form method="post" action="reportAction.do">
			<div class="report_header">신고하기</div>
			<input type="hidden" name="p_num" value="${report.p_num }"> <input
				type="hidden" name="reporter_id" value="${report.reporter_id }">

			<div class="criminal_Product">
				<div class="criminal_info">
					<div>
						<a>작성자</a> <input type="text" name="criminal_id"
							value="${report.criminal_id }">
					</div>
					<div>
						<a>상품명</a> <input type="text" value="${product.p_name }">
					</div>
					<div>
						<a>가격</a><input type="text" value="${product.price }">
					</div>
				</div>
				<span class="thumbnail"><img
					src="${path}/resources/upload/${product.thumnails}"></span>
			</div>
			<div class="sec">
				<label><input type="checkbox" name="reasonChk" value="욕설">욕설</label>
				<label><input type="checkbox" name="reasonChk" value="음란물">음란물</label>
				<label><input type="checkbox" name="reasonChk" value="광고">광고</label>
				<label><input type="checkbox" name="reasonChk" value="허위매물">허위매물</label>
				<label><input type="checkbox" name="reasonChk" value="기타">기타</label>
			</div>
			<div class="textBoxArea">
				<textarea name="reasonText" rows="5" cols="40"
					placeholder="신고사유 직접입력" class="textBox"></textarea>
			</div>
			<div class="submit_btn">
				<input type="submit" value="신고하기">
			</div>
		</form>
	</div>
</body>
</html>

