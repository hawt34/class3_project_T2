<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록 폼</title>
<!-- 부트스트랩 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
</script>
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css" onsubmit="return confirm('FAQ를 등록하시겠습니까?');">
</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mb-4">FAQ등록</h4>
			<form class="validation-form" novalidate action="admin_faq_pro" method="post">
				<select name="faq_category">
					<option value="" >유형선택</option>
					<option value="예매/결제">예매/결제</option>
					<option value="영화관이용">영화관이용</option>
					<option value="쿠폰">쿠폰</option>
					<option value="스토어">스토어</option>
					<option value="홈페이지/모바일">홈페이지/모바일</option>
				</select>
				<div class="mb-3">
					<label for="movie_name">글제목</label> 
					<input type="text" id="movie_name" value="${faq.faq_subject }" name="faq_subject" class="form-control" required />
					<div class="invalid-feedback">글제목을 입력해주세요.</div>
				</div>
				<div class="mb-3">
					<label for="movie_story">내용</label> 
					<textarea id="movie_story" name="faq_content" class="form-control" rows="30" required></textarea>
					<div class="invalid-feedback">내용을 입력해주세요.</div>
				</div>

				<hr class="mb-4">
				
				<div class="mb-4" align="center">
					<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block" >
					<input type="reset" value="다시작성" class="btn btn-primary btn-lg btn-block" >
					<input type="button" value="돌아가기" class="btn btn-primary btn-lg btn-block" onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
<footer class="my-3 text-center text-small">
	<p class="mb-1">&copy; Boogi Movie</p>
</footer>
</div>
	<script>
	    window.addEventListener('load', () => {
	      const forms = document.getElementsByClassName('validation-form');
	
	      Array.prototype.filter.call(forms, (form) => {
	        form.addEventListener('submit', function (event) {
	          if (form.checkValidity() === false) {
	            event.preventDefault();
	            event.stopPropagation();
	          }
	
	          form.classList.add('was-validated');
	        }, false);
	      });
	    }, false);
 	</script>
</body>
</html>