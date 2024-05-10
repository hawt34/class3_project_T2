<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 등록폼</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">상영관 정보 수정</h4>
				<form class="validation-form" novalidate action="admin_booth_pro" method="post" onsubmit="return confirm('상영관을 등록하시겠습니까?');">
					<div class="mb-3">
						<label for="movie_code">극장명</label> 
						<input type="text" id="movie_code" class="form-control" required />
						<div class="invalid-feedback">극장명 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_code">상영관코드</label> 
						<input type="text" id="movie_code" class="form-control" required />
						<div class="invalid-feedback">상영관코드를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_name">상영관명</label> 
						<input type="text" id="movie_name" class="form-control" required />
						<div class="invalid-feedback">상영관명을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">상영관위치</label> 
						<input type="text" id="movie_director" class="form-control" required />
						<div class="invalid-feedback">상영관위치를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_createDate">상영관크기</label> 
						<input type="text" id="movie_createDate" class="form-control" required />
						<div class="invalid-feedback">상영관크기를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_genre">운영시간</label> 
						<input type="text" id="movie_genre" class="form-control" required />
						<div class="invalid-feedback">운영시간을 입력해주세요.</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block" onclick="submitAlert()">
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
	    
	    function submitAlert() {
			confirm("상영관정보를 등록하시겠습니까?");	
		}
 	</script>
</body>
</html>