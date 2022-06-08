<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path }/resources/css/report.css">
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body>
	<div class="first">
		<form method="post" action="reportAction.do">
			<div class="report_header" style="padding-top: 20px;">신고하기</div>
			<input type="hidden" name="p_num" value="${report.p_num }">
			<input type="hidden" name="reporter_id" value="${report.reporter_id }">
			<div class="product_info">
				<span class="thumbnail"><img src="${path}/resources/upload/${product.thumnails}"></span>
				<div class="criminal_info">
					<div>
						<a>신고자</a>
						<a><input type="text" name="criminal_id" value="${report.criminal_id }" readonly="readonly"></a>
					</div>
					<div>
						<a>신고내용</a> <a><input type="text" name="criminal_product" value="${product.p_name }" readonly="readonly"></a>
					</div>
					<div>
						<a>작성날짜</a> <a><input type="text" name="criminal_date" value="${product.p_date }" readonly="readonly"></a>
					</div>
				</div>
			</div>
			<div class="sec">
				<label><input type="checkbox" name="reasonChk" value="욕설">욕설</label>
				<label><input type="checkbox" name="reasonChk" value="음란물">음란물</label>
				<label><input type="checkbox" name="reasonChk" value="광고">광고</label>
				<label><input type="checkbox" name="reasonChk" value="허위매물">허위매물</label>
				<label><input type="checkbox" name="reasonChk" value="기타">기타</label>
			</div>
			<textarea name="reasonText" rows="5" cols="40"
				placeholder="신고사유 직접입력" class="textBox"></textarea>
			<input type="submit" class="submit_btn" value="신고하기">
		</form>
	</div>
</body>
</html>

