<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>


</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
		<div class="theater_detail_all">
			<div class="theater_top">
			<nav class="nav justify-content-center theater_name">
				 <a class="nav-link" href="#">해운대점</a>
				 <a class="nav-link" href="#">센텀점</a>
				 <a class="nav-link" href="#">서면점</a>
				 <a class="nav-link" href="#">남포점</a>
				 <a class="nav-link" href="#">부산대점</a>
				 <a class="nav-link" href="#">사직점</a>
				 <a class="nav-link" href="#">영도점</a>
				 <a class="nav-link" href="#">덕천점</a>
				 <a class="nav-link" href="#">정관점</a>
				 <a class="nav-link" href="#">사상점</a>
				 <div class="dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MY 극장</a>
					<ul class="dropdown-menu">
						 <!-- 비로그인 상태 -->
						<li><input type="button" class="btn btn-outline-primary btn-sm" value="로그인하기" onclick="location.href='member_login'"></li>
						<!-- 로그인 상태 -->
						<!-- 나의극장 관리 모달 버튼 -->
						<li><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
							<path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0"/>
							<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"/>
							</svg> MY 극장 관리</button>
						</li>
						<!-- 체크된 MY극장 리스트 -->
						<li><a class="dropdown-item" href="#">정관점</a></li>
						<li><a class="dropdown-item" href="#">서면점</a></li>
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
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check1">
								<label class="form-check-label" for="check1">해운대점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check2">
								<label class="form-check-label" for="check2">센텀점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check3">
								<label class="form-check-label" for="check3">서면점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check4">
								<label class="form-check-label" for="check4">남포점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check5">
								<label class="form-check-label" for="check5">부산대점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check6">
								<label class="form-check-label" for="check6">사직점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check7">
								<label class="form-check-label" for="check7">영도점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check8">
								<label class="form-check-label" for="check8">덕천점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check9">
								<label class="form-check-label" for="check9">정관점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check10">
								<label class="form-check-label" for="check10">사상점</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">저장</button>
		      			</div>
					</div>
		  		</div>
		  	</div> <!-- 모달 끝 -->
		</div><!-- theater_top 끝 -->
			<div class="container text-center">
		    	<div class="col col2">
		    		<!-- 상단에서 클린된 극장명 -->
		    		<h3>해운대점</h3>
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
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
</body>
</html>