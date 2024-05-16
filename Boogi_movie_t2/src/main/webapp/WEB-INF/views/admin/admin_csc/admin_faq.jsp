<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - FAQ관리</title>
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
<style type="text/css">

</style>
</head>
<body>
	<c:set var="pageNum" value="${empty pageNum ? 1 : param.pageNum }" />
	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>
	<main>
		<div class="row">
			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_movie_head">
					<div class="admin_movie_title">FAQ관리</div>
				</div>
				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>FAQ번호</th>
								<th>유형</th>
								<th>제목</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty faqList }" >
								<tr><td align="center">게시물이 없습니다</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="faq" items="${faqList }">
										<tr>
											<td>${faq.faq_num }</td>
											<td>${faq.faq_category }</td>
											<td>${faq.faq_subject }</td>
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="faqModify(${faq.faq_num})">수정</button>
											</td>
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="faqDelete()">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				<div class="admin_movie_footer" align="center">
					<button onclick="location.href='admin_faq_form'">FAQ 등록</button>
				</div>
				<div class="notice_pageArea">
					<nav aria-label="Page navigation example" >
						<ul class="pagination">
							<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" >
								<a class="page-link" href="admin_faq?pageNum=${pageNum - 1}" aria-label="Previous" >
								<span aria-hidden="true" >&laquo;</span>
								</a>
							</li>
							<!-- 페이지번호 생성 -->
							<c:forEach var="i" begin="${pageList.startPage }" end="${pageList.endPage }">
								<c:choose>
									<c:when test="${pageNum eq i }">
										<li class="page-item active"><a class="page-link" >${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="admin_faq?pageNum=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
								<a class="page-link" href="admin_faq?pageNum=${pageNum + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>

				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function faqModify(num) {
			location.href="admin_faq_modify?faq_num=" + num;
		}
		function faqDelete() {
			if(comfirm("정말 삭제하시겠습니까?")) {
				location.href="admin_faq_delete";
			}
		}
	
	
	</script>
</body>
</html>