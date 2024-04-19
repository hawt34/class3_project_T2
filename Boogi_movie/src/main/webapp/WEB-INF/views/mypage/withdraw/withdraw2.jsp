<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="withdraw2.css">
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
	<div class="sidebar1">
		<jsp:include page="../sidebar/sidebar.jsp"></jsp:include>
	</div>
<div class="container1">
	<div class="row box1">
	<div class="text1">
		<blockquote class="bluejeans">
			<br>
			<h3><p><span class="Cbluejeans">회원 탈퇴 안내</span></p></h3>  
		 	<p>[주의] 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		
			<div class="text2">1. 30일간 회원 재가입이 불가능합니다.</div>
				<ul>
					<li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
				</ul>
			
			<div class="text2">2. 다음에 경우에 회원 탈퇴가 제한됩니다.</div>
				<ul>
					<li>영화예매 내역이 있는 경우</li>
					<li>모바일오더 주문건이 있는 경우</li>
					<li>기명식 기프트카드 잔액이 있을 경우</li>
					<li>기명식 기프트카드가 카드정지 상태인 경우</li>
					<li>기명식 기프트카드 환불신청이 진행중인 경우</li>
				</ul>
			
			<div class="text2">3. 탈퇴 후 삭제 내역</div>
				<ul>
					<li>(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</li>
					<li>부기무비 멤버십 포인트 및 적립/차감 내역</li>
					<li>관람권 및 쿠폰</li>
					<li>영화 관람 내역</li>
					<li>간편 로그인 연동 정보</li>
				</ul>
		</blockquote>
		
		<div class="row box2">
<!-- 			<div class="center"> -->
				<section class="content">
					<div class="box bg-1">
						<button class="button button--ujarak " onclick="location.href='../mainpage.jsp'">회원탈퇴하시겠습니까?</button>
					</div>
				</section>
		</div><!-- row box2 -->
	</div><!-- row box1 -->
</div> <!-- container -->
    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>