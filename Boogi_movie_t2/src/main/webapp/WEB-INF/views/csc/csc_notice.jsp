<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	crossorigin="anonymous">
</script>
<style>
	th[colspan="4"] {
		text-align: center;
		font-size: 1.2em;
	}
</style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
<!-- main -->
<div class="container">
<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
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
					<span>전체 ${pageList.noticeCount }건</span>
				</div>
				
				<div class="col-11">
					<div class="csc_local">전체</div>
					<div class="csc_local">해운대점</div>
					<div class="csc_local">센텀점</div>
					<div class="csc_local">서면점</div>
					<div class="csc_local">남포점</div>
					<div class="csc_local">부산대점</div>
					<div class="csc_local">사직점</div>
					<div class="csc_local">영도점</div>
					<div class="csc_local">덕천점</div>
					<div class="csc_local">정관점</div>
					<div class="csc_local">사상점</div>
					
					<div class="csc_search">
						<!--공지 찾는 검색창  -->
						<form method="post" action="">
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
							<th>공지구분</th>
							<th>극장</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty noticeList }">
								<tr>
									<th colspan="4">게시물이 없습니다</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${noticeList }">
									<tr>
										<td>${notice.notice_num }</td>
										<td>${notice.notice_category}</td>
										<td>${notice.theater_name }</td>
										<td onclick="location.href='csc_notice_detail?notice_num=${notice.notice_num}'">${notice.notice_subject }</td>
										<td>${notice.notice_date }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 페이지네이션-페이징 -->
			<hr>
			
			<div class="notice_pageArea">
				<nav aria-label="Page navigation example" >
					<ul class="pagination">
						<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" >
							<a class="page-link" href="csc_notice?pageNum=${pageNum - 1}" aria-label="Previous" >
							<span aria-hidden="true" >&laquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="${pageList.startPage }" end="${pageList.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i }">
									<li class="page-item active"><a class="page-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="csc_notice?pageNum=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
							<a class="page-link" href="csc_notice?pageNum=${pageNum + 1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			


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