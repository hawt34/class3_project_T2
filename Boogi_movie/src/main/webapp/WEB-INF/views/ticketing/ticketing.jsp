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
<link href="${pageContext.request.contextPath}/css/ticketing.css" rel="stylesheet" type="text/css" />

</head>

<!-- 예매 메인 -->
<body>
	<div class="container-xl">
		<div class="row">
			<div class="col-md-3 tic_movie">
				<div class="explain">
					여기다 영화정보
				</div>
				<div class="select_container list">
					<div class="select">
						<select id="standard-select">
							<option value="order_by_tic">예매순</option>
							<option value="order_by_abc">가나다순</option>
						</select>
						<span class="focus"></span>
					</div>
				</div>
				<div class="movielist scroll">
					<c:forEach var="i" begin="1" end="30">
						<div class="movie_atrbt">
							<img src="../images/ALL.png" style="width : 48px; height : 48px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>영화제목</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-3 tic_theater">
				<div class="explain">
					여기다 상영관 정보
				</div>
				<div class="row list">
					<div class="col" style="border-right: solid 3px black;">
						<ul>
							<li>MY영화관</li>
						</ul>
						<c:forEach var = "i" begin="1" end = "10">
							<ul>
								<li>지역정보${i } </li>
							</ul>	
						</c:forEach>
					</div>
					<div class="col theaterlist scroll">
						<c:forEach var = "i" begin="1" end = "40">
							<ul>
								<li>영화관정보${i } </li>
							</ul>	
						</c:forEach>
					</div>		
				</div>
			</div>	
			<div class="col-md-6 tic_final">
				<div class="explain">
					현재 선택한 날짜 예) 2024-04-17 (수)
				</div>
				<div class="finallist">
					<div class="daylist scroll">
						<c:forEach begin="2" end="30" var="i">
							<button>${i }일</button>&nbsp;
						</c:forEach>
					</div>
					<div class="finalmovielist scroll">
					<c:forEach var="i" begin="1" end="20">
						<div style="height : 300px">
							이용가영역 || 영화제목${i }<br>
							영화관정보 || 영화관정보 || 영화관정보 ||
							영화관정보 || 영화관정보 || 영화관정보 ||
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
</body>
</html>
	
	