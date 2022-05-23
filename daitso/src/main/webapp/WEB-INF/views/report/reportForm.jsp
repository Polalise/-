<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("${path}/resources/css/report.css");
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="first">
	<form method="post" action="reportAction.do">
        <div class="report_header">신고하기</div>
        <input type="hidden" name="p_num" value="${report.p_num }">
		<input type="hidden" name="reporter_id" value="${report.reporter_id }">
		<input type="text" name="criminal_id" value="${report.criminal_id }">
        <div class="sec">
            <label><input type="checkbox" name="reasonChk" value="욕설">욕설</label>
			<label><input type="checkbox" name="reasonChk" value="음란물">음란물</label>
			<label><input type="checkbox" name="reasonChk" value="광고">광고</label>
			<label><input type="checkbox" name="reasonChk" value="허위매물">허위매물</label>
			<label><input type="checkbox" name="reasonChk" value="기타">기타</label>
        </div>
        <textarea name="reasonText" rows="5" cols="40" placeholder="신고사유 직접입력"
         class="textBox"></textarea>
            <input type="submit" class="submit_btn" value="신고하기">
          </form>
    </div>
</body>
</html>

