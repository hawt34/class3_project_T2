<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_faq.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</div>
<div class="container">
	<div class="row">
		<!-- 사이드바 영역 -->
		<div class="col-md-2">
			<jsp:include page="csc_sidebar.jsp"></jsp:include>		
		</div>
		<!-- content 영역 - FAQ -->
		<div class="col-md-10">
			<div class="row">
				<div id="csc_mainTitle">
					<h1>FAQ</h1>
				</div>
			<hr>
			</div>
			<!-- 검색창 -->
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
			<!-- 검색창 끝 -->
			<!-- 구분 카테고리 시작 -->
			<div class="row mt-3">
				<div class="csc_faq_sel">
					<select id="faq_category" name="faq_category" class="form-select form-select-sm w-25" aria-label="Small select example">
						<option selected>전체</option>
						<option value="예매/결제">예매/결제</option>
						<option value="영화관이용">영화관이용</option>
						<option value="쿠폰">쿠폰</option>
						<option value="스토어">스토어</option>
						<option value="홈페이지/모바일">홈페이지/모바일</option>
					</select>
				</div>
			</div>
			<hr>
			<!-- 자주묻는 질문 게시판 -->
			<div class="csc_accordion" >
				<c:choose>
					<c:when test="${empty faqList }">
						<div align="center">faq 게시물이 없습니다</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="faq" items="${faqList }" varStatus="status">
							<input type="checkbox" id="answer${status.index + 1 }">
							<label for="answer${status.index + 1}"><span class="faq_category">[${faq.faq_category}]</span> ${faq.faq_subject }<em></em></label>
							<div>
								<span><em></em>ANSWER</span><br>
								<p>${faq.faq_content }</p> 
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
<!-- 				<input type="checkbox" id="answer2"> -->
<!-- 				<label for="answer2">제목<em></em></label> -->
<!-- 				<div><p>본문내용을 여기다 넣을 겁니다. -->
<!-- 					꽁꽁얼어 붙은 한강 위로 고양이가 걸어다닙니다.</p>  -->
<!-- 				</div> -->
<!-- 				<input type="checkbox" id="answer3"> -->
<!-- 				<label for="answer3">제목<em></em></label> -->
<!-- 				<div><p>본문내용을 여기다 넣을 겁니다. -->
<!-- 					꽁꽁얼어 붙은 한강 위로 고양이가 걸어다닙니다.</p>  -->
<!-- 				</div> -->
				
				
			<!-- 페이지네이션-페이징 -->
			<hr>
			
	
	
	
		</div>
	</div>
</div>
<!-- admin_footer.jsp -->
<div>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
//마지막 스크롤 값 저장
let lastScroll = 0;

$(function() {
	//현재 스크롤 값
	let currentScroll = $(this).scrollTop();
// 	console.log(currentScroll);
	
	// 문서 전체 길이
	let documentHeight = $(document).height();
// 	console.log(documentHeight);
// 	console.log($(window).height);
	
	// 현재 스크롤 값 + 현재 화면의 높이 값
	let nowHeight = $(this).scrollTop() + $(window).height();
// 	console.log(nowHeight);
	
	if(currentScroll > lastScroll) {
		if(documentHeight < currentScroll + documentHeight*0.1) {
			
		}
	}
	
	
	
	
	
	
	
	
	
});

</script>
</body>
</html>