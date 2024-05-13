<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="theater_timetable_all" >
		<h4>상영시간표</h4>
		<div class="time_schedule">
			
			
			<div class=time_schedule_day>
				<button>
					<img src="${pageContext.request.contextPath}/resources/images/chevron-left.svg" width="15px;" class="time_schedule_day"> 
				</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button>오늘</button>
			</div>
			<div class=time_schedule_day>
				<button> 
					<img src="${pageContext.request.contextPath}/resources/images/chevron-right.svg" width="15px;" class="time_schedule_day">
				</button> 
			</div>
			<div class=time_schedule_day>
				<label for="calendar" class="time_schedule_day">
					<img src="${pageContext.request.contextPath}/resources/images/calendar3.svg" width="25px;" >
				</label>	
				<input type="date" id="calendar" style="display: none;" > 
			</div>
		</div> <!-- time_schedule 끝 -->
		<div class="timetable">
			<div class= ></div>
			
		</div>
		
	</div>

</body>
</html>


