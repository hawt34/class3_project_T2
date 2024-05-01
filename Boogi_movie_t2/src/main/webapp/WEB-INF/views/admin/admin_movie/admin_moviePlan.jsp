<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원관리</title>
<link href="../admin_main/admin_main.css" rel="stylesheet">
<!-- 부트스트랩 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>

table {
	border-collapse: collapse;
	width: 90%;
	margin: 0rem auto;
	box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.1);
	background-color: white;
	text-align: center;
}

/* 테이블 행 */
th, td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #1b1b1b;
	color: #ddd;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
	background-color: #eee;
	opacity: 0.9;
	cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1), td:nth-child(1) {
	width: 10%;
}

th:nth-child(2), td:nth-child(2) {
	width: 7%;
}

th:nth-child(3), td:nth-child(3) {
	width: 25%;
}

th:nth-child(4), td:nth-child(4) {
	width: 10%;
}

th:nth-child(5), td:nth-child(5) {
	width: 10%;
}

th:nth-child(6), td:nth-child(6) {
	width: 10%;
}
th:nth-child(7), td:nth-child(7) {
	width: 10%;
}
th:nth-child(8), td:nth-child(8) {
	width: 15%;
}

.admin_plan_head {
	margin: 50px 0;
	text-align: right;
}

.admin_plan_body {
	margin-bottom: 100px;
}

.admin_moviePlan_search {
	height: 35px;
	width: 80%;
	background: #black;
	text-align: center;
}
.admin_plan_search>button {
	width: 90px;
	height: 46px;
	background: black;
	outline: none;
	color: white;
	font-weight: bold;
}

.admin_plan_title {
	float: left;
	font-size: 30px;
	margin-left: 100px;
	margin-bottom: 30px;
}
.admin_plan_body_search{
	margin-bottom: 30px;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>
		<!-- 메인이랑 바디 사이 -->
		<div class="row">

			<div class="col-md-2">
				<!-- 사이드바 영역 -->
					<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_plan_head">
					<div class="admin_plan_title">상영일정관리</div>
					
				</div>
				
				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_plan_body">
					<form action = "admin_moviePlan_reg" method = "post">
						<table class="admin_plan_body_search">
							<thead>
								<tr>
									<th>극장</th>
									<th>상영관</th>
									<th>영화제목</th>
									<th>상영날짜</th>
									<th>상영회차</th>
									<th>상영시간</th>
									<th>상영일정등록</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div>
											<select class="admin_moviePlan_search">
												<option value="극장선택">극장선택</option>
												<option value="부산진구">부산진구</option>
												<option value="해운대구">해운대구</option>
												<option value="북구">북구</option>
												<option value="남구">남구</option>
												<option value="서구">서구</option>
											</select> 
										</div>
									</td>
									<td>
										<div>
											<select class="admin_moviePlan_search">
												<option value="-관">-관</option>
												<option value="1관">1관</option>
												<option value="2관">2관</option>
												<option value="3관">3관</option>
												<option value="4관">4관</option>
												<option value="5관">5관</option>
												<option value="6관">6관</option>
											</select> 
										</div>
									</td>
									<td>
										<div>
											<select class="admin_moviePlan_search">
												<option value="영화제목">영화제목</option>
												<option value="윙카">윙카</option>
												<option value="파묘">파묘</option>
												<option value="전준혁">전준혁</option>
												<option value="센과치히로">센과치히로</option>
												<option value="현실을 살아라">현실을 살아라</option>
											</select> 
										</div>
									</td>
									<td>
										<input type="date" class="admin_moviePlan_search">
									</td>
									<td>
										<div>
											<select class="admin_moviePlan_search">
												<option value="1회차">1회차</option>
												<option value="2회차">2회차</option>
												<option value="3회차">3회차</option>
												<option value="4회차">4회차</option>
												<option value="5회차">5회차</option>
												<option value="6회차">6회차</option>
											</select> 
										</div>
									</td>
									<td>
										<input type="text" placeholder="12:00" class="admin_moviePlan_search" readonly>
									</td>
									<td>
										<button type="submit" class="btn btn-outline-primary">등록하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<br>
					<table>
						<thead>
							<tr>
								<th>극장</th>
								<th>상영관</th>
								<th>영화제목</th>
								<th>상영날짜</th>
								<th>상영회차</th>
								<th>상영시간</th>
								<th>상영일정등록</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>서면점</td>
								<td>3관</td>
								<td>윙카</td>
								<td>2024-04-19</td>
								<td>3회차</td>
								<td>12:00</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="moviePlanEdit()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="moviePlanWithdraw()">삭제</button>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>
	
	<script type="text/javascript">
		function moviePlanEdit() {
			window.open("admin_moviePlan_form", "_self", "width=1000, height=800, top=100, left=400");
		}
		
		function moviePlanWithdraw() {
			location.href = "admin_moviePlan_delete";
		}

	</script>
</body>
</html>