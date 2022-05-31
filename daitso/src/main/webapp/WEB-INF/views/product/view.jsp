<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .heart{
    width: 60px;
    height: 60px;
    }
</style>
<script type="text/javascript">
	$(function() {
		$('#rbdListDisp').load("replyList.po", "bno=${product.p_num}");
		$('#rInsert').click(function() {
			var sendData = $('#frm1').serialize();
			$.post("rInsert.po", sendData, function(data) {
				alert("댓글이 입력 되었습니다");
				$('#rbdListDisp').html(data);
				frm1.replytext.value = ""; // 댓글 지우기
			});
		});
	});
	
	$(function() {
        $('#boardListDisp').load("p_list.po","pageNum=${pageNum}");
         var like = "${likes}"
        $("#addL").on("click",function () {
            if (like == ''){
            	alert("좋아요 입력1");
                $.post('addLikes.do', "id=${id}&p_num=${product.p_num}", function(data) {
                	alert("좋아요 입력2");
                    $(".heart").attr("src","${path}/resources/images/likes.png"); 
                    alert("좋아요 입력3");
                });
            } else if (like != '') {
            	alert("좋아요 삭제1");
            $.post('deleteLikes.do', "id=${id}&p_num=${product.p_num}", function(data) {
            	alert("좋아요 삭제2");
                    $(".heart").attr("src","${path}/resources/images/unlikes.png");
                    alert("좋아요 삭제3");
                });
            };
            location.reload();
        });

        $('#report').click(function() {
            var pop = window.open("reportForm.do?p_num=${product.p_num}","content","width=620 height=700");
        });
    });
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 상세 내용</h2>
		<table class="table table-boardred table-striped">
			<tr>
				<td>제목</td>
				<td>${product.p_name }</td>
				<td>조회수</td>
				<td>${product.readcount }</td>
				<td>가격</td>
				<td>${product.price }</td>
				<td>작성자</td>
				<td>${product.p_writer }</td>
				<td>작성일</td>
				<td>${product.p_date }</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><img alt="${product.thumnails }"
					src="${path}/resources/upload/${product.thumnails}" width="100"></td>
				<td><img alt="${product.thumnails2 }"
					src="${path}/resources/upload/${product.thumnails2}" width="100"></td>
				<td><img alt="${product.thumnails3 }"
					src="${path}/resources/upload/${product.thumnails3}" width="100"></td>
				<td><img alt="${product.thumnails4 }"
					src="${path}/resources/upload/${product.thumnails4}" width="100"></td>
				<td><img alt="${product.thumnails5 }"
					src="${path}/resources/upload/${product.thumnails5}" width="100"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="10"><pre>${product.p_content }</pre></td>
			</tr>

		</table>
		<div id="rbdListDisp"></div>
		<h2 class="text-primary">댓글 작성</h2>
		<form action="" name="frm1" id="frm1" method="post">
			<input type="hidden" name="bno" value="${product.p_num }">
			<table class="table table-hover">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="replier"
						value="${product.p_writer }">
					<td>댓글</td>
					<td><textarea rows="2" cols="60" name="replytext"></textarea></td>
					<td><input type="button" value="댓글 입력" id="rInsert"></td>
			</table>
		</form>
		<tr>
			<td colspan="10" align="center">
			<a href="p_list.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a> 
			<a href="p_updateForm.do?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-warning">수정</a> 
			<!-- 회원게시팡인 경우 폼없이 삭제 여부를 묻고 삭제, 비회원인 경우에는 암호를 획인하기 위한 화면 -->
			<a href="p_delete.do?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-danger">삭제</a> 
			<a href="p_insertForm.do?p_num=${product.p_num }&pageNum${pageNum}" class="btn btn-success">답글</a>
			
			<c:if test="${likes == '' }">
            	<a id="likeEvent"><img alt="" src="${path}/resources/images/unlikes.png" class="heart" id="addL"></a>
            </c:if>
            <c:if test="${likes != '' }">
            	<a id="likeEvent"><img alt="" src="${path}/resources/images/likes.png" class="heart" id="addL"></a>
            </c:if>
            
            <a class="btn btn-danger" id="report">신고</a>
            <div>
            	
	         	<a href="http://172.30.1.43:8080/daitso/chatRoom.do?p_num=${product.p_num }" class="btn btn-warning" id="chat">판매자와 채팅하기</a>
         	
            </div>
		</tr>
	</div>
</body>
</html>