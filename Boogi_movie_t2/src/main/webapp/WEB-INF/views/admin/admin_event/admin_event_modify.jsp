<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록폼</title>
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
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">이벤트등록</h4>
				<form class="validation-form" novalidate action="admin_event_pro" method="post" onsubmit="return confirm('이벤트를 등록하시겠습니까?');">
					<div class="mb-3">
						<label for="event_title">이벤트제목</label> 
						<input type="text" name="event_subject" id="event_title" class="form-control" required />
						<div class="invalid-feedback">이벤트 제목을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="event_sumnail">썸네일</label> 
						<input type="file" name="event_thumbnail" id="event_sumnail" class="form-control" required />
						<div class="invalid-feedback">이미지를 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="event_img">본문이미지</label> 
						<input type="file" id="event_img" class="form-control" required />
						<div class="invalid-feedback">이미지를 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="event_start_date">이벤트 시작일</label> 
						<input type="date" id="event_start_date" class="form-control" required>
						<div class="invalid-feedback">이벤트 시작일을 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="event_start_date">이벤트 종료일</label> 
						<input type="date" id="event_start_date" class="form-control" required>
						<div class="invalid-feedback">이벤트 종료일을 선택해주세요.</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block" >
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