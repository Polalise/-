<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("resources/css/main2.css");
#total{
    display: flex;

}
.table2{

}
.table{
    border: 1px solid ;
}
#member_box{

}
/* 사이드 */
 ul.mylist {
          list-style-type: none;
          background-color: #fff;
          width: 200px;
          padding: 0;
          margin: 0;
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

</head>
<body>
<div class="intro_bg">
			<a href="p_list.do"><img alt="" id="Im2g" src="${path }/resources/images/logo.png"
				style="width: 190px; margin-left: 0px; position: relative; top: 35px; left: 310;"></a>

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
								class="input" type="submit" value="검색" style="margin-right: 65;">
						</div>
					</form>
				</div>
				<button class="chats">
					<img src="${path }/resources/images/main2.png" width="15"
						height="16" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="myProfileForm.do"><img
					src="${path }/resources/images/main1.png" width="15" height="16"
					alt="내상점버튼 이미지">내상점</a> <a class="products"><img
					src="${path }/resources/images/main3.png" width="15" height="16"
					alt="판매하기버튼 이미지"
					onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
				<c:if test="${id != 'admin' }">
					<a class="links" href='adminMain2.do'>고객센터</a>
				</c:if>
				<c:if test="${id == 'admin' }">
					<a class="links" href="adminMain.do">관리자페이지</a>
				</c:if>
				<a class="links" href='logout.do'>로그아웃</a>
			</div>
		</div>
		<div id="total">
  <div class="sideMenu" style="border-left: 1px solid; border-top: 1px solid white;  background-color: #FBE0C4; height: 900px;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist" style=" background-color: #FBE0C4;  ">
            <li class='' ><a href="noticeList.do" style="color: white; font-weight: 200px; text-align: center;">공지사항<i></i></a></li>
            <li class='' ><a href="eventList.do" style="color: white; font-weight: 200px; text-align: center;">이벤트<i></i></a></li>
            <c:if test="${id != 'admin'}">
            <li class='' ><a href="reportmyList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="reportList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="adminMemberList.do" style="color: white; font-weight: 200px; text-align: center;"><b>회원관리</b><i></i></a></li>    
            </c:if>           
        </ul>
    </div>
    </div>
      <h3 class="title" style="font-size:xx-large; position: relative;"><b>회원 정보</b></h3>
	<!-- 회원정보 테이블 -->
	<div class="col-md-5" id="member_box" style="margin-left: 250px;  margin-top: 150px;">
		<table class="table">
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">아이디</th>
				<td class="col-md-5">${member.id }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">비밀번호</th>
				<td class="col-md-5">${member.password }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">이름</th>
				<td class="col-md-5">${member.name }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">닉네임</th>
				<td class="col-md-5">${member.nickName }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center" style="background-color: gray; color:white;">연락처</th>
				<td class="col-md-5">${member.phone }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">주소</th>
				<td class="col-md-5">${member.address }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">이메일</th>
				<td class="col-md-5">${member.email }</td>
			</tr>
			<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">레벨</th>
				<td class="col-md-5">${member.grade}</td>
			</tr>
				<tr>
				<th class="col-md-2 text-center" style="background-color: gray; color:white;">등록일</th>
				<td class="col-md-5">${member.regdate }</td>
			</tr>	
		</table>
		<div align="center">
			<a href="adminUpdateForm.do?id=${member.id }&pageNum=${pageNum }" class="btn_sm_full">회원정보수정</a>
			<a href="adminMemberList.do?pageNum=${pageNum }" class="btn_sm_stroke">이전</a>
		</div>
	</div>  
	

</body>
</html>    