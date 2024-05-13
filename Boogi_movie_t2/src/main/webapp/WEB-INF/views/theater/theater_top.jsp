<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<div class="theater_top">
		<nav class="nav justify-content-center theater_name">	
			<c:forEach var="theater" items="${theaterList}">
				<a class="nav-link" href="theater_detail?theater_num="${${theater.theater_num}>${theater.theater_name}</a>
			</c:forEach>
			 <div class="dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MY 극장</a>
				<ul class="dropdown-menu">
					 <c:choose>
					 	<c:when test="${empty sId}"> <!-- 비로그인 상태 -->
							<li><input type="button" class="btn" value="로그인하기" onclick="location.href='member_login'"></li>
					 	</c:when>
					 	<c:otherwise> <!-- 로그인 상태 -->
							<!-- 나의극장 관리 모달 버튼 -->
							<li><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
								<img src="${pageContext.request.contextPath}/resources/images/set.svg"> MY 극장 관리</button>
							</li>
							<!-- 체크된 MY극장 리스트 / my -->
							<li><a class="dropdown-item" href="#">정관점</a></li>
							<li><a class="dropdown-item" href="#">서면점</a></li>
					 	</c:otherwise>
					 </c:choose>
				</ul>
			</div>
		</nav>
				
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">MY 극장 관리</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<c:forEach var="theater" items="${theaterList}">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="haeundae" id="${theater.theater_num}">
								<label class="form-check-label" for="${theater.theater_num}">${theater.theater_name}</label>
							</div>
						</c:forEach>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">저장</button>
	      			</div>
				</div>
	  		</div>
	  	</div> <!-- 모달 끝 -->
	</div><!-- theater_top 끝 -->



</body>
</html>