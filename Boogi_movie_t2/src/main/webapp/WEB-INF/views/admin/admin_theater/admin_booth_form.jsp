<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 등록 폼</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<script type="text/javascript">
	$(function() {
		
		$("#selectTheater").change(function() {
			let domain = $("#selectTheater").val();
			$("#theater_name").val(domain);
			
			console.log("domain : " + domain)
			
		});
		
	});

</script>

</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">새 상영관 등록</h4>
				<form class="validation-form" novalidate action="admin_booth_pro" method="post" >
					<div class="mb-3">
						<label for="theater_name">극장 지점명</label> 
							<div class="input-group mb-3">
								<input type="text" id="theater_name" name="theater_name" class="form-control" required readonly />
								<label class="input-group-text" for="inputGroupSelect01">지점선택</label>
								<select class="form-select" id="selectTheater">
									<option>극장을 선택하세요</option>
									<c:forEach var="theater" items="${theaterList}"> 
										<option value="${theater.theater_name}">${theater.theater_name}</option>
									</c:forEach>
  								</select>
							</div>
						<div class="invalid-feedback">극장 지점명 입력해주세요.</div>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_code">상영관 번호</label>  -->
<!-- 							<div class="input-group mb-3">	 -->
<!-- 								<span class="input-group-text">자동 입력 값</span> -->
<!-- 								<input type="text" id="movie_code" name="screen_num" class="form-control" readonly/>  -->
<!-- 							</div>	 -->
<!-- 						<div class="invalid-feedback">상영관 번호 입력해주세요.</div> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_name">상영관 이름</label> 
							<div class="input-group mb-3">	
								<span class="input-group-text">관 번호</span>
								<input type="text" id="movie_name" name="screen_cinema_num"  class="form-control" required/> 
							</div>
						<div class="invalid-feedback">상영관 이름을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_createDate">상영관 크기</label>
						<div class="input-group mb-3">
							<span class="input-group-text" >최대 행(row, 숫자)</span>
							<input type="text" id="movie_createDate" name="screen_seat_row" class="form-control"  required />
						</div>	
						<div class="input-group mb-3">	
							<span class="input-group-text">최대 열(col, 알파벳)</span>
							<input type="text" id="movie_createDate" name="screen_seat_col" class="form-control" required />
						</div>
						<div class="invalid-feedback">상영관크기를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_genre">운영 상태</label> 
							<div class="input-group mb-3">	
								<span class="input-group-text">1 : 정상 / 2 : 휴관</span>
								<input type="text" id="movie_genre" name="screen_status" class="form-control" required/>
							</div>
							<div class="invalid-feedback">운영 상태를 입력해주세요.</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block">
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
	    
	    document.fr.onsubmit=function(){
			if(confirm("새 상영관을 등록하시겠습니까?")) {
				return true;
			} 
			
			return false;
		}
 	</script>
</body>
</html>