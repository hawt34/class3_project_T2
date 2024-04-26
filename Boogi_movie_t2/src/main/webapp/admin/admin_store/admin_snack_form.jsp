<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스낵 등록폼</title>
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
				<h4 class="mb-4">스낵등록</h4>
				<form class="validation-form" novalidate action="#" method="post">
					<div class="mb-3">
						<label for="movie_code">스낵코드</label> 
						<input type="text" id="movie_code" class="form-control" required />
						<div class="invalid-feedback">스낵코드를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_createDate">스낵종류</label> 
						<input type="text" id="movie_createDate" class="form-control" required />
						<div class="invalid-feedback">스낵종류를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_name">스낵명</label> 
						<input type="text" id="movie_name" class="form-control" required />
						<div class="invalid-feedback">스낵명을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">판매가격</label> 
						<input type="text" id="movie_director" class="form-control" required />
						<div class="invalid-feedback">판매가격을 입력해주세요.</div>
					</div>
					<div class="col-md-8 mb-3">
						<label for="root">운영상태</label> <select
							class="custom-select d-block w-100" id="root">
							<option value="상영상태">판매중</option>
							<option value="개봉예정작">미판매</option>
						</select>
						<div class="invalid-feedback">운영상태를 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_stillCut1">스낵이미지1</label> 
						<input type="text" id="movie_stillCut1" class="form-control" required />
						<div class="invalid-feedback">스낵이미지를 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_stillCut2">스낵이미지2</label>  &nbsp; (필수 아님) 
						<input type="text" id="movie_stillCut2" class="form-control" />
					</div>
					<div class="mb-3">
						<label for="movie_stillCut3">스낵이미지3</label>  &nbsp; (필수 아님)
						<input type="text" id="movie_stillCut3" class="form-control" />
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block" >
						<input type="reset" value="다시작성" class="btn btn-primary btn-lg btn-block" >
						<input type="button" value="돌아가기" class="btn btn-primary btn-lg btn-block" onclick="window.close()">
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