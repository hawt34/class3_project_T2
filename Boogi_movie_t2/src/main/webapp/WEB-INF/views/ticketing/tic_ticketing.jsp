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

</head>

<!-- 예매 메인 -->
<body>


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
						<div class="explain">
							여기다 영화정보
						</div>
					<!-- select박스 -->
					        <select class="form-select form-select-lg mb-3" style="width: 100px; height: 35px; font-size: 13px;">
					          <option value="예매순">예매순</option>
					          <option value="가나다순">가나다순</option>
					          <option value="">나의 취향</option>
					        </select>
							<span class="focus"></span>
					<!-- 영화정보 -->
					<div class="movielist scroll">
						<c:forEach var="i" begin="1" end="30">
							<div class="movie_atrbt">
								<img src="${pageContext.request.contextPath}/resources/images/tic_ALL.png" style="width : 48px; height : 48px;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>영화제목</span>
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
						<div class="explain">
							여기다 상영관 정보
						</div>
						<div class="row list">
							<!-- theater 리스트1 -->
							<div class="col-sm-6" style="border-right: solid 3px black; text-align: left;">
								<ul>
									<li><a>MY영화관</a></li>
								</ul>
								<ul>
									<li><a>전체극장</a></li>
								</ul>	
							</div>
								
								
								
							<!-- theater 리스트2 -->
							<!--  -->
							<div class="col-sm-6 theaterlist scroll">
								<c:forEach var = "i" begin="1" end = "10">
									<ul>
										<li>영화관정보${i } </li>
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
							현재 선택한 날짜 예) 2024-04-17 (수)
						</div>
							<div class="finallist">
							
<!-- 현재날짜와 이번달 최대일수를 계산하여 출력 -->
<%
	LocalDate currentDate = LocalDate.now();
	int maxDay = currentDate.lengthOfMonth();
	int nowDay = currentDate.getDayOfMonth();
	pageContext.setAttribute("maxDay", maxDay);
	pageContext.setAttribute("nowDay", nowDay);
%>
										
								<div class="daylist scroll">
									<div>
										<c:forEach begin="${nowDay }" end="${maxDay }" var="i">
											<button>${i }일</button>&nbsp;
										</c:forEach>
									</div>
								</div>
								<div class="finalmovielist scroll">
									<div style="height : 300px">

							
										<c:forEach var="i" begin="1" end="20">
									
										이용가영역 || 영화제목${i }<br>
										영화관정보 || 영화관정보 || 영화관정보 ||
										영화관정보 || 영화관정보 || 영화관정보 ||
									
										</c:forEach>
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
</body>
</html>


	
	