<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csc_faq.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">

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
	<!-- content 영역 - FAQ -->
	<div class="col-9">
		<div class="row">
			<h1>FAQ</h1>
		<hr>
		</div>
		<!-- 검색영역 -->
		<div class="row">
			<div class="csc_faq_search">
				<div class="inner">
					<form action="" method="get">
						<label for="csc_faq_search">빠른검색</label>
						<input type="text" id="csc_faq_search" name="csc_faq_search"
						placeholder="검색어 입력">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="csc_faq_sel">
				<select class="form-select form-select-sm w-25" aria-label="Small select example">
					<option selected>전체</option>
					<option value="영화예매">영화예매</option>
					<option value="영화">영화</option>
					<option value="맴버십">멤버십</option>
					<option value="극장">극장</option>
					<option value="회원">회원</option>
				</select>
			</div>
		</div>
		<hr>
		<!-- 자주묻는 질문 게시판 -->
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



	</div>
</div>
</div>
<script type="text/javascript" src="..//js/bootstrap.bundle.min.js"></script>
</body>
</html>