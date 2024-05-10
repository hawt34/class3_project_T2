<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 공지사항관리</title>
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
<link href="${pageContext.request.contextPath}/resources/css/admin_list.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>
	<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
		<div class="row">
			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_movie_head">
					<div class="admin_movie_title">공지사항관리</div>
					<div class="admin_movie_search">
						<select>
							<option>필요할까</option>
							<option>상영상태</option>
						</select> 
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>공지사항번호</th>
								<th>공지사항제목</th>
								<th>공지사항등록일</th>
								<th>공지 구분</th>
								<th>극장 구분</th>
								<th>상세보기/수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty noticeList }">
									<tr>
										<td colspan="6"></td>
									</tr>
								</c:when>
								<c:otherwise>
								
									<c:forEach var="notice" items="${noticeList }">
										<tr>
											<td>${notice.notice_num }</td>
											<td onclick="location.href='admin_notice_detail?notice_num=${notice.notice_num}'">${notice.notice_subject }</td>
											<td>${notice.notice_fdt }</td>
											<td>${notice.notice_category }</td>
											<td>${notice.theater_name }</td>
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="location.href='admin_notice_modify?notice_num=${notice.notice_num}'">수정</button>
											</td>
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="admin_notice_withdraw(${notice.notice_num})">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="notice_pageArea">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" >
								<a class="page-link" href="admin_notice?pageNum=${pageNum - 1}" aria-label="Previous" >
								<span aria-hidden="true" >&laquo;</span>
								</a>
							</li>
							<c:forEach var="i" begin="${pageList.startPage }" end="${pageList.endPage }">
								<c:choose>
									<c:when test="${pageNum eq i }">
										<li class="page-item active"><a class="page-link">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="admin_notice?pageNum=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
								<a class="page-link" href="admin_notice?pageNum=${pageNum + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
				
				<div class="admin_movie_footer" align="center">
					<button onclick="admin_notice()">공지 등록</button>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function admin_notice_withdraw(num) {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="admin_notice_delete?notice_num=" + num;
			}
		}
		function admin_notice() {
			location.href="admin_notice_form";
		}
	</script>
	
	
</body>
</html>