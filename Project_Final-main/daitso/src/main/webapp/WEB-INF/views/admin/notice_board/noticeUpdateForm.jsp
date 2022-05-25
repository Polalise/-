<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sideMenu{
    margin-left: 300px;
}
#total{
    display: flex;
    margin-top: 200px;
}
#sub{
  margin-right: 300px;
  border: 2px solid blue;
}
.snb{
  font-size: 26px
}
/* drop & drag */
.drag-over {
	background: yellow;
}

.thumb {
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb>img {
	width: 50%;
}

.thumb>.close {
	position: absolute;
	background: red;
	cursor: pointer;
}

#drop {
	border: 1px solid black;
	width: 300px;
	height: 200px;
	padding: 3px;
}
/* 사이드 */
 ul.mylist {
          list-style-type: none;
          background-color: #fff;
          width: 200px;
          padding: 0;
          margin: 0;
          border: 2px solid;
          font-size: 20px;
     }

     li a {
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li a:hover {
          background-color: tomato;
          color: #fff;
     }
</style>
<script type="text/javascript">
 	$(document).on(
			"drop",
			function(e) {
				// 태그에 파일 넣기
				$('input[type="file"]').prop("files",
						e.originalEvent.dataTransfer.files);
			}); 
	$(function() {
		/* drop & drag */
		var uploadfiles = []; // 복수의 파일도 가능
		var $drop = $('#drop');
		$drop.on("dragenter", function(e) { // 드래그 해서 그림이 들어오면
			$('#thumbnails').text(""); // '그림을 올려 놓으세요'라는 글자를 삭제
			$(this).addClass("drag-over"); // 배경색 노랑색으로 변경경경
		}).on("dragleave", function(e) { // 드래그를 취소하면 원위치
			$('#thumbnails').text("그림을 올려 놓으세요");
			$(this).removeClass("drag-over");
		}).on("dragover", function(e) { // 그림을 떨어뜨리려고 올려 놨을 때
			e.stopPropagation(); // 이벤트를 전달하지 마라
			e.preventDefault(); // 원애 기능을 하지 마라
		}).on("drop", function(e) { // 그림을 떨어뜨려 놓으면
			e.preventDefault();
			$(this).removeClass("drag-over");
			var files = e.originalEvent.dataTransfer.files; // 드래그 그림들
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file); // 업로드 파일 목록배열에 추가
				preview(file, size - 1); // 미리보기
			}
		});
	

		//x를 클릭한 그림 삭제
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove(); // x를 클릭한 그림 삭제
		});
	});
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close' data-idx='"+idx+
				"'>X</div><img src='"
						+ e.target.result
						+ "' title='"
						+ escape(f.name)
						+ "'/></div>'";
				e.target.result + "'/></div>'";
				$('#thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file, idx); // readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}
</script>
</head>
<body>
<div id="total">
   <div class="sideMenu" style="border: 2px solid red;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist">
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
            <li class=''><a href="">신고문의<i></i></a></li>
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>               
        </ul>
    </div>
    </div>
	<div class="container" id="sub" align="center">

		<form action="noticeUpdate.do" method="post"
			enctype="multipart/form-data" name="frm">
			<input type="hidden" name="num" value="${num }"> 
			<input	type="hidden" name="pageNum" value="${pageNum }">
			<input	type="hidden" name="id" value="${id }">
			<h2 class="text-primary">공지사항 수정</h2>
			<table class="table table-bordered">
				<%-- <tr>
					<td>아이디 <span class="glyphicon glyphicon-user"></span></td>
					<td>${board.id }</td>
				</tr> --%>
				<tr> 
					<td>제목</td>
					<td><textarea rows="1" cols="100" name="subject" required="required" >${board.subject }</textarea>
					<!-- <input type="text" name="subject" cols="100" required="required"> --></td>
				</tr>
				<tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td><input type="file" name="file" ></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="100" name="content" required="required">${board.content }</textarea>
					<!-- <input type="text" name="content" required="required"> --></td>
				</tr>
				<%-- <tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required" value="${board.subject }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" required="required" value="${board.content }"></td>
				</tr>
				
				<tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td><input type="file" name="file" ></td>
				</tr> --%>
				<tr> 
					<td colspan="2" align="center"><input type="submit"
						id="submit" class="btn btn-success" value="확인">
						<input type="button" onclick="location.href='noticeView.do?num=${board.num }'"
						id="cancle" class="btn btn-danger" value="취소"></td>
				</tr>
			</table>
		</form>
		<div id="disp"></div>
	</div>
	</div>
</body>
</html>