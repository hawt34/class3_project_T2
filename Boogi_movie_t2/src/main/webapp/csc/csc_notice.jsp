<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="row">
		<!--사이드바 영역  -->
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
		<!-- content 영역 - 게시판 형식의 공지/뉴스 -->
		<div class="col-9">
			<h1>공지사항</h1>
			<hr>
			<div class="row">
				<div class="col-1 mt-3">
					<span>전체 00건</span> 
				</div>
				<div class="col-11">
					<div class="csc_local">전체</div>
					<div class="csc_local">서면</div>
					<div class="csc_local">서면삼정타운</div>
					<div class="csc_local">아시아드</div>
					<div class="csc_local">센텀시티</div>
					<div class="csc_local">동래</div>
					<div class="csc_local">해운대</div>
					<div class="csc_local">서면 상상마당</div>
					<div class="csc_search">
						<input type="text" placeholder="검색어를 입력해주세요">
						<i class="bi bi-search searchIcon"></i>
					</div>
				</div>
			</div>
			<hr>
			<!-- 게시판 -->
			<div class="row">
				 <table>
					<thead>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>살라</td>
							<td>23살</td>
							<td>23살</td>
						</tr>
						<tr>
							<td>2</td>
							<td>김백수</td>
							<td>21살</td>
							<td>21살</td>
						</tr>
						<tr>
							<td>3</td>
							<td>홍길동</td>
							<td>25살</td>
							<td>25살</td>
						</tr>
						<tr>
							<td>4</td>
							<td>아무개</td>
							<td>20살</td>
							<td>20살</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 페이지네이션-페이징 -->
			<hr>
			<div class="row">
				<div>
				</div>
			</div>
		
		
		
		<!-- content 영역 -->
		</div>
	</div>
</div>


<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>

</body>
</html>