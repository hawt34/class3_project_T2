<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>극장 정보</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>


</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
		<div class="theater_detail_all">
		
			<jsp:include page="thaeter_top.jsp"></jsp:include>
			
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
						<button class="nav-link active" id="theater-detail-info-tab" data-bs-toggle="tab" data-bs-target="#theater-detail-info" type="button" role="tab" aria-controls="theater-info" aria-selected="true">극장정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="theater-timetable-tab" data-bs-toggle="tab" data-bs-target="#theater-timetable" type="button" role="tab" aria-controls="theater-timetable" aria-selected="false">상영시간표</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="theater-price-tab" data-bs-toggle="tab" data-bs-target="#theater-price" type="button" role="tab" aria-controls="messages" aria-selected="false">관람료</button>
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