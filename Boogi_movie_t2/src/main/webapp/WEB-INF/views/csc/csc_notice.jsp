<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_notice.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
<!-- main -->
<div class="container">
	<div class="row">
		<!--사이드바 영역  -->
		<div class="col-2">
			<jsp:include page="csc_sidebar.jsp"></jsp:include>	
		</div>
		<!-- content 영역 - 게시판 형식의 공지/뉴스 -->
		<div class="col-10">
			<div id="csc_mainTitle">
				<h1>공지사항</h1>
			</div>
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
						<!--공지 찾는 검색창  -->
						<form method="post">
							<input type="text" placeholder="검색어를 입력해주세요"> 
								<i class="bi bi-search searchIcon"></i>
							<div class="csc_searcher">
								<input type="submit" value="검색">
							</div>
						</form>
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
				
			</div>
			<!-- 페이지네이션 끝 -->


		</div>
	</div>
</div>
<!-- footer -->
<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>