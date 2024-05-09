<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
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
main {
	width: 1400px;
	margin: 0 auto;
}

.event_title {
	text-align: center;
	margin: 30px auto;
	margin-top: 50px;
}
.eventTable tr td{
	border: 3px solid #eee;
	
}
.eventTable{
	margin: 0 auto;
	width: 1200px;
	text-align: center;
	font-size: 20px;
}
tr{
	height: 60px;
}
td > img{
	width: 1200px;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>
		<div class="event_title">
			<h2>이벤트페이지</h2>
		</div>
		<hr>
		<table class="eventTable">
		<colgroup>
		<col style="background: #eee;">
		<col>
		<col style="background: #eee;">
		<col>
		</colgroup>
			<tr>
				<td>이벤트</td>
				<td colspan="3">${event.event_subject}</td>
			</tr>
			<tr>
				<td>등록날짜</td>
				<td><fmt:formatDate value="${event.event_reg_date}" pattern="yyyy-MM-dd"/></td>
				<td>이벤트기간</td>
				<td><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="4">
					<c:set var="original_event_image" value="${fn:substringAfter(event.event_image, '_')}"/>
					<c:if test="${not empty event.event_image}">
						<img alt="본문이미지" src="${pageContext.request.contextPath}/resources/images/${original_event_image}">
					</c:if>
				</td>
			</tr>
		</table>



	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>


</body>
</html>