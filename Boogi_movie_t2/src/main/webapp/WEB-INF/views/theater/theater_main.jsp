<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<!-- 카카오맵 API 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

</head>

<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
	<h1>전체 극장</h1>
	<hr>
	<div class="theater_all">
	
		<jsp:include page="thaeter_top.jsp"></jsp:include>
		
		<div class="theater_map">
		
			<div id="map" style="width:70%; height:400px; margin: auto;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b60a9d61c7090ce24f1b5bfa7ab26622"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(35.180355, 129.074238), // 지도의 중심좌표
			        level: 9 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [
			    {
			        title: '부기무비 해운대점', 
			        latlng: new kakao.maps.LatLng(35.1629768, 129.158492)
			    },
			    {
			        title: '부기무비 센텀점', 
			        latlng: new kakao.maps.LatLng(35.1629768, 129.158492)
			    },
			    {
			        title: '부기무비 서면점', 
			        latlng: new kakao.maps.LatLng(35.1542604, 129.0572997)
			    },
			    {
			        title: '부기무비 남포점',
			        latlng: new kakao.maps.LatLng(35.0986158, 129.0287567)
			    },
			    {
			        title: '부기무비 부산대점',
			        latlng: new kakao.maps.LatLng(35.2301093, 129.0881162)
			    },
			    {
			        title: '부기무비 사직점',
			        latlng: new kakao.maps.LatLng(35.1909044, 129.0614196)
			    },
			    {
			        title: '부기무비 영도점',
			        latlng: new kakao.maps.LatLng(35.0622864, 129.0075247)
			    },
			    {
			        title: '부기무비 덕천점',
			        latlng: new kakao.maps.LatLng(35.2111693, 129.0075247)
			    },
			    {
			        title: '부기무비 정관점',
			        latlng: new kakao.maps.LatLng(35.3194331, 129.1783546)
			    },
			    {
			        title: '부기무비 사상점',
			        latlng: new kakao.maps.LatLng(35.1633264, 128.9819712)
			    }
			];
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "${pageContext.request.contextPath}/resources/images/boogi_mark.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(52, 69); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			}
			</script>
					
		</div><!-- theater_map 끝 -->
		
		
		<!-- 극장 관련 이벤트 불러오기 -->
		<div class="theater_main_cont" id="theater-event">
			<div class="row">
				<div class="col-11">
					<h3>극장 이벤트</h3>
				</div>
				<div class="col">
					<a href="">더보기 
	      			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
					</svg></a>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="${pageContext.request.contextPath}/resources/images/theater_event_ex2.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/theater_event_ex1.jpg" style="width:100%;">
					</a>
				</div>
				<div class="col">
					<a href="${pageContext.request.contextPath}/resources/images/theater_event_ex2.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/theater_event_ex1.jpg" style="width:100%;">
					</a>
				</div>
			</div>
		</div>
		<!-- 극장 관련 공지사항 불러오기 -->
		<div class="theater_main_cont" id="theater-notice">
			<div class="row">
	    		<div class="col-11">
	     			<h3>극장 공지사항</h3>	
	   			</div>
	    		<div class="col">
	      			<a href="">더보기 
	      			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
					</svg></a>
	   			</div>
	   		</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col" width="">극장</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">해운대점</td>
						<td>Mark</td>
						<td>Otto</td>
					</tr>
					<tr>
						<td scope="row">서면점</td>
						<td>Jacob</td>
						<td>Thornton</td>
					</tr>
					<tr>
						<td scope="row">정관점</td>
						<td>Larry the Bird</td>
						<td>@twitter</td>
					</tr>
					<tr>
						<td scope="row">남포점</td>
						<td>Larry the Bird</td>
						<td>@twitter</td>
					</tr>
					<tr>
						<td scope="row">센텀점</td>
						<td>Larry the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>	
	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>

</body>
</html>


