<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');

.kaushan-script-regular {
	font-family: "Kaushan Script", cursive;
	font-weight: 400;
	font-style: normal;
}

.header {
	background: white;
	margin: 0px;
	border-bottom: 3px solid #151619;
}

.header_top {
	padding-right: 100px;
	padding-top: 20px;
}

.col-md-2>img {
	width: 150px;
}

.col-md-5>a {
	text-decoration: none;
	color: skyblue;
	font-size: 130px;
}

.header_middle {
	padding: 20px 0px;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	color: #151619;
	line-height: 1.5em;
	margin: 0px;
}

.header_top>a {
	color: black;
	text-decoration: none;
}

.dropdown {
	display: inline-block;
	position: relatvie;
	margin: 0px;
	padding: 0px;
}

.dropdown-btn {
	width: 200px;
	padding: 10px;
	font-size: 18px;
	background-color: #fff;
	color: #151619;
	border: none;
	cursor: pointer;
}

.dropdown-btn:hover {
	background-color: skyblue;
	color: white;
	transition-duration: 0.5s;
}

.dropdown-submenu {
	width: 200px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.192);
	display: none;
	position: absolute;
	z-index: 2;
}

.dropdown-submenu:hover {
	transition-duration: 1s;
}

.dropdown-submenu a {
	display: block;
	padding: 7px;
	text-align: center;
	background: white;
	color: black;
	text-decoration: none;
}

.dropdown-submenu a:hover {
	background-color: skyblue;
	color: white;
}

.dropdown:hover .dropdown-submenu {
	display: block;
	transition-duration: 1s;
}
</style>

</head>
<body>
<div class="header">
		<!--  여기가 헤더 탑 로그인 자리 -->
		<div align="right" class="header_top">
			<a href="#"> 로그인 | </a> <a href="#"> 로그아웃 | </a> <a href="#">
				회원가입 | </a> <a href="#"> 관리자페이지 </a>
		</div>
		<!--  부기무비 타이틀 영역 -->
		<div class="header_middle">
			<div class="row">
				      
				<div class="col-md-1"></div>
				<div class="col-md-2" align="center">
					<img src="images/bogiHappy.png">
				</div>
				<div class="col-md-5" align="center">
					<a class="kaushan-script-regular" href="#">Boogie Movie</a>
				</div>
				<div class="col-md-2" align="center">
					<img src="images/bogiHappy.png">
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>

		<!--  여기 부턴 헤더 네비바 영역 -->
		<div class="header_low" align="center">
			<div class="dropdown">
				<button class="dropdown-btn">영화</button>
				<div class="dropdown-submenu">
					<a href="#none">현재상영작</a> <a href="#none">상영예정작</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">극장</button>
				<div class="dropdown-submenu">
					<a href="#none">부산진구</a> <a href="#none">해운대구</a> <a href="#none">북구</a>
					<a href="#none">남구</a> <a href="#none">서구</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">예매</button>
				<div class="dropdown-submenu">
					<a href="#none">빠른예매</a> <a href="#none">상영스케줄</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">마이페이지</button>
				<div class="dropdown-submenu">
					<a href="#none">예매내역</a> <a href="#none">결제내역</a> <a href="#none">포인트내역</a>
					<a href="#none">회원등급</a> <a href="#none">회원정보수정</a> <a href="#none">할인/쿠폰</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">고객센터</button>
				<div class="dropdown-submenu">
					<a href="#none">공지사항</a> <a href="#none">자주묻는질문</a> <a href="#none">1:1상담센터</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">이벤트</button>
				<div class="dropdown-submenu">
					<a href="#none">영화</a> <a href="#none">극장</a> <a href="#none">할인/제휴</a>
					<a href="#none">시사회</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>