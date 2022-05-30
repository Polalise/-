<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@import url("resources/css/notice.css");
</style>
<style type="text/css">
@import url("resources/css/style2.css");
</style>
<style type="text/css">
@import url("resources/css/main.css");
</style>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<script src="resources/summernote/summernote-lite.js"></script>

<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
   function sample6_execDaumPostcode() { 
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }    

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
            }
        }).open();
    }
	function preview(file) { 
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close'>X</div><img src='"+
			e.target.result+"'/></div>'";
				$('#thumnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file); // readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}
	$(document).ready(function() {
		// textarea
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
	});
	function sub() {
		if(!frm.file.value){
			alert("사진을 한장 이상 넣어 주세요");
			return false;
		}
		if(!frm.p_name.value){
			alert("제목을 입력해 주세요");
			frm.p_name.focus();
			return false;
		}
		if(!frm.price.value){
			alert("가격을 입력해 주세요");
			frm.price.focus();
			return false;
		}
		if(!frm.p_name.value){
			alert("제목을 입력해 주세요");
			frm.p_name.focus();
			return false;
		}
		if(!frm.p_local.value){
			alert("지역을 입력해 주세요");
			frm.p_local.focus();
			return false;
		}
		if(!frm.p_content.value){
			alert("내용을 입력해 주세요");
			frm.p_content.focus();
			return false;
		}
		frm.submit();
		
	}
</script>
</head>
<body>
	<div class="intro_bg" id="intro2">
		<img alt="" id="Im2g" src="${path }/resources/images/logo.png"
			onclick="location.href='main.do?p_num=${product.p_num}&pageNum=${pageNum }'"
			style="width: 190px; position: relative; top: 40px;">
		<div class="header1">
			<div class="search_area">
				<input type="checkbox" id="icon" style="display: none;"> <label
					for="icon"> <span></span> <span></span> <span></span>
				</label>
				<div id="header">
					<ul>
						<li><a href="p_list.do">◾메인</a></li>
						<br>
						<c:if test="${id != 'admin' }">
							<li><a href="myProfileForm.do">◾마이페이지</a></li>
							<br>
						</c:if>
						<c:if test="${id == 'admin' }">
							<li><a href="adminMemberList.do">◾회원관리</a></li>
							<br>
						</c:if>
						<li><a href="noticeList.do">◾공지사항</a></li>
						<br>
						<li><a href="eventList.do">◾이벤트</a></li>
						<br>
					</ul>
				</div>
				<form action="p_list.do?pageNum=1">
					<div class="searchs" style="margin-top:0px; ">
						<select name="search" style="height: 48px; color: #000;">
							<!-- select바 한글화 -->
							<c:forTokens var="sh" items="subcon,p_writer,p_name,p_content"
								delims="," varStatus="i">
								<c:if test="${sh == product.search }">
									<option value="${sh }" selected="selected">${title[i.index] }</option>
								</c:if>
								<c:if test="${sh != product.search }">
									<option value="${sh }">${title[i.index] }</option>
								</c:if>
							</c:forTokens>
						</select><input class="searchr" type="text" name="keyword"
							value="${product.keyword }" placeholder="검색어 입력"> <input
							class="searchinput" type="submit" value="검색">
					</div>
				</form>
			</div>
			<div class="icon-button">
				<button class="chats" style="margin-left: 0px;">
					<img src="${path }/resources/images/main2.png" width="15"
						height="16" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="myProfileForm.do"> <img
					src="${path }/resources/images/main1.png" width="15" height="16"
					alt="내상점버튼 이미지">내상점
				</a> <a class="products"><img
					src="${path }/resources/images/main3.png" width="15" height="16"
					alt="판매하기버튼 이미지"
					onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
				<c:if test="${id != 'admin' }">
					<a class="shop" href='adminMain2.do'>고객센터</a>
				</c:if>
				<c:if test="${id == 'admin' }">
					<a class="shop" href="adminMain.do">관리자페이지</a>
				</c:if>
				<a class="log" href='logout.do'>로그아웃</a>
			</div>
		</div>
	</div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>판매글쓰기</strong>
			<p>물건을 정성것 판매하자</p>
			<div class="board_write_wrap">
				<div class="board_write">
					<form action="p_insert.do" method="post" id="frm"
						enctype="multipart/form-data" name="frm">
						<!-- onsubmit="return chk()" -->
						<input type="hidden" name="p_num" value="${p_num }"> <input
							type="hidden" name="pageNum" value="${pageNum }">
						<div class="title" style="margin-top: 15px">
							<dl>
								<dt>제목</dt>
								<dd>
									<input type="text" name="p_name" required="required"
										autofocus="autofocus" placeholder="글 제목을 입력하세요">
								</dd>
							</dl>
						</div>
						<div class="title">
							<dl>
								<dt>작성자</dt>
								<dd>
									<input type="text" name="p_writer" required="required"
										value="${member.nickName }" style="width: 10%;">

								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>판매금액</dt>
								<dd>
									<input type="number" name="price" required="required"
										placeholder="판매금액을 재시해주세요" style="height: 40px; width: 225;">
								</dd>
							</dl>
						</div>
						<div class="title">
							<dl>
								<dt>이미지 업로드</dt>
								<dd>
									<label for="file-input1">
									 <img alt=""src="${path }/resources/images/poto.png"
										style="width: 30px; cursor: pointer; margin-left: 10px;">
									</label> <label for="file-input2">
									 <img alt=""src="${path }/resources/images/poto.png"
										style="width: 30px; cursor: pointer;">
									</label> <label for="file-input3">
									 <img alt=""src="${path }/resources/images/poto.png"
										style="width: 30px; cursor: pointer;">
									</label> <label for="file-input4">
									 <img alt=""src="${path }/resources/images/poto.png"
										style="width: 30px; cursor: pointer;">
									</label> <label for="file-input5"> 
									<img alt=""	src="${path }/resources/images/poto.png"
										style="width: 30px; cursor: pointer;">
									</label>
									 <input id="file-input1" type="file" name="file"
										required="required" style="display: none;"> 
									<input	id="file-input2" type="file" name="file2"
										style="display: none;">
									 <input id="file-input3" type="file" name="file3" style="display: none;"> <input
										id="file-input4" type="file" name="file4"
										style="display: none;">
									 <input id="file-input5" type="file" name="file5" style="display: none;">
								</dd>
							</dl>
						</div>
						<div class="title">
							<dl>
								<dt>지역</dt>
								<dd>
									<input type="button" onclick="sample6_execDaumPostcode()"
										value="주소 찾기" class="btn_local"><br> <input
										type="text" id="sample6_address" placeholder="주소"
										name="p_local"><br>
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>판매/구매</dt>
								<dd>
									<select id="selbox" class="selbox" name="p_value">
										<option value="판매">판매합니다</option>
										<option value="구매">구매합니다</option>
									</select>
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>분류</dt>
								<dd>
									<select id="selbox2" class="selbox2" name="p_tag">
										<option value="의류">의류</option>
										<option value="전자기기">전자기기</option>
										<option value="생활가전">생활가전</option>
										<option value="차량/오토바이">차량/오토바이</option>
										<option value="음반/악기">음반/악기</option>
										<option value="도서/티켓/문구">도서/티켓/문구</option>
										<option value="패션/악세사리">패션/악세사리</option>
									</select>
								</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea id="summernote" name="p_content" class="clear"></textarea>
						</div> 
						<div class="bt_wrap">
							<div class="back">
							<div class="button_base b05_3d_roll" onclick="sub()"> 
									<div>등록</div>
									<div>등록</div>
							</div>
							<div class="button_base b05_3d_roll"
									 onclick="location.href='p_list.do?pageNum=${pageNum }'">
									<div>취소</div>
									<div>취소</div>
								</div>								 
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>