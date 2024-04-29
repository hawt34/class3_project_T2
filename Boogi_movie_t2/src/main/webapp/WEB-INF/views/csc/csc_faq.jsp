<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<!-- 검색창 끝 -->
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
			<div class="csc_accordion" >
				<input type="checkbox" id="answer1">
				<label for="answer1">제목<em></em></label>
				<div><p>본문내용을 여기다 넣을 겁니다.
					꽁꽁얼어 붙은 한강 위로 고양이가 걸어다닙니다.</p> 
				</div>
				<input type="checkbox" id="answer2">
				<label for="answer2">제목<em></em></label>
				<div><p>본문내용을 여기다 넣을 겁니다.
					꽁꽁얼어 붙은 한강 위로 고양이가 걸어다닙니다.</p> 
				</div>
				<input type="checkbox" id="answer3">
				<label for="answer3">제목<em></em></label>
				<div><p>본문내용을 여기다 넣을 겁니다.
					꽁꽁얼어 붙은 한강 위로 고양이가 걸어다닙니다.</p> 
				</div>
			</div>
				
				
			<!-- 페이지네이션-페이징 -->
			<hr>
			
	
	
	
		</div>
	</div>
</div>
<!-- admin_footer.jsp -->
<div>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>