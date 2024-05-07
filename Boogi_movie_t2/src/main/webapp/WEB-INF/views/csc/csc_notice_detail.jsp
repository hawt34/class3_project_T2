<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부기무비</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_notice_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
</script>

</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
<div class="container">
	<div class="row">
		<div class="col-2">
			<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
		</div>
		<div class="col-10">
			<h3>공지사항</h3>
			<hr>
			<div>
				<p>[부기무비] 메가박스 개인정보 처리방침 변경 안내</p>
				<p>문의 지점 | ${notice.theater_num}  부산센텀점 &nbsp;&nbsp;&nbsp; 작성일 | 2000-10-10
			</div>
			<hr>
			<div>
				<!-- 공지사항 content -->
			
			</div>
			<hr>
			<!-- 이전, 다음 페이징 -->
			<div>
				<span class="csc_paging"><a href="csc_notice_detail?notice_num=${notice_num - 1 }" 
					<c:if test="${notice_num eq 1 }">disabled</c:if>>이전</a>
				</span>
				<span class="csc_paging"><a href="csc_notice_detail?notice_num=${notice_num + 1 }"
					<c:if test="${notice_num eq maxNoticeNum }">disabled</c:if>>다음</a></span>
			</div>	
			<!-- 목록 버튼 -->
			<div class="csc_detail_button">
				<input type="button" value="목록" onclick="location.href='csc_notice'">
			</div>
		</div>
	</div>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>