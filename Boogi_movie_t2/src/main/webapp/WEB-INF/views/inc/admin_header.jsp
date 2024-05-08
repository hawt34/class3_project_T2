<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 링크 -->
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
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Kaushan+Script&display=swap');

.kaushan-script-regular {
	font-family: "Gowun Dodum", sans-serif;
	font-style: normal;
	font-weight: bold;
}

.header {
	background: white;
	border-bottom: 3px solid #151619;
}

.header_top {
	margin: 0px auto;
	padding: 20px 200px;
	width: 1600px;
}
.header_top > a{
	font-size: 20px;
	font-weight: bold;
}

.col-md-2>img {
	width: 150px;
}

.col-md-5>img {
	width: 800px;
}

.header_middle {
	padding: 20px 0px;
	width: 1900px;
	margin: 0px auto;
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
.header_low{
	display: flex;
	width: 1200px;
	margin: 0px auto;

}
.dropdown {
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

.cursor-pointer {
    cursor: pointer;
}
.header_middle_title > .col-md-1 {
	width: 230px;
}
.header_middle_title > .col-md-2 {
	width: 300px;
}
.header_middle_title > .col-md-5 {
	width: 800px;
}
.header_middle_title {
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>

	<div class="header">
		<!--  여기가 헤더 탑 로그인 자리 -->
		<div align="right" class="header_top">
			<c:choose>
				<c:when test="${empty sId}">
					<a href="member_login"> | &nbsp; 로그인 &nbsp; | </a> 
				</c:when>
				<c:otherwise>
					<a onclick="member_logout()" class="cursor-pointer"> | &nbsp; 로그아웃 &nbsp; | </a> 
				</c:otherwise>
			</c:choose>
			<c:if test="${empty sId}">
					<a href="member_pre_reg_member"> &nbsp; 회원가입 &nbsp; | </a> 
			</c:if>
				
			<c:if test="${sId eq 'admin'}">
				<a href="admin_main"> &nbsp; 관리자페이지 &nbsp; | </a>
			</c:if>
		</div>
			
			
		<!--  부기무비 타이틀 영역 -->
		<div class="header_middle">
			<div class="header_middle_title">
				<div class="col-md-1"></div>
				<div class="col-md-2" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/boogi_front.png" width="200px">
				</div>
				<div class="col-md-5" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/boogi_title.png" onclick="location.href='./'">
				</div>
				<div class="col-md-2" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/boogi_front.png">
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>

		<!--  여기 부턴 헤더 네비바 영역 -->
		<div class="header_low" align="center">
			<div class="dropdown">
				<button class="dropdown-btn" onclick="location.href='movie'">영화</button>
				<div class="dropdown-submenu">
					<a href="movie">현재상영작</a> <a href="movieFuture">상영예정작</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn" onclick="location.href='theater'">극장</button>
				<div class="dropdown-submenu">
					<a href="theater_detail">해운대점</a> <a href="theater_detail">센텀점</a> <a href="theater_detail">서면점</a>
					<a href="theater_detail">남포점</a> <a href="theater_detail">부산대점</a> <a href="theater_detail">사직점</a>
					<a href="theater_detail">영도점</a> <a href="theater_detail">덕천점</a> <a href="theater_detail">정관점</a> <a href="theater_detail">사상점</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">예매</button>
				<div class="dropdown-submenu">
					<a href="tic_ticketing">빠른예매</a> <a href="#none">상영스케줄</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn" onclick="location.href='myp_main'">마이페이지</button>
				<div class="dropdown-submenu">
					<a href="myp_reservation">예매내역</a> <a href="myp_cancel">취소내역</a> <a href="myp_point">포인트 내역</a>
					<a href="myp_coupon">쿠폰</a> <a href="myp_oto_breakdown">문의내역</a> <a href="myp_info_modify">회원정보수정</a> <a href="myp_withdraw_info">회원탈퇴</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn" onclick="location.href='csc_main'">고객센터</button>
				<div class="dropdown-submenu">
					<a href="csc_notice">공지사항</a> <a href="csc_faq">자주묻는질문</a> <a href="csc_oto">1:1문의</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn" onclick="location.href='event'">이벤트</button>
				<div class="dropdown-submenu">
					<a href="event">이벤트코너</a> 
					<a href="boogi_store">스토어</a> 
				</div>
			</div>
		</div>
	</div>


<script>
	function member_logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="member_logout_pro";
		}
	}

</script>
</body>
</html>