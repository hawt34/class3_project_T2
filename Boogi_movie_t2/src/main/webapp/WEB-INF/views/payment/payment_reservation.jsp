<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
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

 <script>
	 $(() => {
	     $('#point-modal').click((e) => {
	         e.preventDefault();
	         $('#pointModal').modal("show");
	     });
	     $('#point-close').click(() => $('#pointModal').modal("hide"));
	     $('#coupon-submit').click(() => $('#pointModal').modal("hide"));
	     
	     $('#coupon-modal').click((e) => {
	         e.preventDefault();
	         $('#couponModal').modal("show");
	     });
	     $('#coupon-close').click(() => $('#couponModal').modal("hide"));
	     $('#coupon-submit').click(() => $('#couponModal').modal("hide"));
	    
	 }) 


</script>


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
					<div class="d-flex">
						<h3 class="me-auto">할인 적용</h3>
<!-- 						<button type="reset" class="p-2">재입력</button> -->
						<button type="button" class="btn btn-outline-primary btn-sm">재입력</button>
					</div>
					<div class="card" id="member_point">
						<h5 class="card-header">부기무비 포인트</h5>
						<div class="card-body">
							<p class="card-text">* 예매 취소 시 유효기간이 지난 멤버십 포인트는 복구되지 않습니다.</p>
							<div class="w-50 input-group mb-3">
								<input type="text" class="form-control" placeholder="보유 포인트" aria-label="Recipient's username" aria-describedby="point-modal">
								<button class="btn btn-outline-secondary" type="button" id="point-modal" onclick="getMemberPoint()">조회</button>
							</div>
							
						</div>
					</div>
					<br>
					<div class="card" id="member_coupon">
						<h5 class="card-header">부기무비 쿠폰</h5>
						<div class="card-body">
							<p class="card-text">* 예매 취소 시 유효기간이 지난 쿠폰은 복구되지 않습니다.</p>
							<div class="w-50 input-group mb-3">
								<input type="text" class="form-control" placeholder="내 쿠폰" aria-label="Recipient's username" aria-describedby="coupon-modal">
								<button class="btn btn-outline-secondary" type="button" id="coupon-modal" onclick="getCouponList()">조회</button>
							</div>
						</div>
					</div>
				</form>
				<br>

				<fieldset>
	                <legend>이용 약관</legend>
	
	                <div class="container pay-agmt-container">
	                    <div class="row">
	                        <div class="col">
	                            <label for="agmt-all" class="form-check-label">전체 동의</label>
	                        </div>
	                        <div class="col form-check-reverse">
	                            <input type="checkbox" class="form-check-input" name="agmt-all" id="agmt-all"
	                                onclick='selectAll(this)'>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col">
	                            <label for="agmt-age" class="form-check-label">만 14세 이상 결제 동의</label>
	                        </div>
	                        <div class="col form-check-reverse">
	                            <input type="checkbox" class="form-check-input select" name="agmt" id="agmt-age"
	                                onclick='checkSelectAll(this)' required>
	                            <div class="invalid-feedback">
	                                약관에 동의해 주세요.
	                            </div>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col">
	                            <label for="agmt-confirm" class="form-check-label">주문내용 확인 및 결제동의</label>
	                        </div>
	                        <div class="col form-check-reverse">
	                            <input type="checkbox" class="form-check-input select" name="agmt" id="agmt-confirm"
	                                onclick='checkSelectAll(this)' required>
	                            <div class="invalid-feedback">
	                                약관에 동의해 주세요.
	                            </div>
	                        </div>
	                    </div>
	                </div>
            </fieldset>
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
	
	<!-- 포인트팝업(모달창) -->
    <div class="modal fade" id="pointModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="payModalLabel">사용가능 포인트</h5>
                    <button type="button" class="btn-close" id="point-close" aria-label="Close"></button>
                </div>
                <form onsubmit="applyPoint(select.value)">
                    <div class="modal-body">
                        <div class="wrapper">
                            <div class="box"></div>
                            <input type="radio" class="coupon-select" name="select" id="">
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="point-submit">적용</button>
                        </div>
                   </div>
                </form>
            </div>
        </div>
    </div>
    
	<!-- 쿠폰팝업(모달창) -->
    <div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="payModalLabel">사용가능 쿠폰 <span>3</span></h5>
                    <button type="button" class="btn-close" id="coupon-close" aria-label="Close"></button>
                </div>
                <form onsubmit="applyCoupon(select.value)">
                    <div class="modal-body">
                        <div class="wrapper">
                            <div class="box"></div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="coupon-submit">적용</button>
                        </div>
                   </div>
                </form>
            </div>
        </div>
    </div>

	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
	<script src="${pageContext.request.contextPath}/resources/js/payment.js"></script>
	<script>
		// 1. SDK 초기화하기
		var IMP = window.IMP;
		IMP.init("imp00262041"); // 부기무비 고객사 식별코드
		
		var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
		
		// 2. 결제창 불러오기
// 		IMP.request_pay(
// 			{
// 				pg: 'kakao', // "kakao.store-2dcc6398-b8ee-4e3d-a855-9b05a8cbbd6d", 
// 				pay_method: "card",
// 				merchant_uid: "IMP" + makeMerchantUid, // 주문 고유 번호
// 				name: "부기무비 영화 예매",
// 				amount: 1000,
// 				buyer_email: "gildong@gmail.com",
// 				buyer_name: "홍길동",
// 				buyer_tel: "010-4242-4242",
// 				buyer_addr: "서울특별시 강남구 신사동",
// 				buyer_postcode: "01181",
// 			},
// 			function (response) { 
// 				// 결제 종료 시 호출되는 콜백 함수
// 				// response.imp_uid 값으로 결제 단건조회 API를 호출하여 결제 결과를 확인하고,
// 				// 결제 결과를 처리하는 로직을 작성합니다.
// 				 if (rsp.success) {
//                     console.log(rsp);
//                 } else {
//                     console.log(rsp);
//                 }
// 			},
// 		);
		
		// 3. 결제 결과 처리하기 - SDK 반환값으로 처리하기
		IMP.request_pay(
			{
				pg: 'kakao', // "kakao.store-2dcc6398-b8ee-4e3d-a855-9b05a8cbbd6d", 
				pay_method: "card",
				merchant_uid: "IMP" + makeMerchantUid, // 주문 고유 번호
				name: "부기무비 영화 예매",
				amount: 1000,
				buyer_email: "gildong@gmail.com",
				buyer_name: "홍길동",
				buyer_tel: "010-4242-4242",
				buyer_addr: "서울특별시 강남구 신사동",
				buyer_postcode: "01181",
			},
			async (response) => {
				if (response.error_code != null) {
				  return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
				}
				
				// 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
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