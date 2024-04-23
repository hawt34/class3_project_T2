<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 홈</title>
<link href="admin_main.css" rel="stylesheet">
<link href="admin_aside.css" rel="stylesheet">
<link href="admin_footer.css" rel="stylesheet">
<link href="admin_header.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Kaushan+Script&display=swap');

a {
   text-decoration: none;
   color: black;
}
body {
    color : #151619;
    line-height: 1.5em;
    margin: 0px;
}
main {
  font-family: "Gowun Dodum", sans-serif;
  font-weight: 400;
  font-style: normal;
}

body {
    color : #151619;
    line-height: 1.5em;
    margin: 0px;
}
main {
  font-family: "Gowun Dodum", sans-serif;
  font-weight: 400;
  font-style: normal;
}
.admin_main_center{
	margin-top: 60px;
}

.card-text {
	font-size: 20px;
	padding-left: 20px;
	padding-top: 10px;
}

.card_num > a {
   text-decoration: none;
   color: black;
   font-size: 30px;
   padding-right: 25px;
}
.admin_main_title {
	margin-bottom: 50px;
}
.admin_main_center_card {
	border: 1px solid black;
	border-radius: 10px;
	width: 20%;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 20px;
}

.admin_main_card {
	font-size: 25px;
	margin-left: 20px;
	margin-top: 10px;
}
.admin_main_center{
	margin-left: 100px;
}
.admin_main_chart{
	width: 70%;
	margin: 100px 0 200px 100px;
	
}
</style>
</head>
<body>

	<header>
		<jsp:include page="admin_header.jsp"></jsp:include>
	</header>

	<main>

		<div class="admin_main">

			<div class="row">

				<div class="col-md-2">
					<!-- 사이드바 영역 -->
					<jsp:include page="../admin_main/admin_aside.jsp"></jsp:include>
				</div>

				<!--  메인 중앙 영역  -->
				<div class="col-md-10">

					<div class="admin_main_center">

						<div class="admin_main_title">
							<h1>⊙ 관리자페이지 Home (o゜▽゜)o☆</h1>
						</div>
					
						<div class="admin_dashboard">
							<div class="admin_main_center_card" onclick="location.href='#'">
								<div class="admin_main_card" align="left">◇금일 예매 현황</div>
								<div align="right" class="card_num">
									<a href="#">0건</a>
								</div>
							</div>
							<div class="admin_main_center_card" onclick="location.href='#'">
								<div class="admin_main_card" align="left">◇금일 상영 영화</div>
								<div align="right" class="card_num">
									<a href="#">0건</a>
								</div>
							</div>
							<div class="admin_main_center_card" onclick="location.href='#'">
								<div class="admin_main_card" align="left">◇일일 가입자 수</div>
								<div align="right" class="card_num">
									<a href="#">0명</a>
								</div>
							</div>
							<div class="admin_main_center_card" onclick="location.href='#'">
								<div class="admin_main_card" align="left">◇총 회원 수</div>
								<div align="right" class="card_num">
									<a href="#">20명</a>
								</div>
							</div>
						</div>

					</div>

					<div class="admin_main_chart">
						<canvas id="myChart" height="100px"></canvas>
					</div>

				</div>
			</div>

		</div>


	</main>

	<footer>
		<jsp:include page="admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		var ctx = document.getElementById("myChart").getContext('2d');
		/*
		- Chart를 생성하면서, 
		- ctx를 첫번째 argument로 넘겨주고, 
		- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ "해운대점", "서면점", "화명점", "광안점", "남포점", "사상점" ],
						datasets : [ {
							label : '일일 매출 데이터',
							data : [ 1200000, 1900000, 300000, 500000, 200000,
									300000 ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255,99,132,1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	</script>
</body>
</html>