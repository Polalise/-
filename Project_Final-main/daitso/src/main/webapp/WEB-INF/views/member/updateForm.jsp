<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* drop & drap */
	.drag-over{
		background: yellow;
	}
	.thumb{
		width: 200px;
		padding: 5px;
		float: left;
	}
	.thumb > img {
		width: 100%;
	}
	.thumb > .close {
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
	.err { 
		color: orange;
	}
</style>
<script type="text/javascript">
//미리보기에 사진 올려 두면 파일 첨부 한 것과 같은 효과를 위한 함수(여러개 일 때는 작동을 안함)
	$(document).on("drop", function(e) {
		$('input[type="file"]').prop("files", e.originalEvent.dataTransfer.files);
	})
	
	$(function () {
		/* drop & drag */
		var uploadfiles = [];   // 복수의 파일도 가능
		
		var $drop = $('#drop');
		$drop.on("dragenter", function(e) { 	// 드래그 해서 그림이 들어오면
			$('#thumbnails').text("");   		// 그림을 올려 놓으세요 라는 글을 지움
			$(this).addClass("drag-over");
		}).on("dragleave", function(e) { 		// 드래그를 취소하면 다시 원상 상태로 돌아옴
			$('#thumbnails').text("그림을 올려 놓으세요");
			$(this).removeClass("drag-over");
		}).on("dragover", function(e) {   		// 그림을 떨어뜨리고 올려놨을 때
			 e.stopPropagation();  				// 이벤트를 전달 하지 마라
			 e.preventDefault();	  			// 원래 기능을 하지마라
		}).on("drop", function(e) { 			// 그림을 떨어뜨려 놓으면
			e.preventDefault();
			$(this).removeClass("drag-over");
			
			var files = e.originalEvent.dataTransfer.files; 	// 드래그 한 그림들
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file);  // 업로드 파일 목록 배열에 추가
				preview(file);  // 미리보기
			}
		});
		// 그림 미리보기에 있는 <div class='close'>X</div> 누르면 지워지게 하려고 만듬
		$('#thumbnails').on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-indx');
			$target.parent().remove(); // X를 클릭한 그림 삭제
		});
	});
	
	// 그림 미리 보여주는 함수
	function preview(file) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close'>X</div><img src='"+e.target.result+"'/></div>";
				$('#thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file); // readAsDataURL : 컨텐츠를 특정 Blob나 file에서 읽어오는 역할
	}
	function nickChk(){
		if(!frm.nickName.value) {
			alert("별명을 입력한 후에 확인 하세요.");
			frm.nickName.focus();
			return false;
		}
		// nickName ajax
		$.post('nickChk.do', "nickName="+frm.nickName.value, function(data) {
			$('#nickChk1').html(data);
		});
	}
	
	function chk() {
		if (frm.password.value != frm.password2.value){
			alert("암호와 암호확인이 다릅니다.")
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
		<h2 class="metion">회원 가입</h2>
		<form action="m_update.do"  method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<input type="hidden" name="id" value="${member.id }">
			<div>
			<div>아이디 : ${member.id}</div>
			
			</div>
			<div>
				<div>비밀번호<input type="password" name="password" required="required"></div>
			</div>
			<div>
				<div>비밀번호확인<input type="password" name="password2" required="required"></div>
			</div>
			<div>
				<div>이름<input type="text" name="name" required="required" value="${member.name}"></div>
			</div>
			<div>
				<div>별명<input type="text" name="nickName" required="required" value="${member.nickName}">
						<input type="button" class="btn btn-sm" value="중복체크" onclick="nickChk()" ></div>
						<div id="nickChk1" class="err"></div>
			</div>
			<div>
				<div>주소<input type="text" name="address" required="required" value="${member.address}"></div>
			</div>
			<div>
				<div>휴대폰번호<input type="text" name="phone" required="required" value="${member.phone}"></div>
			</div>
			<div>
				<div>이메일<input type="email" name="email" required="required" value="${member.email}"></div>
			</div>
			<div>
				<div>사진<input type="file" name="file"><img alt="" src="resources/upload/${member.photoName}" width="200"></div>
			</div>
			<div>
				<div>프로필 미리보기<div id="drop"><div id="thumnails">그림을 올려놓으세요</div></div></div>
			</div>
			<div align="center">
				<input type="submit" class="btn btn-success" value="내정보 수정">
			</div>
		</form>
	</div>
</body>
</html>