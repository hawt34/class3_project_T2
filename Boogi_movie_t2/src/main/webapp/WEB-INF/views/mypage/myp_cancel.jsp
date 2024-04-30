<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_cancel.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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


</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
<div class="container1">
	<div class="container2">
		<div class="row box1">  
			<div class="col-md-2 sidebar1">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-10">
						<h2>취소내역 / 안내</h2>
					</div>
					<div class="col-2">						
						<select class="form-select form-select-sm" aria-label=".form-select-sm example">
								  <option selected>최근 1주일</option>
								  <option value="1">최근 1개월</option>
								  <option value="2">최근 3개월</option>
								  <option value="3">기간 설정</option>
						</select>
					</div><!-- col-2 -->
					<hr>
				</div><!-- row -->
				<!-- 탭 메뉴 -->
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"data-bs-target="#userinfo2" type="button" role="tab" 
							aria-controls="userinfo" aria-selected="true">취소한 영화 목록</button>
						</li>
					</ul>
				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="userinfo2" role="tabpanel" aria-labelledby="userinfo-tab">
						<table class="table2 table table-hover" >
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">영화</th>
						      <th scope="col">날짜</th>
						      <th scope="col">상영시간</th>
						      <th scope="col">상영관</th>
						      <th scope="col">인원정보</th>
						      <th scope="col">가격</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr  class="table-secondary">
						      <th scope="row">1</th>
							      <td>듄2</td>
							      <td>2024 / 04 / 16</td>
							      <td>17:00 ~ 19:20</td>
							      <td>서면 8관</td>
							      <td>1명 / H9</td>
							      <td>15,000원</td>
						    </tr>      
						    <tr>
						      <th scope="row">2</th>
						        <td>아바타3</td>
						        <td>2024 / 03 / 29</td>
						        <td>18:20 ~ 20:15</td>
						        <td>서면 3관</td>
						        <td>2명 / I9 I10</td>
						        <td>15,000원</td>
						    </tr>
						    <tr  class="table-secondary">
						      <th scope="row">3</th>
					            <td>토이스토리</td>
					            <td>2024 / 01 / 18</td>
					            <td>21:10 ~ 23:10</td>
					            <td>서면 2관</td>
					            <td>2명 / G13 G14</td>
					            <td>12,000원</td>
					         </tr>
							<tr>
						      <th scope="row">4</th>
								<td>파묘</td>
			          			<td>2024 / 03 / 18</td>
			            		<td>12:10 ~ 14:30</td>
			           			<td>아시아드 1관</td>
			           			<td>3명 / J9 J10 J11</td>
			            		<td>12,000원</td>
			          		</tr>
			          		<tr  class="table-secondary">
						      <th scope="row">5</th>
						      	<td>폴라익스프레스</td>
				              	<td>2013 / 12 / 25</td>
								<td>21:00 ~ 23:10</td>
				            	<td>아시아드 5관</td>
				            	<td>2명 / K14 K15</td>
				            	<td>9,000원</td>
			         		</tr>
			          		<tr>
						      <th scope="row">6</th>
			          			<td>엘리멘탈</td>
			            		<td>2023 / 10 / 29</td>
					            <td>19:35 ~ 22:10</td>
					            <td>삼정타워 11관</td>
					            <td>1명 / H15</td>
					            <td>12,000원</td>
					          </tr>
						  </tbody>
						</table>
					</div><!-- 첫번째 탭 -->
				</div><!--  tab-content -->
			</div><!-- col-md-10 -->
		</div><!-- row 첫번째 줄-->
			<div class="row ">
				<div class="col-md-2"> </div>
					<!-- 탭 메뉴 -->
				<div class="col-md-10">
				<hr>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
								data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
								aria-selected="true">예매 취소 안내</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
								data-bs-target="#myreview" type="button" role="tab"
								aria-controls="myreview" aria-selected="false">환불 규정 안내</button>
						</li>
					</ul>
				
					<!-- 내용 -->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="userinfo" role="tabpanel"aria-labelledby="userinfo-tab">
							<textarea class="textarea1" rows="13" cols="110" readonly>
					
			신용카드
			결제 후 3일 이내 취소 시 승인 취소 가능, 3일 이후 매입 취소시 영업일 기준 3~5일 소요
			
			체크카드
			결제 후 3일 이내 취소 시 당일 카드사에서 환불처리. 3일 이후 매입 취소 시 카드사에 따라 3~10일 이내 카드사에서 환불
			
			휴대폰 결제
			결제 일자 기준 당월(1~말일)취소만 가능. 익월 취소 관련 문의는 CGV고객센터(1544-1122) 연락 요망
			예매취소 후 당일 환불이 원칙이나 현장 취소 시 경우에 따라 익일 처리 될 수 있음.
			
			카카오페이
			카카오페이머니나 카카오포인트를 사용하신 경우 각각의 잔액으로 원복되며, 카드 결제를 하신 경우는 카드사 정책에 따라
			승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
			
			PAYCO
			PAYCO 쿠폰/포인트를 사용하신 경우 각각의 쿠폰/포인트로 원복되며 쿠폰의 경우 조건에 따라 재사용이 불가 할 수 있습니다.
			카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
			
			스마일페이
			스마일캐시를 사용하신 경우 스마일캐시로 원복되며, 카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며
			3일 이후 매입취소 시 영업일 기준 3~10일 소요됩니다.
			
			NAVER Pay
			NAVER Pay 포인트를 사용하신 경우 NAVER Pay 포인트로 원복되며, 카드사 결제를 하신 경우는
			카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
		
			카카오톡 선물하기 복합상품
			카카오톡 선물하기 복합상품 (2인 PKG / 1인 PKG)은 매점쿠폰 사용 시, 예매 티켓 환불 불가.
			※ 단, 매점 쿠폰 미 사용 시, 예매 티켓 환불 가능하며 재 예매 시, 새로운 매점 쿠폰 발급.
			
			계좌이체
			1. 예매일 이후 7일 이내 취소 시
			- 자동 환불 은행: 취소 후 즉시 처리가능
			- 조흥, 신한, 외한, 한미, 우리, 우체국, 전북, 경남, 광주, 대구, 새마을, 제주
			- 우리은행의 경우 당일 취소분만 즉시 처리 가능
			- 수동 환불 은행: 농협(취소 후 2~3일 이내 입금), 부산/제일/우리(취소 후 3~5일 이내 입금)
			
			2. 예매 7일 이후~상영시간 30분 전 취소 시(단, 일부 당일 취소 불가 행사의 경우 전일 취소 시)
			- 환불은 환불 요청일로부터 7일 이상 소요됨
			
			※ 기타 환불 관련 문의는 고객센터 1544-1122로 연락바랍니다.
						</textarea>
					</div><!-- tab-pane -->
					<div class="tab-pane fade" id="myreview" role="tabpanel"aria-labelledby="myreview-tab">
						<textarea class="textarea1" rows="13" cols="110" readonly>
								
				현장 취소를 하는 경우
				상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.
				
				홈페이지에서 예매 취소할 경우
				부분 취소는 불가능합니다. (ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)
				홈페이지 예매 취소는 상영시간 20분전까지 가능합니다.(단, 씨네&포레관, 씨네&리빙룸, SUITE CINEMA 제외)
				상영시간 이후 취소나 환불은 되지 않습니다
				
				모바일 앱/웹(m.cgv.co.kr)에서 예매 취소할 경우
				부분 취소는 불가합니다.(ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)
				모바일 앱/웹 예매 취소는 상영시간 15분전까지 가능합니다.(단, 씨네&포레관, 씨네&리빙룸, SUITE CINEMA 제외)
				상영시간 이후 취소나 환불은 되지 않습니다.
				
				단, 일부 행사의 경우 행사 당일 취소, 변경 불가 합니다.
								
							</textarea>		
						</div><!-- tab-pane  -->
					</div><!-- tab-content -->
				</div><!-- col-md-10 -->
			</div><!-- row 두번째 줄 -->
	</div><!-- contaier2 -->		
</div> <!-- contaier1 -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>