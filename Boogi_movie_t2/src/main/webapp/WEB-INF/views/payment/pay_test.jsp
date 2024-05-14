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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<!--  포트원 SDK -->
<!-- <script src="https://cdn.portone.io/v2/browser-sdk.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
    var IMP = window.IMP; 
    IMP.init("imp67011510"); 
  
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function requestPay() {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: "IMP"+makeMerchantUid, 
            name : '당근 10kg',
            amount : 1004,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
            } else {
                console.log(rsp);
            }
        });
    }
</script>

 <title>Sample Payment</title>

</head>
<body>
	 <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>