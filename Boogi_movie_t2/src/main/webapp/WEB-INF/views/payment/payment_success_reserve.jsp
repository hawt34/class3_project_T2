<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부기무비 빠른예매</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div align="center">
		<h2>정상적으로 <span>결제 완료</span> 되었습니다. </h2>	
		<div>
			<h5>결제 내역</h5>
			<p>${pay.merchant_uid}, 결제 시간, ${pay.ticket_pay_price}</p>
		</div>
		<div>
			<h5>결제 정보</h5>
			<p>결제수단</p>
			<p>카드사</p>
			<hr>
			<p>티켓 가격</p>
			<p>포인트 사용</p>
			<p>쿠폰 사용</p>
			<hr>
			<p><b>최종 결제금액</b></p>
		</div>
		<div>
			<h5>예매 정보</h5>
			<p>영화 포스터, 제목, 극장명, 상영관명, 날짜, 시간, 좌석, 인원수</p>
		</div>
		<button class="btn btn-primary" type="button" onclick="myp_main">확인</button>
	</div>

</body>
</html>