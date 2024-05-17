<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부기무비 결제하기</title>
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
	
	#pay_agreement {
		padding: 30px;
	}
	
	.pay_number {
		font-weight: bold;
		color: #0054FF;
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
			<div class="col-7 col1">
				<form>
					<div class="d-flex">
						<h3 class="me-auto">할인 적용</h3>
<!-- 						<button type="reset" class="p-2">재입력</button> -->
						<button type="reset" class="btn btn-outline-primary btn-sm">할인적용 초기화</button>
					</div>
					<div class="card" id="member_point">
						<h5 class="card-header">부기무비 포인트</h5>
						<div class="card-body">
							<p class="card-text">* 예매 취소 시 유효기간이 지난 멤버십 포인트는 복구되지 않습니다.</p>
							<div class="w-50 input-group mb-3">
								<input type="text" class="form-control" placeholder="보유 포인트" id="getMemberPoint" >
								<button class="btn btn-outline-secondary" type="button" id="getMemberPointBtn" >조회</button>
							</div>
							<div class="w-50 input-group mb-3">
								<input type="text" class="form-control" placeholder="사용할 포인트를 입력하세요" id="useMemberPoint" pattern="[0-9]*">
								<button class="btn btn-outline-secondary" type="button" id="useMemberPointBtn">적용</button>
							</div>
							<div id="checkPointArea"></div>
							
						</div>
					</div>
					<br>
					<div class="card" id="member_coupon">
						<h5 class="card-header">부기무비 쿠폰</h5>
						<div class="card-body">
							<p class="card-text">* 예매 취소 시 유효기간이 지난 쿠폰은 복구되지 않습니다.</p>
							<div class="w-50 input-group mb-3">
								<input type="text" class="form-control" placeholder="내 쿠폰" id="getMemberCoupon">
								<button class="btn btn-outline-secondary" type="button" id="coupon-modal" >조회</button>
							</div>
						</div>
					</div>
				</form>
				<br>
				<h3>결제 방법</h3>
				<div class="card" >
					<h5 class="card-header">결제 수단</h5>
					<div class="card-body">
						 <div class="pay-method-container">
		                    <div class="row justify-content-center">
		                        <div class="col" >
		                            <input type="radio" class="btn-check" name="pg" id="btn-check-normal" value="html5_inicis" autocomplete="off" checked>
		                            <label class="btn pay_way" for="btn-check-normal">
		                                <img src="${pageContext.request.contextPath}/resources/images/pay_credit-card.svg" alt="일반결제 이미지" style="width: 50px;">
		                                일반결제
		                            </label>
		                        </div>
		
		                        <div class="col">
		                            <input type="radio" class="btn-check" name="pg" id="btn-check-kakao" value="kakaopay" autocomplete="off">
		                            <label class="btn pay_way" for="btn-check-kakao">
		                                <img src="${pageContext.request.contextPath}/resources/images/pay_kakao.svg" alt="카카오페이 이미지" style="width: 100px;">
		                                카카오페이
		                            </label>
		                        </div>
		                        
		                        <div class="col">
		                            <input type="radio" class="btn-check" name="pg" id="btn-check-tosspay" value="tosspay" autocomplete="off">
		                            <label class="btn pay_way" for="btn-check-tosspay">
		                                <img src="${pageContext.request.contextPath}/resources/images/pay_toss.png" alt="토스페이 이미지" style="width: 100px; ">
		                                토스페이
		                            </label>
		                        </div>
		                    </div>
		                </div>
					</div>
				</div>
				<br>
				<div class="card" >
					<h5 class="card-header">이용 약관</h5>
					<div class="card-body"id="pay_agreement">
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
				</div> <!-- pay_agreement -->
			</div> <!-- col1 끝 -->
			
			<div class="col col2">
				<h3>결제하기</h3>
				<div class="card " >
					<h5 class="card-header">결제 정보</h5>
					<div class="card-body text-center">
						<div class="card payment_status_box">

							<div class="row ">
								<div class="col text-center">
									<img src="${pageContext.request.contextPath}/resources/images/pay_test.jpg" id="movie_poster" alt="포스터썸네일" style="width: 250px;" >
								</div>
								<div class="col">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<p>제목
												<span id="movie_name">영화 제목 없음</span>
											</p>
										</li>
										<li class="list-group-item">
											<p>
												<span id="theater_name">극장 없음</span>
												<span id="screen_cinema_num">상영관 없음</span>
											</p>
										</li>
										<li class="list-group-item">
											<p>
												<span id="selected_seats">좌석 없음</span>
											</p>
										</li>
										<li class="list-group-item">
											<p>
												<span id="select_date">날짜 없음</span>
											</p>
										</li>
										<li class="list-group-item">
											<p>
												<span id="scs_start_time">시작 시간 없음</span>~
												<span id="scs_end_time">종료 시간 없음</span>
											</p>
										</li>
										<li class="list-group-item">
											<p>예매인원 
												<span id="person_info">0</span>
											</p>
										</li>
									</ul>
								</div>
							</div> <!-- row -->
								
							<div class="card-footer">
								<p><b> 총 금액
									<span id="total_fee" class="pay_number">50000</span>
								원</b></p>
							</div> <!-- card-footer -->
						</div>
						<br>
						<div class="card payment_status_box">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<p>사용 포인트 
										<span id="point_apply" class="pay_number">0</span>
									</p>
								</li>
								<li class="list-group-item">
									<p>사용 쿠폰 
										<span id="coupon_apply" class="pay_number">0</span>
									</p>
								</li>
							</ul>
							<div class="card-footer">
								<p><b>총 할인 적용 <span id="discount_sum" class="pay_number">0</span></b>원</p>
							</div>
						</div>
						<br>
						<div class="card payment_status_box">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<p><b>최종 결제금액 
										<span id="final_amount" class="pay_number">50000</span> <!-- 첫 금액은  total_fee랑 같아야 함-->
									원</b></p>
								</li>
								<li class="list-group-item">
									<p>결제수단 
										<span id="pay_way_apply" class="pay_number">미선택</span>
									</p>
								</li>
							</ul>
						</div>
						
					</div> <!-- card-body 끝 -->
					<div class="card-footer" >
						<div class="btn-group nav nav-pills nav-fill" role="group"  >
							<button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">이전</button>
							<button type="submit" class="btn btn-primary btn-lg">결제</button>
						</div>
					</div><!-- card-footer -->
				</div><!-- card -->
			</div> <!--  col2 끝 -->
		</div> <!-- row payment_option 끝 -->
	</div><!-- payment_all  끝 -->
	
	<!-- 쿠폰팝업(모달창) -->
    <div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="payModalLabel">사용가능 쿠폰  총 <span>${fn:length(couponList)}</span>개</h5>
                    <button type="button" class="btn-close" id="coupon-close" aria-label="Close"></button>
                </div>
                <form >
                    <div class="modal-body">
                        <div class="wrapper">
                            <div class="box">
	                            <c:forEach var="coupon" items="${couponList}">
	                        		<input type="radio" class="coupon-select" name="select" id="${coupon.coupon_num}" value="${coupon.coupon_value}">
	                        		<label for="${coupon.coupon_num}" class="coupon-select" >${coupon.coupon_name}</label>
	                        		<br>
	                        	</c:forEach>
                        	</div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="coupon-submit">적용</button>
                        </div>
                   </div>
                </form>
            </div> <!-- modal-content -->
        </div> <!-- modal-dialog -->
    </div> <!-- couponModal -->

	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
<script src="${pageContext.request.contextPath}/resources/js/payment.js"></script>
<script>
 	$(function() {

		// 포인트 조회 버튼 눌러서 포인트 가져오기
		$("#getMemberPointBtn").on("click", function() {
			$("#getMemberPoint").val("${member.member_point}");
		});
		
		// 사용할 포인트 값 입력 검증
		$("#useMemberPoint").on("keyup",function() {
			let point = $(this).val();
			let regex = /^[1-9][0-9]*00$/; // 숫자만 입력 가능, 100원 단위로만(마지막 두 자리는 0으로만) 입력 가능
			
			if(!regex.exec(point)) {
				$("#checkPointArea").text("100원 단위 숫자만 입력 가능합니다.");
				$("#checkPointArea").css("color","red");
			} else {
	            $("#checkPointArea").text("");
	        }
			
		});
		
		
		
		// 포인트 입력 후 적용 버튼 누를 시
		$("#useMemberPointBtn").on("click", function() {
			
			// 보유 포인트를 조회하지 않고 적용 버튼을 누른 경우 
			if($("#getMemberPoint").val() == "") {
				$("#checkPointArea").text("보유 포인트를 먼저 조회해 주세요.");
				$("#checkPointArea").css("color","red");
				
				return;
			}

			let total_fee = document.querySelector("#total_fee").innerText; // 넘어온 총 결제 값
			let use_point = $("#useMemberPoint").val();	// 입력된 사용할 포인트 값
			
			// 총 할인 적용 값
			let coupon_apply = document.querySelector("#coupon_apply").innerText; 	// 결제란 적용된 쿠폰 항목
// 			let use_coupon = $("#getMemberCoupon").val();
			let discount_sum = parseInt(use_point) + parseInt(coupon_apply); 		// 결제란 적용된 비타민 + 쿠폰 항목
			let final_amount = parseInt(total_fee) - parseInt(discount_sum); 		// 현재 최종 값 - 총 할인금액 
			
			
			$.ajax({
				type : "GET",
			 	url : "memberPoint",
			 	data : {
			 		member_id : "${member.member_id}",
			 		use_point : $("#useMemberPoint").val()
			 	},
			 	dataType : "json",
			 	success : function(checkDupPointResult) {
			 		if(checkDupPointResult == "false") {
			 			alert("포인트를 사용할 수 없습니다.");
			 		} else {
			 			if(confirm ("포인트를 사용하시겠습니까?")){
				 			$("#point_apply").html(use_point);			// 적용할 포인트 값
				 			$("#final_amount").html(final_amount);		// 총 결제금액에  적용 값 
				 			$("#discount_sum").html(discount_sum); 		// 총 할인 적용 값
				 			
				 			console.log("total_fee : " + total_fee)
				 			console.log("use_point : " + use_point)
				 			console.log("coupon_apply : " + coupon_apply)
				 			console.log("discount_sum : " + discount_sum)
				 			console.log("final_amount : " + final_amount)
				 			
			 			} else {
			 				$("#useMemberPoint").val("");
			 			}
			 		}
					
				}, 
				error : function() {
					alert("사용할 포인트를 입력하세요.");
				}
				
			});
			
		});
		
		// 쿠폰 조회 버튼 누를 시 보유 쿠폰 조회 모달창 
		$('#coupon-modal').click((e) => {
			e.preventDefault();
			$('#couponModal').modal("show");
		});
		$('#coupon-close').click(() => $('#couponModal').modal("hide"));
		$('#coupon-submit').click(() => $('#couponModal').modal("hide"));
	    
		
		// 쿠폰 적용 버튼 누를 시 쿠폰 적용
		$("#coupon-submit").on("click", function() {
			event.preventDefault(); // 폼 제출 기본 동작 막기
			
			
			let total_fee = document.querySelector("#total_fee").innerText; // 넘어온 총 결제 값
			let selectedCoupon = document.querySelector('input[name=select]:checked').value.replace("-", ""); // 선택한 쿠폰값
			
			// 총 할인 적용 값
			let point_apply = document.querySelector("#point_apply").innerText;		// 결제란 적용된 포인트 항목
			let coupon_apply = document.querySelector("#coupon_apply").innerText; 	// 결제란 적용된 쿠폰 항목
			let discount_sum = parseInt(point_apply) + parseInt(coupon_apply); 		// 결제란 적용된 비타민 + 쿠폰 항목
			let final_amount = parseInt(total_fee) - parseInt(discount_sum); 		// 현재 최종 값 - 총 할인금액 
			
			
			if(confirm ("선택하신 쿠폰을 사용하시겠습니까?")){
	 			$("#getMemberCoupon").val(selectedCoupon); 	// 사용한 쿠폰 인풋 박스에 출력
	 			$("#coupon_apply").html(selectedCoupon);	// 적용할 쿠폰 값
	 			$("#final_amount").html(final_amount);		// 총 결제금액 적용 값
	 			$("#discount_sum").html(discount_sum);		// 총 할인 적용 값
	 			
 			} else {
 				history.back();
 			}
			
			
		});
		
// 		const applyCoupon = (selectValue) => {
// 			event.preventDefault();
			   
// 			let dcPct = document.querySelector(`#${selectValue} .text-dc-pct`).innerText;
// 			dcPct = dcPct.substring(0, dcPct.lastIndexOf("%"));
// 			console.log(dcPct);
			
// 			// 클래스 정가
// 			let originAmount = document.querySelector("#original-amount>p").innerText;
// 			originAmount = originAmount.replace(",", "");
// 			originAmount = Number(originAmount.substring(0, originAmount.lastIndexOf("원")));
			
// 			// 할인금액
// 			const discountAmount = originAmount * (Number(dcPct) * 0.01);
// 			document.querySelector("#coupon-modal>a").innerText = discountAmount.toLocaleString() + "원";
			
// 			// 최종 결제 금액
// 			document.querySelector("#total-amount>p").innerText = (originAmount - discountAmount).toLocaleString() + "원";
			
// 		} // applyCoupon

		
		//체크박스 전체선택
		const selectAll = (selectAll) => {
		    const checkboxes = document.querySelectorAll('input[name="agmt"]');

		    checkboxes.forEach((checkbox) => {
		        checkbox.checked = selectAll.checked
		    }); // forEach

		} // selectAll

		// 하나라도 체크 해제되면 전체선택 해제
		const checkSelectAll = (checkbox) => {
		    const selectall = document.querySelector('#agmt-all');

		    if (!checkbox.checked) {
		        selectall.checked = false;
		        
		    } // if

		} // checkSelectAll
		
		
		
	}); 


</script>
	
	<script>
// 		// 1. SDK 초기화하기
// 		var IMP = window.IMP;
// 		IMP.init("imp00262041"); // 부기무비 고객사 식별코드
		
// 		var today = new Date();   
//         var hours = today.getHours(); // 시
//         var minutes = today.getMinutes();  // 분
//         var seconds = today.getSeconds();  // 초
//         var milliseconds = today.getMilliseconds();
//         var makeMerchantUid = hours +  minutes + seconds + milliseconds;
		
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
// 			async (response) => {
// 				if (response.error_code != null) {
// 				  return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
// 				}
				
// 				// 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
// 				const notified = await fetch(`${SERVER_BASE_URL}/payment/complete`, {
// 					method: "POST",
// 					headers: { "Content-Type": "application/json" },
// 					// imp_uid와 merchant_uid, 주문 정보를 서버에 전달합니다
// 					body: JSON.stringify({
// 					imp_uid: response.imp_uid,
// 					merchant_uid: response.merchant_uid,
//  					// 주문 정보...
// 					}),
// 				});
// 			},
// 		);
// 		// 4. 결제 완료 처리하기
		
// 		// JSON 요청을 처리하기 위해 body-parser 미들웨어 세팅
// 		app.use(bodyParser.json());

// 		// POST 요청을 받는 /payments/complete
// 		app.post("/payment/complete", async (req, res) => {
// 		  try {
// 		    // 요청의 body로 imp_uid와 merchant_uid가 전달되기를 기대합니다.
// 		    const { imp_uid, merchant_uid } = req.body;

// 		    // 1. 포트원 API 엑세스 토큰 발급
// 		    const tokenResponse = await fetch("https://api.iamport.kr/users/getToken", {
// 		      method: "POST",
// 		      headers: { "Content-Type": "application/json" },
// 		      body: JSON.stringify({
// 		        imp_key: "imp_apikey", // REST API 키
// 		        imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW", // REST API Secret
// 		      }),
// 		    });
// 		    if (!tokenResponse.ok)
// 		      throw new Error(`tokenResponse: ${tokenResponse.statusText}`);
// 		    const { access_token } = await tokenResponse.json();

// 		    // 2. 포트원 결제내역 단건조회 API 호출
// 		    const paymentResponse = await fetch(
// 		      `https://api.iamport.kr/payments/${imp_uid}`,
// 		      { headers: { Authorization: access_token } },
// 		    );
// 		    if (!paymentResponse.ok)
// 		      throw new Error(`paymentResponse: ${paymentResponse.statusText}`);
// 		    const payment = await paymentResponse.json();

// 		    // 3. 고객사 내부 주문 데이터의 가격과 실제 지불된 금액을 비교합니다.
// 		    const order = await OrderService.findById(merchant_uid);
// 		    if (order.amount === payment.amount) {
// 		      switch (payment.status) {
// 		        case "ready": {
// 		          // 가상 계좌가 발급된 상태입니다.
// 		          // 계좌 정보를 이용해 원하는 로직을 구성하세요.
// 		          break;
// 		        }
// 		        case "paid": {
// 		          // 모든 금액을 지불했습니다! 완료 시 원하는 로직을 구성하세요.
// 		          break;
// 		        }
// 		      }
// 		    } else {
// 		      // 결제 금액이 불일치하여 위/변조 시도가 의심됩니다.
// 		    }
// 		  } catch (e) {
// 		    // 결제 검증에 실패했습니다.
// 		    res.status(400).send(e);
// 		  }
// 		});

	</script>	
</body>
</html>