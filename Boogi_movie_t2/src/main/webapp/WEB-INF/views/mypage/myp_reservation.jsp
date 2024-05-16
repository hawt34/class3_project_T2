<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_reservation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
body { 
	font-family: "Noto Sans KR", sans-serif; 
	font-optical-sizing: auto;
	font-weight: 400;
	font-style: normal;
	
}
hr{
	margin-top: 10px;
}


</style>
</head>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
			<div class="col-md-2 box1">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div><!-- sidebar1 -->
				<!-- 탭 메뉴 -->
				<!-- 내용 -->
			<div class="col-md-9 box-in">
				<div class="row">
					<div class="col-10">
						<h2>예매내역</h2>
					</div> <!-- col-10 -->
					<hr>
				</div><!--  하위 row -->
				<div class="box2">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
								data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
								aria-selected="true">예매내역</button>
						</li>
					</ul>
				</div>
<!-- 				<div class="row"> -->
<%-- 				<c:forEach var="j" begin="1" end="4"> --%>
<%-- 				</c:forEach> --%>
<%-- 					<c:forEach var="i" begin="1" end="4"> --%>
<!-- 						<div class="col-md-3"> 첫번째 사진 -->
<%-- 								<img src="${pageContext.request.contextPath}/resources/images/myp_img1.jpg" style="margin-left: 30px" width="200px" height="250px"> --%>
<!-- 						</div>	 -->
<!-- 						<div class="col-md-2 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
						
<!-- 						<div class="col-md-2 d-grid gap-5"> -->
<%-- 						<c:forEach var="map" items="${movieReservation}" begin="1" end="4"> --%>
<%-- 							<input type="text" readonly class="form-control-plaintext" value="${map.ticket_reservation_date}"> --%>
<%-- 							<input type="text" readonly class="form-control-plaintext" value="${map.ticket_seat_info}"> --%>
<%-- 							<input type="text" readonly class="form-control-plaintext" value="${map.ticket_price}"> --%>
						
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 						<div class="col-md-2 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
					
<!-- 						<div class="col-md-2 d-grid gap-5"> -->
<%-- 						<c:forEach var="movie" items="${movieReservation}" begin="0"> --%>
<%-- 							<input type="text" readonly class="form-control-plaintext" value="${moive.movie_name }"> --%>
<!-- 							<input type="text" readonly class="form-control-plaintext" value="좌석"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="금액"> -->
						
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 					<hr> -->
<%-- 					</c:forEach> --%>
<!-- 					<div class="paybox1 col-md-6" > -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
						
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<%-- 						<c:forEach var="movie" items="${movieReservation}" begin="0"> --%>
<%-- 							<input type="text" readonly class="form-control-plaintext" value="${moive.movie_name }"> --%>
<!-- 							<input type="text" readonly class="form-control-plaintext" value="2024 / 04 / 24"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="서면 8관"> -->
						
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="17:00 ~ 19:20"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="F9"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="12,000원"> -->
<!-- 						</div> -->
<!-- 					</div> paybox1 첫번째 예매칸 -->
					
					
<!-- 				</div>row -->
<!-- 				<hr> -->

<c:forEach items="${movieReservation}" var="map">
    <div class="row">
        <div class="col-md-3">
        	<img src="${map.movie_poster }" style="margin-left: 30px" width="200px" height="250px">
        </div>
        <div class="paybox1 col-md-6">
            <div class="col-md-4 d-grid gap-5">
                <input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example" disabled readonly>
                <input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example" disabled readonly>
                <input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example" disabled readonly>
            </div>
            <div class="col-md-4 d-grid gap-5">
                <input type="text" readonly class="form-control-plaintext" value="${map.movie_name}">
                <input type="text" readonly class="form-control-plaintext" value="${map.scs_date}">
                <input type="text" readonly class="form-control-plaintext" value="${map.theater_info}">
            </div>
            <div class="col-md-4 d-grid gap-5">
                <input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example" disabled readonly>
                <input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example" disabled readonly>
                <input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example" disabled readonly>
            </div>
            <div class="col-md-4 d-grid gap-5">
                <input type="text" readonly class="form-control-plaintext" value="${map.session_time}">
                <input type="text" readonly class="form-control-plaintext" value="${map.ticket_seat_info}">
                <input type="text" readonly class="form-control-plaintext" value="${map.ticket_price}">
            </div>
        </div>
    </div>
    <hr>
</c:forEach>
<!-- 				<div class="row">두번째 사진 -->
<!-- 					<div class="col-md-3"> -->
<%-- 						<img src="${pageContext.request.contextPath}/resources/images/myp_img2.jpg" style="margin-left: 30px" width="200px" height="250px"> --%>
<!-- 					</div>	 -->
<!-- 					<div class="paybox1 col-md-6"> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="쿵푸팬더"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="2024 / 04 / 20"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="아시아드 1관"> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="18:40 ~ 20:20"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="H9 H10"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="24,000원">	 -->
<!-- 						</div> -->
<!-- 					</div> paybox1 첫번째 예매칸	 -->
<!-- 				</div>row -->
<!-- 				<hr> -->
<!-- 				<div class="row">세번째 사진 -->
<!-- 					<div class="col-md-3"> -->
<%-- 						<img src="${pageContext.request.contextPath}/resources/images/myp_img3.jpg" style="margin-left: 30px" width="200px" height="250px"> --%>
<!-- 					</div>	 -->
<!-- 					<div class="paybox1 col-md-6"> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="듄2"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="2024 / 03 / 18"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="서면 4관"> -->
<!-- 						</div> -->
					
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example " disabled readonly > -->
<!-- 							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly> -->
<!-- 							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4 d-grid gap-5"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="19:30 ~ 22:50"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="G16"> -->
<!-- 							<input type="text" readonly class="form-control-plaintext" value="18,000원">	 -->
<!-- 						</div> -->
<!-- 					</div>paybox1 첫번째 예매칸 	 -->
<!-- 				</div>row -->
<!-- 				<hr> -->
<!-- 					<div class="row">네번째 사진 -->
<!-- 						<div class="col-md-3"> -->
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/myp_img4.jpg" style="margin-left: 30px" width="200px" height="250px"> --%>
<!-- 						</div>	 -->
<!-- 						<div class="paybox1 col-md-6"> -->
<!-- 							<div class="col-md-4 d-grid gap-5"> -->
<!-- 								<input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example " disabled readonly > -->
<!-- 								<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly> -->
<!-- 								<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-4 d-grid gap-5"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="파묘"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="2024 / 03 / 10"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="삼정타워 11관"> -->
<!-- 							</div> -->
						
<!-- 							<div class="col-md-4 d-grid gap-5"> -->
<!-- 								<input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example " disabled readonly > -->
<!-- 								<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly> -->
<!-- 								<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-4 d-grid gap-5"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="20:20 ~ 22:50"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="K13 K14 K15"> -->
<!-- 								<input type="text" readonly class="form-control-plaintext" value="36,000원"> -->
<!-- 							</div> -->
<!-- 						</div> paybox1 첫번째 예매칸	 -->
<!-- 					</div>row -->
<!-- 				<hr> -->
<!-- 			</div>col-md-10 -->
<!-- 		</div>row box1 -->
	</div><!-- container2 -->
</div> <!-- container -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">

</body>
</html>