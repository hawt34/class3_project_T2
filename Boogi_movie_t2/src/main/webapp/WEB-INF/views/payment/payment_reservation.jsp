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

<%-- <link href="${pageContext.request.contextPath}/resources/css/payment.css" rel="stylesheet" type="text/css"> --%>
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
		<h1>빠른 예매</h1>
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
							* 예매 취소 시 유효기간이 지난 멤버십 포인트는 복구되지 않습니다.
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
							<p>영화정보(제목, 지점, 관, 날짜, 시간)</p>
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
	
	<script>
		// 1. SDK 초기화하기
		IMP.init("imp00262041""); // 부기무비 고객사 식별코드
		
		// 2. 결제창 불러오기
		IMP.request_pay(
			{
				pg: "{PG사 코드}.{상점 ID}",
				pay_method: "card",
				merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
				name: "노르웨이 회전 의자",
				amount: 64900,
				buyer_email: "gildong@gmail.com",
				buyer_name: "홍길동",
				buyer_tel: "010-4242-4242",
				buyer_addr: "서울특별시 강남구 신사동",
				buyer_postcode: "01181",
			},
			function (response) {
				// 결제 종료 시 호출되는 콜백 함수
				// response.imp_uid 값으로 결제 단건조회 API를 호출하여 결제 결과를 확인하고,
				// 결제 결과를 처리하는 로직을 작성합니다.
			},
		);
		
		// 3. 결제 결과 처리하기 - SDK 반환값으로 처리하기
		IMP.request_pay(
			{
			  /* 파라미터 생략 */
			},
			async (response) => {
				if (response.error_code != null) {
				  return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
				}
				
				// 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
				// (다음 목차에서 설명합니다)
				const notified = await fetch(`${SERVER_BASE_URL}/payment/complete`, {
					method: "POST",
					headers: { "Content-Type": "application/json" },
					// imp_uid와 merchant_uid, 주문 정보를 서버에 전달합니다
					body: JSON.stringify({
					imp_uid: response.imp_uid,
					merchant_uid: response.merchant_uid,
 					// 주문 정보...
					}),
				});
			},
		);
		// 4. 결제 완료 처리하기
		
		// JSON 요청을 처리하기 위해 body-parser 미들웨어 세팅
		app.use(bodyParser.json());

		// POST 요청을 받는 /payments/complete
		app.post("/payment/complete", async (req, res) => {
		  try {
		    // 요청의 body로 imp_uid와 merchant_uid가 전달되기를 기대합니다.
		    const { imp_uid, merchant_uid } = req.body;

		    // 1. 포트원 API 엑세스 토큰 발급
		    const tokenResponse = await fetch("https://api.iamport.kr/users/getToken", {
		      method: "POST",
		      headers: { "Content-Type": "application/json" },
		      body: JSON.stringify({
		        imp_key: "imp_apikey", // REST API 키
		        imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW", // REST API Secret
		      }),
		    });
		    if (!tokenResponse.ok)
		      throw new Error(`tokenResponse: ${tokenResponse.statusText}`);
		    const { access_token } = await tokenResponse.json();

		    // 2. 포트원 결제내역 단건조회 API 호출
		    const paymentResponse = await fetch(
		      `https://api.iamport.kr/payments/${imp_uid}`,
		      { headers: { Authorization: access_token } },
		    );
		    if (!paymentResponse.ok)
		      throw new Error(`paymentResponse: ${paymentResponse.statusText}`);
		    const payment = await paymentResponse.json();

		    // 3. 고객사 내부 주문 데이터의 가격과 실제 지불된 금액을 비교합니다.
		    const order = await OrderService.findById(merchant_uid);
		    if (order.amount === payment.amount) {
		      switch (payment.status) {
		        case "ready": {
		          // 가상 계좌가 발급된 상태입니다.
		          // 계좌 정보를 이용해 원하는 로직을 구성하세요.
		          break;
		        }
		        case "paid": {
		          // 모든 금액을 지불했습니다! 완료 시 원하는 로직을 구성하세요.
		          break;
		        }
		      }
		    } else {
		      // 결제 금액이 불일치하여 위/변조 시도가 의심됩니다.
		    }
		  } catch (e) {
		    // 결제 검증에 실패했습니다.
		    res.status(400).send(e);
		  }
		});

	</script>	
</body>
</html>