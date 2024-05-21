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
.breakdown_pageArea {
	margin-top: 20px;
	text-align: center;
}

.breakdown_pageArea > nav {
	display: inline-block;
}

</style>
</head>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
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
							<button class="nav-link active" id="reservation-tab" data-bs-toggle="tab"
								data-bs-target="#reservation" type="button" role="tab" aria-controls="reservation"
								aria-selected="true">예매내역</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="cancel-tab" data-bs-toggle="tab"
								data-bs-target="#cancel" type="button" role="tab"
								aria-controls="cancel" aria-selected="false">취소내역</button>
						</li>
					</ul>
				</div><!-- 탭 -->
				
				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="reservation" role="tabpanel"aria-labelledby="reservation-tab">
						<c:forEach items="${movieReservation}" var="map" varStatus="loop" begin="0" end="3">
						    <div class="row">
						        <div class="col-md-3">
						        	<img src="${map.movie_poster}" style="margin-left: 30px" width="200px" height="250px">
						        </div>
						        <div class="paybox1 col-md-6">
						            <div class="col-md-4 d-grid gap-5">
						                <input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example" disabled readonly>
						                <input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example" disabled readonly>
						                <input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example" disabled readonly>
						            </div>
						            <div class="col-md-4 d-grid gap-5">
						                <input type="text" readonly class="form-control-plaintext" value="${map.movie_name}">
						                <input type="text" readonly class="form-control-plaintext" value="${map.scs_date}">
						                <input type="text" readonly class="form-control-plaintext" value="${map.theater_info}">
						            </div>
						            <div class="col-md-4 d-grid gap-5">
						                <input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example" disabled readonly>
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
					</div>
				</div><!-- 탭내용1 div끝 -->
				
				<!-- 내용2 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show" id="cancel" role="tabpanel"aria-labelledby="cancel-tab">
						<table class="table2 table table-hover" >
				  			<thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">구매 구분</th>
							      <th scope="col">구매 극장</th>
							      <th scope="col">적립일</th>
							      <th scope="col">적립</th>
							    </tr>
					  		</thead>
					  		<tbody>
					  		</tbody>
					  	</table>
				  	
							  	
<!-- 						<div class="row"> -->
<!-- 			<!-- 				<div class="col-md-2"> </div> --> 
<!-- 								탭 메뉴 -->
<!-- 							<div class="col-md-12"> -->
<!-- 							<hr> -->
<!-- 								<ul class="nav nav-tabs" id="cancel" role="tablist"> -->
<!-- 									<li class="nav-item" role="presentation"> -->
<!-- 										<button class="nav-link active" id="cancel-tab" data-bs-toggle="tab" -->
<!-- 											data-bs-target="#cancel" type="button" role="tab" aria-controls="cancel" -->
<!-- 											aria-selected="true">예매 취소 안내</button> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item" role="presentation"> -->
<!-- 										<button class="nav-link" id="cancel2-tab" data-bs-toggle="tab" -->
<!-- 											data-bs-target="#cancel2" type="button" role="tab" -->
<!-- 											aria-controls="cancel2" aria-selected="false">환불 규정 안내</button> -->
<!-- 									</li> -->
<!-- 								</ul> -->
							
<!-- 								내용 -->
<!-- 								<div class="tab-content" id="cancel"> -->
<!-- 									<div class="tab-pane fade show active" id="cancel" role="tabpanel"aria-labelledby="cancel-tab"> -->
<!-- 										<textarea class="textarea1" rows="13" cols="110" style="width: 100%" readonly> -->
					
<!-- 			신용카드 -->
<!-- 			결제 후 3일 이내 취소 시 승인 취소 가능, 3일 이후 매입 취소시 영업일 기준 3~5일 소요 -->
			
<!-- 			체크카드 -->
<!-- 			결제 후 3일 이내 취소 시 당일 카드사에서 환불처리. 3일 이후 매입 취소 시 카드사에 따라 3~10일 이내 카드사에서 환불 -->
			
<!-- 			휴대폰 결제 -->
<!-- 			결제 일자 기준 당월(1~말일)취소만 가능. 익월 취소 관련 문의는 CGV고객센터(1544-1122) 연락 요망 -->
<!-- 			예매취소 후 당일 환불이 원칙이나 현장 취소 시 경우에 따라 익일 처리 될 수 있음. -->
			
<!-- 			카카오페이 -->
<!-- 			카카오페이머니나 카카오포인트를 사용하신 경우 각각의 잔액으로 원복되며, 카드 결제를 하신 경우는 카드사 정책에 따라 -->
<!-- 			승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다. -->
			
<!-- 			PAYCO -->
<!-- 			PAYCO 쿠폰/포인트를 사용하신 경우 각각의 쿠폰/포인트로 원복되며 쿠폰의 경우 조건에 따라 재사용이 불가 할 수 있습니다. -->
<!-- 			카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다. -->
			
<!-- 			스마일페이 -->
<!-- 			스마일캐시를 사용하신 경우 스마일캐시로 원복되며, 카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며 -->
<!-- 			3일 이후 매입취소 시 영업일 기준 3~10일 소요됩니다. -->
			
<!-- 			NAVER Pay -->
<!-- 			NAVER Pay 포인트를 사용하신 경우 NAVER Pay 포인트로 원복되며, 카드사 결제를 하신 경우는 -->
<!-- 			카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다. -->
		
<!-- 			카카오톡 선물하기 복합상품 -->
<!-- 			카카오톡 선물하기 복합상품 (2인 PKG / 1인 PKG)은 매점쿠폰 사용 시, 예매 티켓 환불 불가. -->
<!-- 			※ 단, 매점 쿠폰 미 사용 시, 예매 티켓 환불 가능하며 재 예매 시, 새로운 매점 쿠폰 발급. -->
			
<!-- 			계좌이체 -->
<!-- 			1. 예매일 이후 7일 이내 취소 시 -->
<!-- 			- 자동 환불 은행: 취소 후 즉시 처리가능 -->
<!-- 			- 조흥, 신한, 외한, 한미, 우리, 우체국, 전북, 경남, 광주, 대구, 새마을, 제주 -->
<!-- 			- 우리은행의 경우 당일 취소분만 즉시 처리 가능 -->
<!-- 			- 수동 환불 은행: 농협(취소 후 2~3일 이내 입금), 부산/제일/우리(취소 후 3~5일 이내 입금) -->
			
<!-- 			2. 예매 7일 이후~상영시간 30분 전 취소 시(단, 일부 당일 취소 불가 행사의 경우 전일 취소 시) -->
<!-- 			- 환불은 환불 요청일로부터 7일 이상 소요됨 -->
			
<!-- 			※ 기타 환불 관련 문의는 고객센터 1544-1122로 연락바랍니다. -->
<!-- 										</textarea> -->
<!-- 									</div>tab-pane -->
<!-- 									<div class="tab-pane fade" id="cancel2" role="tabpanel"aria-labelledby="cancel2-tab"> -->
<!-- 										<textarea class="textarea1" rows="13" cols="110" style="width: 100%" readonly> -->
								
<!-- 			현장 취소를 하는 경우 -->
<!-- 			상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다. -->
			
<!-- 			홈페이지에서 예매 취소할 경우 -->
<!-- 			부분 취소는 불가능합니다. (ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능) -->
<!-- 			홈페이지 예매 취소는 상영시간 20분전까지 가능합니다.(단, 씨네&포레관, 씨네&리빙룸, SUITE CINEMA 제외) -->
<!-- 			상영시간 이후 취소나 환불은 되지 않습니다 -->
			
<!-- 			모바일 앱/웹(m.cgv.co.kr)에서 예매 취소할 경우 -->
<!-- 			부분 취소는 불가합니다.(ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능) -->
<!-- 			모바일 앱/웹 예매 취소는 상영시간 15분전까지 가능합니다.(단, 씨네&포레관, 씨네&리빙룸, SUITE CINEMA 제외) -->
<!-- 			상영시간 이후 취소나 환불은 되지 않습니다. -->
			
<!-- 			단, 일부 행사의 경우 행사 당일 취소, 변경 불가 합니다. -->
								
<!-- 										</textarea>		 -->
<!-- 									</div>tab-pane  -->
<!-- 								</div>tab-content -->
<!-- 							</div>col-md-9 -->
<!-- 						</div>row 두번째 줄 -->
				  	</div>
				</div> <!-- 취소 탭 내용 끝 -->
				
				
				<!-- 페이징 시작 -->
				<div class="breakdown_pageArea">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" > 
								<a class="page-link" href="myp_reservation?pageNum=${pageNum - 1}" aria-label="Previous" >
								<span aria-hidden="true" >&laquo;</span>
								</a>
							</li>
							<c:forEach var="i" begin="${pageList.startPage}" end="${pageList.endPage}">
								<c:choose>
									<c:when test="${pageNum eq i }">
										<li class="page-item active"><a class="page-link">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="myp_reservation?pageNum=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
								<a class="page-link" href="myp_reservation?pageNum=${pageNum + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
				<!-- 페이징 끝 -->
			</div><!-- col-md-9 box-in -->
		</div> <!-- row -->
	</div><!-- container2 -->
</div><!-- container -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">

</body>
</html>