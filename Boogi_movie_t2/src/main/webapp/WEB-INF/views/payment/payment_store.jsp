<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/payment.css" rel="stylesheet" type="text/css">

</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
	<div class="payment_all">
		<h1>빠른 예매</h1>
		<hr>
		<div class="row payment_subtab">
			<div class="col-8 col1">
			<form>
				<h3>할인 적용</h3>
				<input type="reset" value="초기화">
				<input type="radio" name="payment_subtab" id="payment_discount1">
				<label for="payment_discount1">부기무비 포인트</label>
				<div class="payment_discount_div">
					* 예매 취소 시 유효기간이 지난 멤버십 포인트는 복구되지 않습니다.
					<hr>
					<div class="input-group mb-3 w-50" >
						보유 포인트 : 2,000점&nbsp;&nbsp;
						<input type="text" class="form-control" placeholder="사용할 포인트" aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">적용</button>
					</div>
				</div><br>
				<input type="radio" name="payment_subtab" id="payment_discount2">
				<label for="payment_discount2">부기무비 쿠폰</label>
				<div class="payment_discount_div">
					<button type="button" class="btn btn-secondary btn-sm">내 쿠폰 조회</button>
					<button type="button" class="btn btn-secondary btn-sm">쿠폰 등록하기</button>
					<hr>
					<p>적용된 쿠폰 </p>
				</div>
			</form>
		
			<form>
				<h3>결제 수단 선택</h3>
				<input type="radio" name="payment_method" id="payment_method1" checked>
				<label for="payment_method1">신용/체크카드</label>
				<input type="radio" name="payment_method" id="payment_method2" >
				<label for="payment_method2">휴대폰결제</label>
				<input type="radio" name="payment_method" id="payment_method3" >
				<label for="payment_method3">간편결제</label>
				<input type="radio" name="payment_method" id="payment_method4" >
				<label for="payment_method4">내통장결제</label>
				<hr>
				<div class="conbox payment_method1_div">
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
				</div>
				<div class="conbox payment_method2_div">
					<p>
						결제하신 금액은 익월 휴대폰 요금에 합산되어 청구되며, 휴대폰 결제한도는 통산사별 월 누적 이용 제한에 따라 적용됩니다.
						매월 말일 23시30분 ~ 익월 00시 10분까지(40분간)는 시스템 점검시간으로 이용이 어려울 수 있습니다.
						휴대폰 결제와 관련된 추가 안내는 FAQ를 참조해주세요.
					</p>
				</div>
				<div class="conbox payment_method3_div">
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
				</div>
				<div class="conbox payment_method4_div">
					<p>- 내통장결제는 본인명의의 계좌를 최초 1회 등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는 현금결제 서비스 입니다.</p>
					<p>- 은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</p>
				</div>
			</form>
			</div>	
			<div class="col col2">
				<h3>결제 항목</h3>
				<div class="payment_status text-center">
					<div class="payment_status_box">		
						<p>영화정보(제목, 지점, 관, 날짜, 시간)</p>
					</div>
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
					<input type="button" value="이전" onclick="history.back();">
					<input type="submit" value="결제">
				</div>
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