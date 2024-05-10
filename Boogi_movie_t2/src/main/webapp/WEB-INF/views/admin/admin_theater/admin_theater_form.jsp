<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 등록 폼</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">새 극장 등록</h4>
				<form class="validation-form" novalidate action="admin_theater_pro" method="post" onsubmit="return confirm('극장을 등록하시겠습니까?');">
					<div class="mb-3">
						<label for="movie_name">극장명</label> 
						<input type="text" id="movie_name" class="form-control" required maxlength="30"/>
						<div class="invalid-feedback">극장명을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">극장 주소</label> 
						<input type="text" id="movie_director" class="form-control" required maxlength="100"/>
						<div class="invalid-feedback">극장 주소를 입력해주세요.</div>
					</div>
					<div class="mb-3"> 
						<label for="movie_director">극장 좌표</label> 
						<div style="display: flex;">
							<input type="text" id="movie_director" class="form-control" required placeholder="X 좌표" 
								pattern="^[0-9][.]{10,15}$" title="double 타입"  style="width: 300px; margin-right: 30px;" />
							<input type="text" id="movie_director" class="form-control" required  placeholder="Y 좌표" 
								pattern="^[0-9][.]{10,15}$" title="double 타입"  style="width: 300px;"/>
						</div>
						<div class="invalid-feedback">극장 좌표를 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">층 정보</label> 
						<input type="text" id="movie_director" class="form-control" required maxlength="200"/>
						<div class="invalid-feedback">층 정보를 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">주차 정보</label> 
						<input type="text" id="movie_director" class="form-control" required maxlength="800"/>
						<div class="invalid-feedback">주차 정보를 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">주차 요금</label> 
						<input type="text" id="movie_director" class="form-control" required maxlength="500"/>
						<div class="invalid-feedback">주차 요금을 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">버스 교통 정보</label> 
						<input type="text" id="movie_director" class="form-control" maxlength="300"/>
						<div class="invalid-feedback">버스 교통 정보를 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">지하철 교통 정보</label> 
						<input type="text" id="movie_director" class="form-control" maxlength="200"/>
						<div class="invalid-feedback">지하철 교통 정보를 입력하세요</div>
					</div>
					<div class="mb-3">
						<label for="movie_genre">운영시간</label> 
						<input type="text" id="movie_genre" class="form-control" required maxlength="200" />
						<div class="invalid-feedback">운영시간을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_genre">운영상태</label> 
						<input type="text" id="movie_genre" class="form-control" required maxlength="200" pattern="^[0-9]$" title="int 타입"/>
						<div class="invalid-feedback">운영상태를 입력해주세요. (1 = 정상운영, 2 = 미운영 상태)</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="수정하기" class="btn btn-primary btn-lg btn-block" onclick="submitAlert()">
						<input type="reset" value="다시 작성" class="btn btn-primary btn-lg btn-block" >
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
			confirm("극장정보를 등록하시겠습니까?");	
		}
 	</script>
</body>
</html>