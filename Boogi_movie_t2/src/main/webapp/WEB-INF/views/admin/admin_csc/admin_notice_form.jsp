<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록폼</title>
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
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">공지사항등록</h4>
				<form class="validation-form" novalidate action="admin_notice_pro" method="post" onsubmit="return confirm('공지를 등록하시겠습니까?');">
					<div class="mb-3">
						<label for="movie_director">작성자</label> 
						<input type="text" id="movie_director" class="form-control" required />
						<div class="invalid-feedback">작성자를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_name">글제목</label> 
						<input type="text" id="movie_name" class="form-control" required />
						<div class="invalid-feedback">글제목을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_name">이미지</label> 
						<input type="text" id="movie_name" class="form-control" required />
						<div class="invalid-feedback">이미지를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_story">내용</label> 
						<textArea id="movie_story" class="form-control" rows="10px" required></textArea>
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