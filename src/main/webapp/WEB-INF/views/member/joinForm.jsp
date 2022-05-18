<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
  		display: flex; 
  		flex-direction: column;
  		justify-content: center;
  		align-items: center;
  		min-height: 90vh;	
	}
	
 	.content{
		width: 400px;
	} 
	
 	.id, .password, .password2, .name, .nickName, .address, .phone, .email{
		margin-bottom: 15px;
		text-align: center;
	} 
	
	.idtext, .passwordtext, .password2text, .nametext, .nickNametext, .addresstext, .phonetext, .emailtext{
		text-align: left;
		font-weight: bolder;
	} 
	
	.err {
		text-align: left;
	}
	
	input{
		width: 400px;
		height: 40px;
	}
	
	form {
		text-align: center;
	}
	
	.mention { 
		color: 444444;
	}
</style>
<script type="text/javascript">	
	// ajax로 아이디 실시간 중복 확인
	$(function () {
		$("#id").blur(function() {
			var id = $('#id').val();
			$.ajax({
				url : 'idChk.do',
				data : "id="+id,
				type : 'post',
				success : function (data) {
					if(id == "") {
						$('#idChk1').text("필수 입력 사항입니다.");
					} else {
						$('#idChk1').html(data);
					}
				}		
			});
		});	
	});
	
	// ajax로 닉네임 실시간 중복 확인
	$(function () {
		$("#nickName").blur(function() {
			var nickName = $('#nickName').val();
			$.ajax({
				url : 'nickChk.do',
				data : "nickName="+nickName,
				type : 'post',
				success : function (data) {
					if(nickName == "") {
						$('#nickChk1').text("필수 입력 사항입니다.");
					} else {
						$('#nickChk1').html(data);
					}
				}		
			});
		});	
	});
	
/*  // 암호확인 용(안씀!)
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("비밀번호와 비밀번호확인이 다릅니다. 다시 입력하세요.")
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}  */
	
 	// ajax로 비밀번호 일치 여부 판단
 	$(function () {
		$("#password2").blur(function () {
			if($('#password').val() != $('#password2').val()) {
				$('#passwordChk1').text("비밀번호가 일치하지 않습니다. 다시 입력 하세요");
				frm.password.focus();
				frm.password.value = "";
				frm.password2.value = "";
			} else if ($('#password').val() == "" || $('#password2').val() == "") {
				$('#passwordChk1').text("필수 입력사항 입니다.");
			} else {
				$('#passwordChk1').text("비밀번호가 일치 합니다.");
			}
		});
 	});
	  
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="content">
			<h2 class="metion">회원 가입</h2>
			<form action="m_join.do" method="post" name="frm">
				<div class="id">
					<div class="idtext">아이디</div>
					<div><input type="text" id="id" name="id" required="required" autofocus="autofocus"></div>
					<div id="idChk1" class="err"></div>
				</div>
				<div class="password">
					<div class="passwordtext">비밀번호</div>
					<div><input type="password" name="password" id="password" required="required"></div>
				</div>
				<div class="password2">
					<div class="password2text">비밀번호확인</div>
					<div><input type="password" name="password2" id="password2" required="required"></div>
					<div id="passwordChk1" class="err"></div>
				</div>
				<div class="name">
					<div class="password2text">이름</div>
					<div><input type="text" name="name" required="required"></div>
				</div>
				<div class="nickName">
					<div class="password2text">별명</div>
					<div><input type="text" id="nickName" name="nickName" required="required" placeholder="2글자 이상"></div>
					<div id="nickChk1" class="err"></div>
				</div>
				<div class="address">
					<div class="addresstext">주소</div>
					<div><input type="text" name="address" required="required"></div>
				</div>
				<div class="phone">
					<div class="phonetext">휴대폰번호</div>
					<div><input type="text" name="phone" required="required" placeholder="010-xxxx-xxxx"></div>
				</div>
				<div class="email">
					<div class="emailtext">이메일</div>
					<div><input type="email" name="email" required="required"></div>
				</div>
				<div align="center">
					<input type="submit" class="btn btn-success" value="가입하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>