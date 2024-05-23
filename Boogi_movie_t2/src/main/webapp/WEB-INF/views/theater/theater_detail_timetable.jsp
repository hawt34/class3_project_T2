<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

</head>
<body>
	<div class="theater_timetable_all" >
		<h4>상영시간표</h4>
		<div class="time_schedule">
			<nav aria-label="time_schedule_day">
				<ul class="pagination">
					<li class="page-item" id="previous_btn">
						<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
					</li>
					<!-- 오늘 버튼 -->
					<li class="page-item time_schedule_day">
						<%
	                    java.util.Calendar cal = java.util.Calendar.getInstance();
	                    java.text.SimpleDateFormat sdf_date = new java.text.SimpleDateFormat("MM/dd");
	                    java.text.SimpleDateFormat sdf_day = new java.text.SimpleDateFormat("E");
	                    String date = sdf_date.format(cal.getTime());
	                    String day = sdf_day.format(cal.getTime());
	                	%>
						<a class="page-link" href="#"><%= date %><br>오늘</a>
					</li>
					
					<!-- 내일 버튼 -->
					<li class="page-item time_schedule_day">
						<%
	                    cal.add(java.util.Calendar.DAY_OF_MONTH, 1);
	                    String tomorrow_date = sdf_date.format(cal.getTime());
	                    String tomorrow_day = sdf_day.format(cal.getTime());
	                	%>
						<a class="page-link" href="#"><%= tomorrow_date %><br>내일</a>
					</li>
						<%-- 나머지 날짜 버튼들에 월과 일 출력 --%>
		            <% 
		                for(int i = 2; i < 12; i++) {
		                    cal.add(java.util.Calendar.DAY_OF_MONTH, 1);
		                    String future_date = sdf_date.format(cal.getTime());
		                    String future_day = sdf_day.format(cal.getTime());
		            %>
					<li class="page-item time_schedule_day">
						<a class="page-link" href="#"><%= future_date %><br><%= future_day %></a>
					</li>
					<% } %>
					
					<li class="page-item" id="next_btn">
						<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
					</li>
				</ul>
			</nav> <!-- time_schedule_day 네브바 -->
		</div> <!-- time_schedule 끝 -->
<ul class="nav nav-underline">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>

</ul>		
		 

		
		<div class="timetable">
			<div class= ></div>
			
		</div>
		
	</div>
	
<script>

</script>

</body>
</html>


