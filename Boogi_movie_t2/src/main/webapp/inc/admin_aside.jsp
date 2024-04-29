<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
* {
	padding: 0;
	margin: 0
}

.btn-group {
	padding: 4px 0px;
}

.btn-group:hover .dropdown-menu {
	display: block;
	margin-left: 130px;
}

.btn-group:hover .btn {
	background: skyblue;
	color: white;
	width: 100px;
	padding-top: 12px;
	transition-duration: .1s;
}

.btn-group-vertical {
	background: white;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
}

.sideVar_title {
	padding-top: 15px;
}

.sideVar {
	margin: 60px auto;
}
.admin_aside_name{
	font-weight: bold;
}
</style>
<div class="sideVar">
	<!--  사이드바 영역  -->
	<div class="admin_middle_left" align="right">
		<div class="btn-group-vertical">
			<!-- 사이드바 타이틀 -->
			<div class="sideVar_title">
				<h4 class="admin_aside_name">관리자페이지</h4>
			</div>
			<div class="btn-group dropright">
				<!-- 마우스 오버 전 카테고리 -->
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>회원</h5>
				</button>
				<div class="dropdown-menu">
					<!-- 마우스 오버 후 서브메뉴 -->
					<a class="dropdown-item" href="#">회원정보관리</a> 
					<a class="dropdown-item" href="#">리뷰관리</a> 
					<a class="dropdown-item" href="#">예매관리</a>
				</div>
			</div>
			<div class="btn-group dropright">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>영화</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">영화정보관리</a> 
					<a class="dropdown-item" href="#">상영일정관리</a> 
					<a class="dropdown-item" href="#">박스오피스조회</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>극장</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">극장관리</a> 
					<a class="dropdown-item" href="#">상영관관리</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>스토어</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">스토어관리</a> 
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>고객센터</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">공지사항</a> 
					<a class="dropdown-item" href="#">자주묻는질문</a> 
					<a class="dropdown-item" href="#">1:1문의</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>이벤트</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">이벤트관리</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown">
					<h5>결제관리</h5>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">영화 결제 관리</a>
					<a class="dropdown-item" href="#">스토어 결제 관리</a>
				</div>
			</div>
		</div>
	</div>
</div>
