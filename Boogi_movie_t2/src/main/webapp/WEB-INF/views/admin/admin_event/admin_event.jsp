<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 이벤트관리</title>
<link href="../admin_main/admin_main.css" rel="stylesheet">
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

		<div class="row">

			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_movie_head">
					<div class="admin_movie_title">이벤트관리</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>이벤트코드</th>
								<th>제목</th>
								<th>이벤트타입</th>
								<th>등록일</th>
								<th>이벤트기간</th>
								<th>상세보기</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="event" items="${eventList}">
								<tr>
									<td>${event.event_num}</td>
									<td>${event.event_subject}</td>
									<td>
										<c:choose>
											<c:when test="${event.event_type_num eq 1}">
												영화이벤트
											</c:when>
											<c:when test="${event.event_type_num eq 2}">
												극장이벤트
											</c:when>
											<c:when test="${event.event_type_num eq 3}">
												할인이벤트
											</c:when>
										</c:choose>
									</td>
									
									<td>
										<fmt:formatDate value="${event.event_reg_date}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd" /> ~
										<fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<button type="button" class="btn btn-outline-primary" onclick="eventEdit(${event.event_num})">상세보기</button>
									</td>
									<td>
										<button type="button" class="btn btn-outline-primary" onclick="eventWithdraw(${event.event_num})">삭제</button>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<br>
					<br>
				<div class="admin_movie_footer" align="center">
					<button onclick="eventForm()">이벤트 등록</button>
				</div>
				
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function eventForm() {
			location.href = "admin_event_form";
		}
		function eventEdit(event_num) {
			location.href = "admin_event_modify?event_num=" + event_num;
		}
		function eventWithdraw(event_num) {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "admin_event_delete?event_num=" + event_num;
			}		 
		}
	
	
	</script>
</body>
</html>