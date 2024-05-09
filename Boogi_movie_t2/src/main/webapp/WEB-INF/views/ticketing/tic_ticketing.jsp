<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 사이트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/tic_ticketing.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<!-- 예매 메인 -->
<body>
<!-- 현재날짜와 이번달 최대일수를 계산하여 출력 -->
<%
	LocalDate currentDate = LocalDate.now();
	int maxDay = currentDate.lengthOfMonth();
	int nowDay = currentDate.getDayOfMonth();
	int inputDay = nowDay + 10;
	pageContext.setAttribute("nowDay", nowDay);
	pageContext.setAttribute("day", inputDay > maxDay ? maxDay : inputDay);
	pageContext.setAttribute("currentDate", currentDate);
	
%>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<form action="tic_choose_seat" method="post">
<section class="tic_main">
	<div class="tic_title">
		<h3>영화 예매</h3>
			<hr>
	</div>
	<div class="row asdf">
		
		<!-- 본문 시작 -->
		
		<div class="col-md-12">

			<div class="row tic_row">
			<!-- tic_movie영역 시작 -->
				<div class="col-md-3 tic" style="padding-left: 20px; padding-right: 20px;">
					<div class="tic_movie">	
					<!-- 설명영역 -->
						<div class="explain" id="movieSelected">
							영화를 선택해주세요
						</div>
					<!-- select박스 -->
					<div class="row">
					        <select id ="movieOrderby" class="form-select form-select-lg mb-3 col-md-2" style="width: 100px; height: 35px; font-size: 13px; margin-right : 100px;">
					          <option value="Like">예매순</option>
					          <option value="Abc">가나다순</option>
					        </select>
					        
					        <div class="col-md-4">
								<input type="checkbox" name="like_movie" value="나의취향" class="col-md-3">내취향
							</div>
					</div>
					<!-- 영화정보 -->
					<div class="movielist scroll" id="movielist">
						<c:forEach items="${movieList }" var="movie">
							<div class="movie_atrbt">
								<c:choose>
									<c:when test="${movie.movie_grade eq 'ALL' }">
										<img src="${pageContext.request.contextPath}/resources/images/tic_icon_all.gif" style="width : 48px; height : 48px;">
									</c:when>
									<c:when test="${movie.movie_grade eq '12세' }">
										<img src="${pageContext.request.contextPath}/resources/images/tic_icon_over12.gif" style="width : 48px; height : 48px;">
									</c:when>
									<c:when test="${movie.movie_grade eq '15세' }">
										<img src="${pageContext.request.contextPath}/resources/images/tic_icon_over15.gif" style="width : 48px; height : 48px;">
									</c:when>
									<c:when test="${movie.movie_grade eq '19세' }">
										<img src="${pageContext.request.contextPath}/resources/images/tic_icon_over19.gif" style="width : 48px; height : 48px;">
									</c:when>
								</c:choose>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>
										<a onclick="javascript:movieClick('${movie.movie_name}')">
											${movie.movie_name}
										</a>
									</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- tic_movie종료 -->
			
				<!-- tic_theater 시작 -->
				<div class="col-md-3 tic" style="padding-left: 20px; padding-right: 20px;">
					<div class="tic_theater">
						<!-- 설명영역 -->
						<div class="explain" id="theaterSelected">
							상영관을 선택해주세요
						</div>
						<div class="row list">
							<!-- theater 리스트1 -->
							<div class="col-sm-6" style="border-right: solid 3px black; text-align: left;">
								<ul>
									<li><a>전체극장</a></li>
								</ul>	
								
								<ul>
									<li><a>MY영화관</a></li>
								</ul>
							</div>
								
								
								
							<!-- theater 리스트2 -->
							<!--  -->
							<div class="col-sm-6 theaterlist scroll">
								<c:forEach items="${theaterList }" var="theater">
									<ul>
										<li><a onclick="javascript:theaterClick('${theater.theater_name}')">${theater.theater_name }</a> </li>
									</ul>	
								</c:forEach>
							</div>		

						</div>
					</div>
				</div>	
				<!-- tic_theater 종료 -->
				
				<!-- tic_final 시작 -->
				<div class="col-md-6 tic" style="padding-left: 20px; padding-right: 20px;">
					<div class="tic_final">
						<!-- 설명영역 -->
						<div class="explain">
							${currentDate }
						</div>
							<div class="finallist">
							




					
								<div class="daylist scroll">
									<div>
										<c:forEach begin="${nowDay }" var="i" end="${day}"> 
										
											<button>${i }일</button>&nbsp;
										</c:forEach>
									</div>
								</div>
								<div class="finalmovielist scroll">
									<div style="height : 300px">

										영화관 과 상영관 을 선택해주세요
<%-- 										<c:forEach var="i" begin="1" end="20"> --%>
									
<%-- 										이용가영역 || 영화제목${i }<br> --%>
<!-- 										영화관정보 || 영화관정보 || 영화관정보 || -->
<!-- 										영화관정보 || 영화관정보 || 영화관정보 || -->
									
<%-- 										</c:forEach> --%>
								</div>
								</div>
							</div>
					</div>
					<!-- tic_final 종료 -->
				</div>
			</div>
		</div>
	</div>
		<!-- tic_row 종료 -->
	<div class="tic_button">
		<button type="submit" class="btn btn-outline-primary">좌석 선택</button>
	</div>
	
</section>
</form>				
			
		
		


<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
<script>
	function movieClick(movie_name){
		var result = $("#movieSelected");
		
		result.empty();
		result.append(movie_name);
	} 
	
	function theaterClick(theater_name){
		var result = $("#theaterSelected");
		
		result.empty();
		result.append(theater_name);
	} 
	
	function getGradeIcon(grade) {
        var contextPath = "${pageContext.request.contextPath}";
        switch (grade) {
            case "ALL":
                return "<img src='" + contextPath + "/resources/images/tic_icon_all.gif' style='width: 48px; height: 48px;'>";
            case "12세":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over12.gif' style='width: 48px; height: 48px;'>";
            case "15세":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over15.gif' style='width: 48px; height: 48px;'>";
            case "19세":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over19.gif' style='width: 48px; height: 48px;'>";
            default:
                return "";
        }
    }
	
	
	function loadMovies(orderBy) {	
		$.ajax({
            url: "api/movie" + orderBy,
            method: "GET",
            dataType: "json",
            success: function (response) {
            	var result = $("#movielist");
                result.empty();
                response.forEach(function (movie) {
                    var movieDiv = "<div class='movie_atrbt'>"
                        + getGradeIcon(movie.movie_grade)
                        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<span>"
                        + "<a onclick='movieClick(\"" + movie.movie_name + "\")'>" + movie.movie_name + "</a>"
                        + "</span>"
                        + "</div>";

                    result.append(movieDiv);
                });
            },
            error: function () {
                alert("영화 정보를 가져오는 데 실패했습니다.");
            }
        });
	}
	
	
	$(document).ready(function () {	
		 $("#movieOrderby").change(function () {
             var orderBy = $(this).val();
             loadMovies(orderBy);
		});
	});	
		
</script>
</body>
</html>


	
	