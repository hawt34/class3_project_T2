<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
<div>
	<jsp:include page="header.jsp"></jsp:include>
</div>

<div class="container">
	<div class="row">
		<!-- 사이드바 영역 -->
		<div class="col-2">
			<jsp:include page="csc_sidebar.jsp"></jsp:include>
		</div>
		<!-- content - csc 메인 화면 영역 -->
		<div class="col-10">
			<h1>고객센터 메인</h1>
			<hr>
		<div>
			<div id="csc_mainShort_title">자주 찾는 서비스</div>
			<hr>
			<div class="row">
				<div class="csc_ffs">
					<div class="csc_ffs_ps">
						<a href="#" class="aTag"><img src="images/boogiSad.png"><br>
						아이디/비밀번호<br>찾기</a>
					</div>
					<div class="csc_ffs_modify">
						<a href="#"class="aTag"><img src="images/boogiHappy.png"><br>
						회원정보<br>수정</a>
					</div>
					<div class="csc_ffs_ticketing">
						<a href="#" class="aTag"><img src="images/boogiLovely.png"><br>
						영화 예매<br>결제</a>
					</div>
					<div class="csc_ffs_faq">
						<a href="#" class="aTag"><img src="images/boogiCurious.png"><br>
						자주 묻는<br> 질문</a>
					</div>
				</div>
			</div>
		</div>
		<!-- best 질문 / 공자 -->
		<div id="csc_mainShort_title">FAQ / 공지사항</div>
		<hr>
		<div class="row">
			<!-- 질문 -->
			<div class="col">
				<div class="csc_main_inquiry">
					<div class="csc_main_shortBox">
						자주묻는질문 Best <a href="#" class="the_plus">더 보기</a>
					</div>
					<div class="csc_shortBox_border">
						<ul class="csc_main_InquiryUl">
							<li>자기sdbbh자알~~sdsdsa~~</li>
							<li>ㄱ긴ㅇ른이릔ㅇ</li>
							<li>ㄴ르듸ㅣㅁㅁㄴ민ㄹ</li>
							<li>ㅣㅁ닝ㅁ늬임느이</li>
							<li>능ㄹㅈ배ㅐ;ㅣ;ㅣ;;;</li>
						</ul>
					</div> 
				</div>
			</div>
			<!-- 공지 -->
			<div class="col">
				<div class="csc_main_notice">
					<div class="csc_main_shortBox">
						최근 공지사항 <a href="#" class="the_plus">더 보기</a>
					</div>
					<div class="csc_shortBox_border">
						<ul class="csc_main_noticeUl">
							<li>자기자알~~~~</li>
							<li>ㄱ긴ㅇ른이릔ㅇ</li>
							<li>ㄴ르듸ㅣㅁㅁㄴ민ㄹ</li>
							<li>ㅣㅁ닝ㅁ늬임느이</li>
							<li>능ㄹㅈ배ㅐ;ㅣ;ㅣ;;;</li>
						</ul>
					</div> 
				</div>
			</div>
			</div>
		</div>
	</div>
</div>	
	

	
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>