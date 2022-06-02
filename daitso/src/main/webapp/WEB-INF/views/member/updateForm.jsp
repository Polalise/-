<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/updateForm.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="update_main">
	<form action="m_update.do"  method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
        <div class="container">
            <div class="content">
                <h2 class="metion">내 정보 수정</h2>
                    <div class="profile_box">
                    <div class="wap">
                        <div class="update_id">
                            <div class="idtext" style="margin-top: 10px;">아이디</div>
                            <div class="sec">
                                <input type="text" id="id" name="id" value="${member.id }" readonly="readonly">
                            </div>
                        </div>
                        <div class="update_password">
                            <div class="passwordtext" style="margin-top: 10px;">비밀번호</div>
                            <div class="sec">
                                <input type="password" name="password" id="password" required="required">
                            </div>
                        </div>
                        <div class="update_password2">
                            <div class="password2text" style="margin-top: 10px;">비밀번호확인</div>
                            <div class="sec">
                                <input type="password" name="password2" id="password2" required="required">
                            </div>
                        </div>
                        <div id="passwordChk1" class="err"></div>
                        <div class="update_nickName">
                            <div class="password2text" style="margin-top: 10px;">별명</div>
                            <div class="sec">
                                <input type="text" id="nickName" name="nickName" required="required"
                                    placeholder="2글자 이상" value="${member.nickName}">
                            </div>
                        </div>
                        <div id="nickChk1" class="err"></div>
                        <div class="update_address">
                            <div class="addresstext" style="margin-top: 10px;">주소</div>
                            <div class="sec">
                                <input type="text" name="address" required="required" value="${member.address}">
                            </div>
                        </div>
                        <div class="update_phone">
                            <div class="phonetext" style="margin-top: 10px;">휴대폰번호</div>
                            <div class="sec">
                                <input type="text" name="phone" required="required" placeholder="010-xxxx-xxxx"
                                    value="${member.phone}">
                            </div>
                        </div>
                        <div class="update_email">
                            <div class="emailtext" style="margin-top: 10px;">이메일</div>
                            <div class="sec">
                                <input type="email" name="email" required="required" value="${member.email}"></div>
                        </div>
                    </div>
                    <div class="update_photoName">
                        <div class="photoBox"><img src="${path }/resources/upload/${member.photoName}">
                        <input type="file" name="file" value="${member.photoName }"></div>
                    </div>
                    </div>
                    <div class="footer">
                        <input type="submit" class="successBtn" value="수정하기">
                    </div>
            </div>
        </div>
	</form>
    </div>
</body>
</html>