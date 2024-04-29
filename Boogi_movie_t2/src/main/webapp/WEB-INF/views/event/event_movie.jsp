<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
	main{
		width: 1400px;
		margin: 0 auto;
	}
</style>
</head>
<body>

	<header>
		<jsp:include page="/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>
			<div class="mp">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="theater-detail-info-tab" data-bs-toggle="tab" data-bs-target="#theater-detail-info" type="button" role="tab" aria-controls="theater-info" aria-selected="true">전체</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="theater-timetable-tab" data-bs-toggle="tab" data-bs-target="#theater-timetable" type="button" role="tab" aria-controls="theater-timetable" aria-selected="false">영화</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="theater-price-tab" data-bs-toggle="tab" data-bs-target="#theater-price" type="button" role="tab" aria-controls="messages" aria-selected="false">극장</button>					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="theater-price-tab" data-bs-toggle="tab" data-bs-target="#theater-price" type="button" role="tab" aria-controls="messages" aria-selected="false">할인/혜택</button>
					</li>
				</ul>
			</div>
			<!-- 극장 -->
			<div class="tab-content">
				<!-- 극장별 상세 정보탭 -->
				<div class="tab-pane active" id="theater-detail-info" role="tabpanel" aria-labelledby="theater-detail-info-tab" tabindex="0">
					<jsp:include page="/theater/theater_detail_info.jsp"></jsp:include>
				</div>
				<!-- 극장별 상영시간표 탭 -->	
				<div class="tab-pane" id="theater-timetable" role="tabpanel" aria-labelledby="theater-timetable-tab" tabindex="0">
					<jsp:include page="/theater/theater_detail_timetable.jsp"></jsp:include>
				</div>
				<!-- 극장별 관람료 탭(내용 고정) -->	
				<div class="tab-pane" id="theater-price" role="tabpanel" aria-labelledby="theater-price-tab" tabindex="0">
					<jsp:include page="/theater/theater_detail_price.jsp"></jsp:include>
				</div>
				<div class="tab-pane" id="theater-price" role="tabpanel" aria-labelledby="theater-price-tab" tabindex="0">
					<jsp:include page="/theater/theater_detail_price.jsp"></jsp:include>
				</div>
			</div>
	</main>

	<footer>
		<jsp:include page="/inc/admin_footer.jsp"></jsp:include>
	</footer>

</body>
</html>