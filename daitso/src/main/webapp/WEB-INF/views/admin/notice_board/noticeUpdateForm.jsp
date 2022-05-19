<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	<div class="container" align="center">

		<form action="noticeUpdate.do" method="post"
			enctype="multipart/form-data" name="frm">
			<input type="hidden" name="num" value="${num }"> 
			<input	type="hidden" name="pageNum" value="${pageNum }">
			<input	type="hidden" name="id" value="${id }">
			<h2 class="text-primary">게시글 작성</h2>
			<table class="table table-bordered">
				<%-- <tr>
					<td>아이디 <span class="glyphicon glyphicon-user"></span></td>
					<td>${board.id }</td>
				</tr> --%>
				<tr>
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
				</tr>
				<tr> 
					<td colspan="2" align="center"><input type="submit"
						id="submit" class="btn btn-success" value="확인"></td>
				</tr>
			</table>
		</form>
		<div id="disp"></div>
	</div>
</body>
</html>