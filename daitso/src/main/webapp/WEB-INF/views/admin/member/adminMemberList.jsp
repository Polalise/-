<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style type="text/css">
#chart{
   margin-left: 300px;
}
/* .table{
     margin-left: 300px;
} */
#logChart2{
      margin-left: 80px;
}
</style>
<script type="text/javascript">
  /*    $(function() {
	$('#chartjs').load("chart.do");
}); */
window.onload = function() {
	var ctx = document.getElementById("logChart").getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ["공지사항글", "이벤트글"],
	        datasets: [{
	        	label: '게시글 수',
	
	            data: ['${noticeCount}', '${eventCount}'], //컨트롤러에서 모델로 받아온다.
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	
	            ],
	            borderWidth: 2
	        }
	        ]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	var ctx1 = document.getElementById("logChart2").getContext('2d');
	var myChart1 = new Chart(ctx1, {
	    type: 'line',
	    data: {
	        labels: ["총회원수", "탈퇴한 회원수"],
	        datasets: [{
	        	label: '회원 수',
	
	            data: ['${memberCount}', '${member2Count}'], //컨트롤러에서 모델로 받아온다.
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	
	            ],
	            borderWidth: 2
	        }
	        ]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});

}

	function del() {
		var cf = confirm("회원을 탈퇴시키겠습니까?");
		if(cf) {
			location.href="adminDelete.do?id=${member.id }&pageNum=${pageNum }";
		} else {
			alert("탈퇴가 취소 되었습니다");
			return;
		}
	}
	function rol() {
		var cf = confirm("회원을 복구시키겠습니까?");
		if(cf) {
			location.href="adminRollback.do?id=${member.id }&pageNum=${pageNum }";
		} else {
			alert("복구가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<body>
<div style="display: flex" id="chart" >
<canvas id="logChart" class="logChart" style="width:40%"></canvas>
<canvas id="logChart2" class="logChart2" style="width:40%"></canvas>
</div>
<h2 class="title" style="margin-left: 300px">회원정보</h2>
	 <form action=" adminMemberList.do?pageNum=1">

<select name="search" style="margin-left: 1300px">
   <c:forTokens var="sh" items="id,name,nickName,subcon" delims="," varStatus="i">
      <c:if test="${sh==member.search }">
       <option value="${sh }" selected="selected">${title[i.index]}</option>
      </c:if>
      <c:if test="${sh!=member.search }">
       <option value="${sh }">${title[i.index]}</option>
      </c:if>
   </c:forTokens>
</select>
 <input type="text" name="keyword" value="${member.keyword }">
 <input type="submit" value="확인">
</form>	
	<table class="table" style="width:100%">
		<tr>   
			<th class="col-md-1 text-center">회원번호</th>
			<th class="col-md-1 text-center">회원ID</th>
			<th class="col-md-1 text-center">이름</th>
			<th class="col-md-1 text-center">닉네임</th>
			<th class="col-md-1 text-center">주소</th>
			<th class="col-md-1 text-center">핸드폰번호</th>
			<th class="col-md-1 text-center">이메일</th>
			<th class="col-md-1 text-center">등급</th>
			<th class="col-md-1 text-center">가입일</th>
			<th class="col-md-1 text-center">탈퇴 여부</th>				
		</tr>
			<c:if test="${empty mbList }">
				<tr>
					<th colspan="10">회원 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty mbList }">
				<c:forEach var="member" items="${mbList }">
					<tr>
						<td class="col-md-1 text-center">${num }
							<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
							<c:if test="${member.del == 'y' }">
							<td colspan="8">삭제된 회원입니다</td>
							</c:if>
						<c:if test="${member.del == 'n' }">
							<td class="text-center col-md-1">
								<a href="adminView.do?id=${member.id }&pageNum=${pb.currentPage}" class="inputLineA">${member.id }</a></td>
							<td class="col-md-1 text-center">${member.name }</td>
							<td class="col-md-1 text-center">${member.nickName }</td>
						    <td class="col-md-1 text-center">${member.address }</td>
						    <td class="col-md-1 text-center">${member.phone }</td>
						    <td class="col-md-1 text-center">${member.email }</td>
						    <td class="col-md-1 text-center">${member.grade }</td>
							<td class="col-md-1 text-center">${member.reg_date }</td>
							
								<c:if test="${member.id == 'admin' }">
									<td class="col-md-2 text-center">관리자</td>
								</c:if>
								<c:if test="${member.id != 'admin' }">
									<td class="text-center">
										<%-- <a href="adminDelete.do?id=${member.id }&pageNum=${pageNum }">
											회원탈퇴</a> --%>
										<a onclick="del()" class="btn_sm_full">회원탈퇴</a>	
									</td>
								</c:if>
							</c:if>
							<c:if test="${member.del == 'y' }">
								<td class="text-center">
								<%-- 	<a href="adminRollback.do?id=${member.id }&pageNum=${pageNum }">복구</a> --%>
									<a onclick="rol()" class="btn_sm_full">복구</a>		
								</td>
							</c:if>
						
					</tr>  
				</c:forEach>
				<tr><td colspan="7"></td></tr>
			</c:if>
		</table>   
		<div align="center">
			<ul class="pagination">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="adminMemberList.do?pageNum=1&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminMemberList.do?pageNum=${pb.startPage - 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminMemberList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">　${i }　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminMemberList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminMemberList.do?pageNum=${pb.endPage + 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMemberList.do?pageNum=${pb.totalPage }&search=${member.search }&keyword=${member.keyword }">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>