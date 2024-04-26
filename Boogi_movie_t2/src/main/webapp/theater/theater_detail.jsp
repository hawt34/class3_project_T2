<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theater.css" type="text/css">

</head>
<body>
	<header>
		<%-- 상단 로그인 메뉴 영역 --%>
		<%-- inc/top.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
		<%-- <jsp:include> 태그에서 상대 주소 지정 시 / 는 webapp 디렉토리를 가리킴 --%>
	</header>
	<article>
		<div class="theater_detail_all">
			<div class="container text-center">
				<div class="col" id="col1">
			    	전체 극장
				</div>
			</div>
			<div class="container text-center">
		    	<div class="col" id="col2">
		    		<!-- 극장명 -->
		    		<h3>해운대점</h3>
		    	</div>
			</div>

			<!-- Nav tabs -->
			<div class="mp">
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
			</div>
		</div>
	</article>
	<footer>
		<%-- 하단 웹사이트 정보 영역 --%>
		<%-- inc/bottom.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
	</footer>
	

</body>
</html>