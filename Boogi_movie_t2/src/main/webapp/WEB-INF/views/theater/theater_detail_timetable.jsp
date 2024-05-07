<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="theater_timetable_all" >
		<h4>상영시간표</h4>
		<div class="time_schedule">
			<img src="${pageContext.request.contextPath}/resources/images/chevron-left.svg" width="15px;" class="time_schedule_day"> 
			<div class=time_schedule_day>오늘</div>
			<div class="time_schedule_day">내일</div>
			<div class="time_schedule_day">모레</div>
			<div class="time_schedule_day">글피</div>
			<div class="time_schedule_day">월</div>
			<div class="time_schedule_day">화</div>
			<div class="time_schedule_day">수</div>
			<div class="time_schedule_day">목</div>
			<div class="time_schedule_day">금</div>
			<div class="time_schedule_day">토</div>
			<div class="time_schedule_day">일</div>
			<img src="${pageContext.request.contextPath}/resources/images/chevron-right.svg" width="15px;" class="time_schedule_day"> 
			<img src="${pageContext.request.contextPath}/resources/images/calendar3.svg" width="15px;" class="time_schedule_day"> 
		</div>
		<div class="timetable">
			<div class= ></div>
			
		</div>
		
	</div>

</body>
</html>


