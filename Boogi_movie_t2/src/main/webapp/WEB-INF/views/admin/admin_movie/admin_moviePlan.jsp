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

.admin_plan_head {
	margin: 50px 0;
}

.admin_plan_body {
	margin-bottom: 100px;
	margin-top: 100px;
}

.admin_moviePlan_search {
	height: 35px;
	width: 85%;
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
	width: 1200px;
}
.moviePlanSearchBox{
	width: 600px;
	text-align: center;
/* 	border: 5px solid skyBlue; */
	margin: 30px auto;
}
.moviePlanSearchBox > select{
	width: 200px;
	margin-right: 10px;
	margin-bottom: 20px;
}
.moviePlanSearchBox > input{
	width: 200px;
}
.moviePlanSearchBox > button{
	height: 40px;
	margin-bottom: 5px;
	margin-left: 10px;
}
.moviePlanSearchBox > h3{
	margin-top: 10px;
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
					<form action="admin_moviePlan_reg" method ="post">
						<table class="admin_plan_body_search">
							<thead>
								<tr>
									<th width="150px">극장</th>
									<th width="100px">상영관</th>
									<th width="200px">영화제목</th>
									<th width="80px">2D/3D</th>
									<th width="150px">상영날짜</th>
									<th width="100px">상영시간</th>
									<th width="100px">상영종료</th>
									<th width="100px">상영일정등록</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div>
											<select id="theaterSelect" class="admin_moviePlan_search" name="theater_num" required>
												<option value="">미선택</option>
											<c:forEach var="theaterName" items="${theaterNameList}">
												<option value="${theaterName.theater_num}">${theaterName.theater_name}</option>
											</c:forEach>
											</select> 
										</div>
									</td>
									<td>
										<div>
											<select id="screenSelect" class="admin_moviePlan_search" name="screen_cinema_num" required></select> 
										</div>
									</td>
									<td>
										<div>
											<select id="movieSelect" name="movie_num" class="admin_moviePlan_search" required>
												<option value="">영화선택</option>
												<c:forEach var="movie" items="${movieList}">
													<option value="${movie.movie_num}">${movie.movie_name}</option>
												</c:forEach>
											</select> 
										</div>
									</td>
									<td>
										<select name = "screen_dimension" class="admin_moviePlan_search" required>
											<option value="2D">2D</option>
											<option value="3D">3D</option>
										</select>
									</td>
									<td>
										<input type="date" class="admin_moviePlan_search" id="scs_date" name="scs_date" min="yyyy-mm-dd" required>
									</td>
									<td>
										<select id="hourSelect" name="scs_start_time" class="admin_moviePlan_search" required>
											<option value="">시간선택</option>
											<c:forEach var="hour" begin="9" end="24">
											    <option value="${hour}:00" >${hour}:00</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" id="movieEndTime" name="scs_end_time" class="admin_moviePlan_search" readonly>
									</td>
									<td>
										<button type="submit" class="btn btn-outline-primary">등록하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
					<form action="admin_moviePlan">
						<div class="moviePlanSearchBox">
							<h3>상영일정 조회하기</h3>
							<select id="searchTheater" class="admin_moviePlan_search" name="theater_num">
									<option value="0">미선택</option>
								<c:forEach var="theaterName" items="${theaterNameList}">
									<option value="${theaterName.theater_num}">${theaterName.theater_name}</option>
								</c:forEach>
							</select> 
							<input type="date" class="admin_moviePlan_search" name="scs_date" min="yyyy-mm-dd">
							<button type="submit" class="btn btn-outline-primary">조회하기</button>
						</div>
					</form>
					
					<table class="admin_plan_body_search">
						<thead>
							<tr>
								<th>상영번호</th>
								<th>극장</th>
								<th>상영관</th>
								<th>영화제목</th>
								<th>2D/3D</th>
								<th>상영날짜</th>
								<th>상영시간</th>
								<th>상영종료</th>
								<th>상영일정삭제</th>
							</tr>
						</thead>
						<tbody id="moviePlanList">
							<c:forEach var="moviePlan" items="${moviePlanList}">
								<tr>
									<td>${moviePlan.scs_num}</td>
									<td>${moviePlan.theater_name}</td>
									<td>${moviePlan.screen_cinema_num}</td>
									<td>${moviePlan.movie_name}</td>
									<td>${moviePlan.screen_dimension}</td>
									<td>${moviePlan.scs_date}</td>
									<td>${moviePlan.scs_start_time}</td>
									<td>${moviePlan.scs_end_time}</td>
									<td>
<%-- 										<button type="button" class="btn btn-outline-primary" onclick="moviePlanEdit(${moviePlan.scs_num})">수정</button> --%>
										<button type="button" class="btn btn-outline-primary" onclick="moviePlanWithdraw(${moviePlan.scs_num})">삭제</button>
									</td>
								</tr>
							</c:forEach>
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
		function moviePlanEdit(scs_num) {
			location.href = "admin_moviePlan_form?scs_num=" + scs_num;
		}
		
		// 상영관리 삭제하기
		function moviePlanWithdraw(scs_num) {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "admin_moviePlan_delete?scs_num=" + scs_num;
			}
		}
		
		// 오늘 이전 날짜 설정 disable 시키기
		var now = new Date();
		var year = now.getFullYear();
		var month = (now.getMonth() + 1).toString().padStart(2, '0');
		var day = now.getDate().toString().padStart(2, '0');
	    var minDate = year + '-' + month + '-' + day;
	    document.getElementById('scs_date').setAttribute('min', minDate);
		
		// 극장 ajax
		$(document).ready(function() {
			
			// 상영시간 제약조건 초기화
			function resetHourSelect() {
		         $('#hourSelect option').prop('disabled', false).css({"background": "", "color": ""});
		    }
	
			
			// 극장 선택시 상영관 선택
		    $('#theaterSelect').change(function() {
		        var theater_num = $("#theaterSelect").val();
		        $.ajax({
		            url: 'getScreens', // 상영관 정보를 가져오는 엔드포인트
		            method: 'GET',
		            data: { theater_num: theater_num },
		            dataType: 'json', // 전달 데이터 타입 json
		            success: function(response) {
		            	// 기존옵션 제거
		                $('#screenSelect').empty();
		                $('#scs_date').val("");
		                $('#movieSelect').val("");
		                $('#hourSelect').val("");
		                $('#movieEndTime').val("");
		                resetHourSelect();
		                // option 요소 생성하여 추가
	                	$('#screenSelect').append('<option value="">미선택</option>');
		                $.each(response, function(index, screen_info){
		                	$('#screenSelect').append('<option value="' + screen_info.screen_cinema_num + '">' + screen_info.screen_cinema_num + '관</option>');
		                });
		            }
		        });
		    });
			
			// 날짜 정보가 변할떄 코드 시작
			$('#scs_date').change(function(){
				let theaterSelect = $('#theaterSelect').val();
				let screenSelect = $('#screenSelect').val();
				let movieSelect = $('#movieSelect').val();
				let scs_date = $('#scs_date').val();
				
				if(theaterSelect == "" ){
					alert("극장정보를 선택해주세요");
					$('#scs_date').val("");
					$('#theaterSelect').focus();
					return;
				}
				if(screenSelect == "" ){
					alert("상영관을 선택해주세요");
					$('#scs_date').val("");
					$('#screenSelect').focus();
					return;
				}
				if(movieSelect == ""){
					alert("영화를 선택해주세요");
					$('#scs_date').val("");
					$('#movieSelect').focus();
					return;
				}
				
				resetHourSelect(); // 시간 선택 초기화
				
				// 상영 가능 시간 정보 ajax
				$.ajax({
					type: "GET",
					url: "moviePlan_time",
					data: {
						theaterSelect : theaterSelect,
						screenSelect : screenSelect,
						scs_date : scs_date,
					},
					success : function(data) {
						// 기존 옵션 비우기
						$('#hourSelect').val("");
						// 이미 일정이 있는 시간 disabled
		 				for(movieTime of data){
		 					for(let time = movieTime.scs_start_time; time < movieTime.scs_end_time; time++ ){
		 						$("#hourSelect option[value*='"+time+":00']").prop('disabled',true).css({"background": "lightgray", "color" : "white"});
		 					}
	 					}						
					},
					error : function() {
// 						alert("상영시간 선택 오류발생!");
					}
					
				});
				
			});
			
			// 상영시간 ajax
		    $('#hourSelect').change(function() {
		    	if($('#theaterSelect').val() == "" ){
					alert("극장정보를 선택해주세요");
					$('#hourSelect').val("");
					$('#theaterSelect').focus();
					return;
				}
		    	if($('#screenSelect').val() == "" ){
					alert("상영관을 선택해주세요");
					$('#scs_date').val("");
					$('#screenSelect').focus();
					return;
				}
				if($("#movieSelect").val() == ""){
					alert("영화를 선택해주세요");
					$('#hourSelect').val("");
					$('#movieSelect').focus();
					return;
				}
				if($("#scs_date").val() == ""){
					alert("상영날짜를 선택해주세요");
					$('#hourSelect').val("");
					$('#scs_date').focus();
					return;
				}
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
		    // theaterSelect, screenSelect 변경 시에도 hourSelect 초기화
	        $('#theaterSelect, #screenSelect').change(function() {
	            resetHourSelect(); // 시간 선택 초기화
	        });
		    
		    // 상영일정 조회하기
	        $('#searchBtn').click(function() {
		    	if($('#searchTheater').val() == "" ){
					alert("극장정보를 선택해주세요");
					$('#searchTheater').focus();
					return;
				}
		    	if($('#searchDate').val() == "" ){
					alert("상영날짜를 선택해주세요");
					$('#searchDate').focus();
					return;
				}
		    	
		    	
		    });
		    
			
	    });
		
	
	</script>
</body>
</html>