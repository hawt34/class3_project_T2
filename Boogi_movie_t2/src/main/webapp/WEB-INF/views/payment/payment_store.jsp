<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!--  포트원 SDK -->
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<style type="text/css">
	body { 
		margin: 0; 
 		padding:0; 
 	} 

	article {
		width: 1400px;
		margin: 0 auto;
	}
	
	.payment_all{
		margin: 30px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
	<div class="payment_all">
		<h1>스토어 결제</h1>
		<hr>
		<div class="row payment_option">
			<div class="col-8 col1">
				<form>
					<h3>할인 적용</h3>
					<p class="d-inline-flex gap-1">
					<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#member_point" aria-expanded="false" aria-controls="member_point">
						부기무비 포인트
					</button>
					</p>
					<div class="collapse" id="member_point">
						<div class="card card-body">
							* 결제 취소 시 유효기간이 지난 멤버십 포인트는 복구되지 않습니다.
							<hr>
							<div class="input-group mb-3 w-50" >
								<input type="text" class="form-control" placeholder="보유 포인트" aria-describedby="button-addon2">
								<button class="btn btn-outline-secondary" type="button" id="button-addon1">조회</button>
								<input type="text" class="form-control" placeholder="사용할 포인트" aria-describedby="button-addon2">
								<button class="btn btn-outline-secondary" type="submit" id="button-addon2">적용</button>
							</div>
						</div>
					</div>
					<br>
					<p class="d-inline-flex gap-1">
						<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#member_coupon" aria-expanded="false" aria-controls="member_coupon">
							부기무비 쿠폰
						</button>
					</p>
					<div class="collapse" id="member_coupon">
						<div class="card card-body">
							<div class="input-group mb-3 w-50" >
								<button type="button" class="btn btn-outline-secondary">내 쿠폰 조회</button>
								<button type="button" class="btn btn-outline-secondary" >쿠폰 등록하기</button>
							</div>
							<hr>
							<p>적용된 쿠폰 </p>
						</div>
					</div>
				</form>
				<br>
				<form>
					<h3>결제 수단 선택</h3>
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						
						<li class="nav-item" role="presentation">
							<input type="radio" name="payway_tab" class="nav-link" id="payway_tab1" data-bs-toggle="pill" data-bs-target="#payway1" role="tab" aria-controls="payway1" checked>
							<label for="payway_tab1">신용/체크카드</label>
						</li>
						<li class="nav-item" role="presentation">
							<input type="radio" name="payway_tab" class="nav-link" id="payway_tab2" data-bs-toggle="pill" data-bs-target="#payway2" role="tab" aria-controls="payway2" >
							<label for="payway_tab2">휴대폰결제</label>
					 	</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="payway_tab3" data-bs-toggle="pill" data-bs-target="#payway3" type="button" role="tab" aria-controls="payway3" aria-selected="false">간편결제</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="payway_tab4" data-bs-toggle="pill" data-bs-target="#payway4" type="button" role="tab" aria-controls="payway4" aria-selected="false">내통장결제</button>
						</li>
						
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="payway1" role="tabpanel" aria-labelledby="payway_tab1" tabindex="0">
							카드사 선택
							<select>
								<option>카드를 선택하세요</option>
								<option>비씨카드</option>
								<option>국민카드</option>
								<option>신한카드</option>
								<option>삼성카드</option>
								<option>롯데카드</option>
								<option>하나카드</option>
								<option>현대카드</option>
								<option>씨티카드</option>
								<option>제주카드</option>
								<option>우리카드</option>
								<option>수협카드</option>
								<option>전북카드</option>
								<option>광주카드</option>
								<option>신협카드</option>
								<option>카카오뱅크</option>
								<option>케이뱅크</option>
								<option>우체국카드</option>
								<option>토스카드</option>
								<option>SC제일은행비씨카드</option>
								<option>SC제일은행삼성카드</option>
								<option>IBK기업은행카드</option>
							</select>
							<input type="radio" name="payment_method1_card" id="card_app">
							<label for="card_app">앱카드</label>
							<input type="radio" name="payment_method1_card" id="card_default">
							<label for="card_default">일반결제</label>
							<input type="radio" name="payment_method1_card" id="card_ISP">
							<label for="card_ISP">ISP</label>
						</div> <!--  payway1 div 끝 -->
						<div class="tab-pane fade" id="payway2" role="tabpanel" aria-labelledby="payway_tab2" tabindex="0">
							<p>
								결제하신 금액은 익월 휴대폰 요금에 합산되어 청구되며, 휴대폰 결제한도는 통산사별 월 누적 이용 제한에 따라 적용됩니다.
								매월 말일 23시30분 ~ 익월 00시 10분까지(40분간)는 시스템 점검시간으로 이용이 어려울 수 있습니다.
								휴대폰 결제와 관련된 추가 안내는 FAQ를 참조해주세요.
							</p>
						</div> <!--  payway2 div 끝 -->
						<div class="tab-pane fade" id="payway3" role="tabpanel" aria-labelledby="payway_tab3" tabindex="0">
							<input type="radio" name="payment_method_easy" id="payment_easy_toss" checked>
							<label for="payment_easy_toss">토스페이</label>
							<input type="radio" name="payment_method_easy" id="payment_easy_naver" >
							<label for="payment_easy_naver">네이버페이</label>
							<input type="radio" name="payment_method_easy" id="payment_easy_kakao" >
							<label for="payment_easy_kakao">카카오페이</label>
							<input type="radio" name="payment_method_easy" id="payment_easy_payco" >
							<label for="payment_easy_payco">페이코</label>
							<input type="radio" name="payment_method_easy" id="payment_easy_kb" >
							<label for="payment_easy_kb">KBPAY</label>
						</div> <!--  payway3 div 끝 -->
						<div class="tab-pane fade" id="payway4" role="tabpanel" aria-labelledby="payway_tab4" tabindex="0">
							<p>- 내통장결제는 본인명의의 계좌를 최초 1회 등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는 현금결제 서비스 입니다.</p>
							<p>- 은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</p>
						</div> <!--  payway4 div 끝 -->
					</div><!-- tab-content 끝 -->
				</form>
				
			</div> <!-- col1 끝 -->
			
			<div class="col col2">
				<h3 class="card-title">결제 항목</h3>
				<div class="card text-center" >
					<div class="card-body">
						<div class="payment_status_box">		
							<p>장바구니에 담긴 물건</p>
						</div>
						<hr>
						<div class="payment_status_box">
							<p>성인2&nbsp;30,000원</p>
							<p>청소년1&nbsp;12,000원</p>
							<hr>
							<p><b>금액 42,000원</b></p>
						</div>
						<div class="payment_status_box">
							<p>부기무비 포인트&nbsp;2,000점</p>
							<hr>
							<p><b>할인적용 2,000원</b></p>
						</div>
						<div class="payment_status_box">
							<p><b>최종결제금액 40,000원</b></p>
							<hr>
							<p>결제수단&nbsp;카드결제</p>
						</div>
						<button type="button" class="btn btn-primary" onclick="history.back();">이전</button>
						<button type="submit" class="btn btn-primary">결제</button>
					</div> <!-- card-body 끝 -->
				</div>
			</div> <!--  col2 끝 -->
		</div> <!-- row payment_option 끝 -->
	</div><!-- payment_all  끝 -->


	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
</body>
</html>