<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
<!-- 카카오맵 API 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
 <style>
	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

</head>

<body>
	<div class="theater-info">
		<h4>시설 안내</h4>
		<h5>보유 시설</h5>
		<div class="theater_facility_info">
			<img src="${pageContext.request.contextPath}/resources/images/theater_disabled.png" class="theater_facility_info_img">
			<img src="${pageContext.request.contextPath}/resources/images/theater_special_seat.png" class="theater_facility_info_img">
			<img src="${pageContext.request.contextPath}/resources/images/theater_screen.png" class="theater_facility_info_img">
		</div>
		<h5>층별 안내</h5>
		<h4>교통 안내</h4>
		<h5>약도</h5>
		<div class="theater-info_map">
			<div id="map" style="width:350px;;height:350px;"></div>
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b60a9d61c7090ce24f1b5bfa7ab26622&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				  mapOption = { 
				        center: new kakao.maps.LatLng(35.1629768 , 129.158492), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    };
	
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				var imageSrc = '${pageContext.request.contextPath}/resources/images/boogi_mark.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(52, 69), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(35.1629768, 129.158492); // 마커가 표시될 위치입니다
	
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				  position: markerPosition,
				  image: markerImage // 마커이미지 설정 
				});
	
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);  
	
				// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				var content = '<div class="customoverlay">' +
				    '    <span class="title">부기무비 해운대점</span>' +
				    '</div>';
	
				// 커스텀 오버레이가 표시될 위치입니다 
				var position = new kakao.maps.LatLng(35.1629768, 129.158492);  
	
				// 커스텀 오버레이를 생성합니다
				var customOverlay = new kakao.maps.CustomOverlay({
				    map: map,
				    position: position,
				    content: content,
				    yAnchor: 1 
				});
			</script>
		</div>	<!-- theater-info_map 끝 -->
		
		<h5>주차 안내</h5>
		
		<!-- 각 지점 공지사항 -->
		<div class="theater_main_cont" id="theater-notice">
			<div class="row">
	    		<div class="col-11">
					<h4>공지사항</h4>
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

</body>
</html>