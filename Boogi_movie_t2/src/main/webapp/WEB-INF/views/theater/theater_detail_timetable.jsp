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

<script type="text/javascript">
	$(function() {
		
	    let tabs = document.querySelectorAll('.time_schedule_day');
	    tabs.forEach(function(tab) {
	        tab.addEventListener('click', function() {
	            // 이전에 선택된 탭의 배경색 제거
	            tabs.forEach(function(tab) {
	                tab.style.backgroundColor = ''; // 기본 배경색으로 초기화
	            });

	            // 현재 클릭된 탭에 배경색 적용
	            this.style.backgroundColor = '#f0f0f0'; // 선택된 탭의 배경색
	        });
	    });
		
	    
	    $('.day_list').on('click', function() {
	        // 클릭된 링크의 id 가져오기
	        let scs_date = $(this).attr('id');
	        console.log('클릭된 링크의 id:', scs_date);
	        console.log('theater_num : ', ${param.theater_num});
	        
	        $.ajax({
	        	url : "timetable",
	        	type : "POST",
	        	data : {
	        		theater_num : "${param.theater_num}",
	        		scs_date : scs_date
	        	},
	        	dataType : "json",
	        	success : function(result) {
					if(result) {
						
		        		alert("result : "  + result);
					}
	        		
	        		
	        		
	        		
	        		
				},
				error : function() {
					alert("AJAX 에러 발생!");
				}
	        	
	        
	        	
	        	
	        });
	        
	        
	        
	        
	        
	    });
	    
	    
	    
	    
	    
		
	});

</script>
</head>
<body>
	<article>
		<div class="theater_timetable_all" >
			<h4>상영시간표</h4>
			<div class="time_schedule">
				<ul class="nav nav-underline nav-pills nav-fill">
					<li class="nav-item time_schedule_day">
						<a class="nav-link day_list_move text-black" href="#"><img src="${pageContext.request.contextPath}/resources/images/chevron-left.svg"></a>
					</li>
					<!-- 오늘 버튼 -->
					<li class="nav-item time_schedule_day ">
						<%
	                    java.util.Calendar cal = java.util.Calendar.getInstance();
	                    java.text.SimpleDateFormat sdf_date = new java.text.SimpleDateFormat("MM/dd");
	                    java.text.SimpleDateFormat sdf_day = new java.text.SimpleDateFormat("E");
	                    java.text.SimpleDateFormat sdf_id = new java.text.SimpleDateFormat("yyyy-MM-dd");
	                    String date = sdf_date.format(cal.getTime());
	                    String day = sdf_day.format(cal.getTime());
	                    String id = sdf_id.format(cal.getTime());
	                	%>
						<a class="nav-link day_list text-black" aria-current="page" id="<%= id %>">
							<%= date %><br>오늘
						</a>
					</li>
					<!-- 내일 버튼 -->
					<li class="nav-item time_schedule_day">
						<%
	                    cal.add(java.util.Calendar.DAY_OF_MONTH, 1);
	                    String tomorrow_date = sdf_date.format(cal.getTime());
	                    String tomorrow_day = sdf_day.format(cal.getTime());
	                    String tomorrow_id = sdf_id.format(cal.getTime());
	                	%>
						<a class="nav-link day_list text-black" id="<%= tomorrow_id %>">
							<%= tomorrow_date %><br>내일
						</a>
					</li>
					<%-- 나머지 날짜 버튼들에 월과 일 출력 --%>
		            <% 
		                for(int i = 2; i < 15; i++) {
		                    cal.add(java.util.Calendar.DAY_OF_MONTH, 1);
		                    String future_date = sdf_date.format(cal.getTime());
		                    String future_day = sdf_day.format(cal.getTime());
		                    String future_id = sdf_id.format(cal.getTime());
		            %>
		            
					<!-- 이후 날짜 -->
					<li class="nav-item time_schedule_day">
						<a class="nav-link day_list text-black" id="<%=future_id%>">
							<%= future_date %><br><%= future_day %>
						</a>
					</li>
					<% } %>
					<li class="nav-item time_schedule_day">
						<a class="nav-link day_list_move text-black" href="#">
							<img src="${pageContext.request.contextPath}/resources/images/chevron-right.svg">
						</a>
					</li>
				</ul>
			</div> <!-- time_schedule 끝 -->
			
			 
			
			<div class="timetable">
				<div class="timetable_movie">
					<div class="timetable_movie_area">
					<div class="row">
						<div class="col">
						  (등급 이미지), 영화제목
						</div>
						<div class="col">
						   상영시간  (러닝타임) 분
						</div>
					</div>
					</div>
					<div class="timetable_booth_area">
						<div class="row">
							<div class="col">
								<div class="timetable_cinema"><h5>상영관 이름</h5>남은 좌석 총 N 석</div>
							</div>
							<div class="col">
								<div class="timetable_dimension">2D/3D</div>
								<div class="timetable_scs">시작시간, 남은 좌석</div>
							</div>	
						</div>
					</div>
				</div><!-- timetable_movie -->
				
			</div>
			<div>
				<fieldset id="timetable_info" >
					<ul>
						<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
						<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
					</ul>
				</fieldset>
			</div>
			
		</div>
	</article>	
	
	
	
	


</body>
</html>


