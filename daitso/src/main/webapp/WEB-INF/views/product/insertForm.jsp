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
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
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
		// input type file 파일명 변경 설정

	});

</script>
</head>
<body>
	<div class="wrap">
		<div class="topheader">
			<a><img alt="" src="${path }/resources/images/logo.png"
				style="width: 190px; margin-left: 650px;"></a>
			<div class="nav" style="margin-right: 350px;">
				<b>${member.name }님 </b>&nbsp;
				<c:if test="${id != 'master' }">
					<a href="/Project2/mypage/mypage.do?">마이페이지</a>
				</c:if>
				<c:if test="${id == 'master' }">
					<!-- <a href='/Project2/manager/m_mypage.do'>관리자페이지</a> -->
					<a href="/Project2/manager/masterUpdate.do?">회원관리</a>
				</c:if>
				<a href='/Project2/login/logout.do'>로그아웃</a>
			</div>
		</div>
		<div class="intro_bg">
			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon" style="display: none;"> <label
						for="icon"> <span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="/Project2/main/main.do">◾메인</a></li>
							<br>
							<c:if test="${id != 'master' }">
								<li><a href="/Project2/mypage/mypage.do">◾마이페이지</a></li>
								<br>
							</c:if>
							<c:if test="${id == 'master' }">
								<li><a href="/Project2/manager/masterUpdate.do">◾회원관리</a></li>
								<br>
							</c:if>
							<li><a href="/Project2/notice/Notice.no">◾공지사항</a></li>
							<br>
							<li><a href="/Project2/board/View_BoardForm.wo">◾취미</a></li>
							<br>
							<li><a href="/Project2/sell_board/sell_notice.so">◾거래게시판</a></li>
						</ul>
					</div>
					<form action="list.do?pageNum=1">
						<div class="searchs">
							<select name="search" style="height: 63px;">
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
								class="input" type="submit" value="검색">
						</div>
					</form>
				</div>
				<button class="chats">
					<img
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAAA59JREFUaAXtmU1S2zAUxyWnDaawSJfAJj1BzddMl2TXpblBQg9QOAFwAth2QZ0bQJddkWVn+GiOQDfADnemfIROrP6fx8o4Tkw86AnSTjWTSHqSpZ/+fnpyHCmS5HletVQqbaLq41PR9jHKm91ud7vdbp8Rk6SvhYWFupRyB8VxBCZEnUKl1Mbp6WlTJkp/R8u4Q/fgofx8aW5ujpR+p61/Qe46jlORi4uLKgNLvrQBXwoz9meppvZePQ0wAA7o1+MCrUEBX0HguNJ1yp10hcrjBp3HNACeXci41v+DF7kzt4FbpU+RvqP6PJniv4KXHg6P/cnG3dkoqCLtL4p0Mu1zu+fWAR3gdK6ZjqWvt6749Z67paQKMGELarf0xKa5NcWvAlEpi/KOVKpOkFC7YQqbvt4KOEFPqIlDTOTFk0mxy+XbGp4dnDahoxyC1g9tYUd0tvWEXDkr+HVQ9qWS5M8aWgglWq50vVuyJqkruuF043db1x+Ts4Hf7E2sA5KeNPuTFD4iip8ynuFXwGqq/qgiCziUDgBdL0DQ6sjO6uuGCAv0fbCLMThOwpUoEj+UELEfS6HeQtG0wjEAQmJzqnHPFlmMwZPY3NLy3HyOo4muxjn8vvFqrdPsMxpWjMHT89PmhMuspGxhJKPa9JrZRkyN1yuynZwUu6FsenO24c9vTKNHjzRTYAMvR+46xq7S+OTPgK5xbEIab1hicRV6VEXI+xhPoMTG1Nr97rDJOG0s4JGINiVCCZReBfQBJ2DeWMbgFA6hthdvQsPTMA9ymN0YXESi2nHs+rMV8MkPd81hA9u2sUUV26DZ8f8dcHprlF3dc9eHMQ0ojlddO8M6Phd88votfSLHKPTucB8lnwGseXJyMvLpb2lpicIn/UIySQd4Y+vEj6MmoyTX1kmEp7hbxOwcHR21ocBIpQouzIerHdqEJ1Zijn2c/prAKuYBx3Fce5bgyT3miZVElPRlkpaXl70oishns9EoxEQ1Usdk/LxrB6JKXsc8e3zbAIj2LGCFFkQLy7vWxG6suJ48CVukfBa090+Z7suRs4ETzAPwgjaV9k8O8BLHIHqMy8vLu4uLi0+zs7NV2PqUx7tDf2Zm5ifav+n+JjkruAYB3Jcc+Pf4e7Jyfn7+Vfd9bG68OfMmplMUKm9n2+EyfXci2160bg2cAI6Pj7cYD7e+NVkFp5loQ9qAtw6u4eE2FOtDqnOkJwEnULhNi05SFFng/wBaR0Y/O/3CZQAAAABJRU5ErkJggg=="
						width="23" height="24" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="/shop//products"><img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
					width="23" height="24" alt="내상점버튼 이미지">내상점</a> <a
					class="products"><img
					src="data:image/png;base64,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"
					width="23" height="26" alt="판매하기버튼 이미지">글등록하기</a>
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
						enctype="multipart/form-data">
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
									</label> <input id="file-input1" type="file" name="file"
										required="required" style="display: none;"> <input
										id="file-input2" type="file" name="file2"
										style="display: none;"> <input id="file-input3"
										type="file" name="file3" style="display: none;"> <input
										id="file-input4" type="file" name="file4"
										style="display: none;"> <input id="file-input5"
										type="file" name="file5" style="display: none;">
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
								<div class="button_base b03_skewed_slide_in">
									<div>
										<input class="box1" type="button" value="등록"
											onclick="document.getElementById('frm').submit();" id="btn">
									</div>
									<div></div>
									<div>
										<input class="box2" type="button" value="등록"
											onclick="document.getElementById('frm').submit();" id="btn">
									</div>
								</div>
								<div class="button_base b03_skewed_slide_in1">
									<div>
										<input class="box2" type="button" value="취소"
											onclick="location.href='p_list.do?pageNum=${pageNum }'">
									</div>
									<div></div>
									<div>
										<input class="box1" type="button" value="취소"
											onclick="location.href='p_list.do?pageNum=${pageNum }'">
									</div>
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