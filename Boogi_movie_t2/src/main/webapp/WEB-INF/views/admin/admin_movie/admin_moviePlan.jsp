<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원관리</title>
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style>

table {
	border-collapse: collapse;
	width: 1600px;
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
	width: 30%;
}

th:nth-child(4), td:nth-child(4) {
	width: 5%;
}

th:nth-child(5), td:nth-child(5) {
	width: 10%;
}

th:nth-child(6), td:nth-child(6) {
	width: 8%;
}
th:nth-child(7), td:nth-child(7) {
	width: 8%;
}
th:nth-child(8), td:nth-child(8) {
	width: 10%;
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
									<th>2D/3D</th>
									<th>상영날짜</th>
									<th>상영시간</th>
									<th>상영종료</th>
									<th>상영일정등록</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div>
											<select id="theaterSelect" class="admin_moviePlan_search">
												<option value="0">극장선택</option>
												<option value="1">해운대점</option>
												<option value="2">센텀점</option>
												<option value="3">서면점</option>
												<option value="4">남포점</option>
												<option value="5">부산대점</option>
												<option value="6">사직점</option>
												<option value="7">영도점</option>
												<option value="8">덕천점</option>
												<option value="9">정관점</option>
												<option value="10">사상점</option>
											</select> 
										</div>
									</td>
									<td>
										<div>
											<select id="screenSelect" class="admin_moviePlan_search">
											</select> 
										</div>
									</td>
									<td>
										<div>
											<select id="movieSelect" name="movieSelect" class="admin_moviePlan_search">
												<c:forEach var="movie" items="${movieList}">
													<option value="${movie.movie_name}">${movie.movie_name}</option>
												</c:forEach>
											</select> 
										</div>
									</td>
									<td>
										<select name = "screen_dimension" class="admin_moviePlan_search">
											<option value="2D">2D</option>
											<option value="3D">3D</option>
										</select>
									</td>
									<td>
										<input type="date" class="admin_moviePlan_search" id="myDate" name="myDate" min="yyyy-mm-dd">
									</td>
									<td>
										<select id="hourSelect" class="admin_moviePlan_search">
											<c:forEach var="hour" begin="9" end="24">
											    <option value="${hour}:00">${hour}:00</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" id="movieEndTime" class="admin_moviePlan_search" readonly>
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
								<th>2D/3D</th>
								<th>상영날짜</th>
								<th>상영시간</th>
								<th>상영종료</th>
								<th>상영일정등록</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>서면점</td>
								<td>3관</td>
								<td>윙카</td>
								<td>2D</td>
								<td>2024-04-19</td>
								<td>09:00</td>
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
		<div>
		
		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>
	
	<script type="text/javascript">
		// 상영관리 상세보기
		function moviePlanEdit() {
			window.open("admin_moviePlan_form", "_self", "width=1000, height=800, top=100, left=400");
		}
		
		// 상영관리 삭제하기
		function moviePlanWithdraw() {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "admin_moviePlan_delete";
			}
		}
		
		// 오늘 이전 날짜 설정 disable 시키기
		var now = new Date();
	    var yyyy = now.getFullYear();
	    var mm = now.getMonth() + 1; // 0부터 시작하므로 1을 더함
	    var dd = now.getDate();
	    
	    if(mm < 10){
	        mm = '0' + mm;
	    }
	    if(dd < 10){
	        dd = '0' + dd;
	    }
	    var minDate = yyyy + '-' + mm + '-' + dd;
	    document.getElementById('myDate').setAttribute('min', minDate);
		
		// 극장 ajax
		$(document).ready(function() {
		    $('#theaterSelect').change(function() {
		        var theater_num = $("#theaterSelect").val();
		        $.ajax({
		            url: 'getScreens', // 상영관 정보를 가져오는 엔드포인트
		            method: 'GET',
		            data: { theater_num: theater_num },
		            dataType: 'json', // 전달 데이터 타입 json
		            success: function(response) {
		                $('#screenSelect').empty(); // 기존옵션 제거
		                // option 요소 생성하여 추가
		                $.each(response, function(index, screen_info){
		                	$('#screenSelect').append('<option value="' + screen_info.screen_num + '">' + screen_info.screen_cinema_num + '관</option>');
		                });
		            }
		        });
		    });
		        
		// 상영시간 ajax
		    $('#hourSelect').change(function() {
		        $.ajax({
		            url: 'movieEndTime', //  영화시간 정보를 가져오는 엔드포인트
		            method: 'GET',
		            data: { hourSelect: $("#hourSelect").val(),
		            		movieSelect: $('#movieSelect').val()
		           	},
		            dataType: '', // 전달 데이터 타입 json
		            success: function(response) {
		                $('#movieEndTime').empty(); // 기존옵션 제거
		                // option 요소 생성하여 추가
	                	$('#movieEndTime').val(response);
		            }
		        });
		    });
		        
	    });

	</script>
</body>
</html>