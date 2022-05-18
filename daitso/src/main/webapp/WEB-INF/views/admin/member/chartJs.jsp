.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--views/chart_exam/chart02.jsp -->
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
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
	            borderWidth: 1
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
	            borderWidth: 1
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

</script>
</head>
<body>
<!-- <div id="logChart"></div> -->
<!-- <div id="logChart" class="logChart"></div> -->
<div style="display: flex" >
<canvas id="logChart" class="logChart" style="width:40%"></canvas>
<canvas id="logChart2" class="logChart2" style="width:40%"></canvas>

</div>








</body></html>
