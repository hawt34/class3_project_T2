<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록폼</title>
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
<style>

body {
	min-height: 50vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">예매내역 상세페이지</h4>
				<form class="validation-form" novalidate action="#" method="post">
					<div class="mb-3">
						<label for="pay_num">결제번호</label> 
						<input type="text" id="pay_num" class="form-control" placeholder='결제번호' readonly />
					</div>
					<div class="mb-3">
						<label for="res_code">예매코드</label> 
						<input type="text" id="res_code" class="form-control" placeholder='예매코드' readonly />
					</div>
					<div class="mb-3">
						<label for="member_id">회원ID</label> 
						<input type="text" id="member_id" class="form-control" placeholder='여기아이디' readonly />
					</div>
					<div class="mb-3">
						<label for="movie_name">영화명</label> 
						<input type="text" id="movie_name" class="form-control"  placeholder='영화명' readonly />
					</div>
					<div class="mb-3">
						<label for="res_date">상영일</label> 
						<input type="text" id="res_date" class="form-control"  placeholder='상영일+회차' readonly />
					</div>
					<div class="mb-3">
						<label for="res_theaterInfo">극장정보</label> 
						<input type="text" id="res_theaterInfo" class="form-control"  placeholder='화명점/3관' readonly />
					</div>
					<div class="mb-3">
						<label for="res_seatInfo">예매좌석</label> 
						<input type="text" id="res_seatInfo" class="form-control"  placeholder='D3' readonly  />
					</div>
					<div class="mb-3">
						<label for="pay_bill">결제금액</label> 
						<input type="text" id="pay_bill" class="form-control"  placeholder='35,000' readonly />
					</div>
					<div class="mb-3">
						<label for="pay_status">결제상태</label> 
						<input type="text" id="pay_status" class="form-control"  placeholder='결제완료' readonly />
					</div>
							
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
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