<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csc_main.css">

</head>
<body>
<div class="container">
	<div class="row">
		<!-- 사이드바 영역 -->
		<div class="col-3">
			<div class="sideVar">
			<!--  사이드바 영역  -->
			<div class="admin_middle_left" align="center">
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
							<a class="dropdown-item" href="#">결제내역</a>
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
				</div>
			</div>
			</div>
		</div>
		<!-- content - csc 메인 화면 영역 -->
		<div class="col-9">
			<h1>고객센터 메인</h1>
			<hr>
		<div>
			<div id="csc_mainShort_title">자주 찾는 서비스</div>
			<hr>
			<div class="row">
				<div class="csc_ffs">
					<div class="csc_ffs_ps">
						<a href="#"><img src="images/bogiSad.png"><br>
						아이디/비밀번호<br>찾기</a>
					</div>
					<div class="csc_ffs_modify">
						<a href="#"><img src="images/bogiHappy.png"><br>
						회원정보<br>수정</a>
					</div>
					<div class="csc_ffs_ticketing">
						<a href="#"><img src="images/bogiLovely.png"><br>
						영화 예매</a>
					</div>
					<div class="csc_ffs_faq">
						<a href="#"><img src="images/bogiCurious.png"><br>
						자주 묻는<br> 질문</a>
					</div>
				</div>
			</div>
		</div>
		<!-- best 질문 / 공자 -->
		<div id="csc_mainShort_title">FAQ/공지사항</div>
		<hr>
		<div class="row">
			<!-- 질문 -->
			<div class="col">
				<div class="csc_main_notice">
					<div class="csc_main_sbt">
						자주묻는질문 Best <a href="#" id="the_plus">더 보기</a>
					</div> 
					<table class="csc_main_table">
						<tr>
							<td><a href="https://www.flaticon.com/kr/free-icons/-" title="번거 로움 무료 아이콘"></a>자주하는 질문</td>
						</tr>
						<tr>
							<td>--자주하는</td>
						</tr>
						<tr>
							<td>------질문!!-</td>
						</tr>
						<tr>
							<td>----더이상 물어보지</td>
						</tr>
						<tr>
							<td>-마이소!!--</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 공지 -->
			<div class="col">
			</div >
		
		
	</div>

</div>	
	

	
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>