<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>부기무비 극장 정보</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
		<div class="theater_detail_all">
<%-- 		<jsp:include page="theater_top.jsp"></jsp:include> --%>
<div class="theater_top">
		<nav class="nav justify-content-center theater_name">	
			<c:forEach var="theater" items="${theaterList}">
				<a class="nav-link top_theater_name" href="theater_detail?theater_num=${theater.theater_num}">${theater.theater_name}</a>
			</c:forEach>
			 <div class="dropdown">
				<a class="nav-link top_theater_name dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MY 극장</a>
				<ul class="dropdown-menu">
					 <c:choose>
					 	<c:when test="${empty sId}"> <!-- 비로그인 상태 -->
							<li><input type="button" class="btn" value="로그인하기" onclick="location.href='member_login'"></li>
					 	</c:when>
					 	<c:otherwise> <!-- 로그인 상태 -->
							<!-- 나의극장 관리 모달 버튼 -->
							<li><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal"  onclick="initializeModal()">
								<img src="${pageContext.request.contextPath}/resources/images/set.svg"> MY 극장 관리</button>
							</li>
							<!-- 체크된 MY극장 리스트 / member.member_my_theater1~3 -->
							<c:if test="${not empty member.member_my_theater1}">
								<li><a class="dropdown-item" href="#">${member.member_my_theater1}</a></li>
							</c:if>
							<c:if test="${not empty member.member_my_theater2}">
								<li><a class="dropdown-item" href="#">${member.member_my_theater2}</a></li>
							</c:if>
							<c:if test="${not empty member.member_my_theater3}">
								<li><a class="dropdown-item" href="#">${member.member_my_theater3}</a></li>
							</c:if>
					 	</c:otherwise>
					 </c:choose>
				</ul>
			</div>
		</nav>
		
		<form action="Mytheater" method="post">
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
									<input class="form-check-input" type="checkbox" value="${theater.theater_name}" id="${theater.theater_num}" onclick="CountChecked(this)">
									<label class="form-check-label" for="${theater.theater_num}">${theater.theater_name}</label>
								</div>
							</c:forEach>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" onclick="sendCheckedValues(event)">저장</button>
		      			</div>
					</div>
		  		</div>
		  	</div> <!-- 모달 끝 -->
	  	</form>
	</div><!-- theater_top 끝 -->

			
			<!-- 지점명 배너 -->
			<div class="theater_name_aera" style="position: relative; width: 100%; height: 200px; background-image: url('${pageContext.request.contextPath}/resources/images/theater_CINEMA4.jpg'); background-size: cover;">
		    	<div class="theater_name" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 24px; text-shadow: 1px 0 black;">
		    		<!-- 상단에서 클릭된 극장명 / theater_name -->
		    		<h1><b>${theater.theater_name}</b></h1>
		    	</div>
			</div>

			<!-- Nav tabs -->
			<div class="theater_detail_subtab">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link detail_tab active" id="theater-detail-info-tab" data-bs-toggle="tab" data-bs-target="#theater-detail-info" type="button" role="tab" aria-controls="theater-info" aria-selected="true">극장정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link detail_tab" id="theater-timetable-tab" data-bs-toggle="tab" data-bs-target="#theater-timetable" type="button" role="tab" aria-controls="theater-timetable" aria-selected="false">상영시간표</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link detail_tab" id="theater-price-tab" data-bs-toggle="tab" data-bs-target="#theater-price" type="button" role="tab" aria-controls="messages" aria-selected="false">관람료</button>
					</li>
				</ul>
			</div>
			<!-- 극장 -->
			<div class="tab-content">
				<!-- 극장별 상세 정보탭 -->
				<div class="tab-pane active" id="theater-detail-info" role="tabpanel" aria-labelledby="theater-detail-info-tab" tabindex="0">
					<jsp:include page="theater_detail_info.jsp"></jsp:include>
				</div>
				<!-- 극장별 상영시간표 탭 -->	
				<div class="tab-pane" id="theater-timetable" role="tabpanel" aria-labelledby="theater-timetable-tab" tabindex="0">
					<jsp:include page="theater_detail_timetable.jsp"></jsp:include>
				</div>
				<!-- 극장별 관람료 탭(내용 고정) -->	
				<div class="tab-pane" id="theater-price" role="tabpanel" aria-labelledby="theater-price-tab" tabindex="0">
					<jsp:include page="theater_detail_price.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>