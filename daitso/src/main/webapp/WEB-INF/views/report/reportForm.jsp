<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.first{
    border: solid 1px red;
    height: 610px;
    width: 600px;
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
}
.report_header{
    border: solid 1px violet;
    width: 100%;
    height: 40px;
    text-align: center;
    font-size: large;
}
.sec{
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
    height: 50px;
    width: 500px;
    border: solid 1px green;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: space-around;
    align-content: space-around;
}
.product_info{
    width: 570px;
    height: 300px;
    border: solid 1px blue;
    margin-top: 15px;
    margin-left: 13px;
    margin-right: 13px;
    display: flex;
    justify-content: space-between;
}

.textBox{
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 560px;
    height: 6.25em;
    border: solid 1px black;
    resize: none;
}
.submit_btn{
    height: 30px;
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}
.thumbnail{
    margin-top: auto;
    margin-bottom: auto;
    margin-left: 20px;
}

.thumbnail img{  
    height: 250px;
    width: 250px;
}

.pro_info{
    /* border: solid 1px red; */
    margin-right: 20px;
    margin-top: auto;
    margin-bottom: auto;
    height: 250px;
    width: 250px;
    text-align: left;
}
.pro_info ul{
    padding-left: 0px;
    margin-left: 0px;
}
.pro_info ul li{
    list-style: none;
    margin-bottom: 16px;
    border: solid 1px black;
}
.pro_info a{
    display: inline-block;
    margin-bottom: 16px;
    margin-left: 15px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="first">
	<form method="post" action="reportAction.do">
        <div class="report_header">신고하기</div>
        <input type="text" name="p_num" value="${report.p_num }">
		<input type="text" name="reporter_id" value="${report.reporter_id }">
		<input type="text" name="criminal_id" value="${report.criminal_id }">
        <div class="product_info">
            <!-- <span class="thumbnail"><img src="images/kim.jpg"></span> -->
        </div>
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

