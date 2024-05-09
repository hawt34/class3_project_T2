<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.col-md-6>select {
	width: 250px;
	padding: 5px;
	border: 1px solid #999;
	font-family: url('http://i.ibb.co/98Vbb8L/gnb-bg.gif') no-repeat 95% 50%;
	border-radius: 2px;
	-webkit-appearance: none;
	-mox-appearance: none;
	appearance: none;
	text-align: center;
}
.form-control{
	border: 1px solid #bbb;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">영화수정</h4>
				<form class="validation-form" novalidate action="admin_movie_edit_pro" method="post" onsubmit="return confirm('영화를 등록하시겠습니까?');">
					<div class="mb-3">
						<label for="movie_num">영화코드</label> 
						<input type="text" id="movie_num" name="movie_num" class="form-control" required value="${movie.movie_num}"/>
						<div class="invalid-feedback">영화코드를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_name">영화명</label> 
						<input type="text" name="movie_name" id="movie_name" class="form-control" required value="${movie.movie_name}" />
						<div class="invalid-feedback">영화명을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_director">감독</label> 
						<input type="text" name="movie_director" id="movie_director" class="form-control" required value="${movie.movie_director}"/>
						<div class="invalid-feedback">감독을 입력해주세요.</div>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_genre">장르</label>  -->
<%-- 						<input type="text" name="genre_num"  id="movie_genre" class="form-control" required value="${movie.genre_num'}" /> --%>
<!-- 						<div class="invalid-feedback">장르를 입력해주세요.</div> -->
<!-- 					</div> -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_runtime">상영시간</label>  -->
<!-- 						<input type="text" id="movie_runtime" class="form-control" required /> -->
<!-- 						<div class="invalid-feedback">상영시간을 입력해주세요.</div> -->
<!-- 					</div> -->
					<div class="row mb-3">
						<div class="col-md-6">
							<label for="movie_rate">관람등급</label> 
							<c:set var="movie_grade" value="${movie.movie_grade}" />
							<select class="custom-select d-block w-100" id="movie_rate" name="movie_grade" required>
								<option value="관람등급">관람등급을 선택하세요</option>
								<option <c:if test='${movie_grade eq "전체이용가"}'> selected </c:if> value="전체이용가">전체이용가</option>
								<option <c:if test='${movie_grade eq "12세"}'> selected </c:if> value="12세관람가">12세관람가</option>
								<option <c:if test='${movie_grade eq "15세"}'> selected </c:if> value="15세관람가">15세관람가</option>
								<option <c:if test='${movie_grade eq "19세"}'> selected </c:if> value="19세관람가">19세관람가</option>
							</select>
							<div class="invalid-feedback">관람등급을 입력해주세요.</div>
						</div>
						<div class="col-md-6">
							<label for="root">상영상태</label> 
							<c:set var="movie_status" value="${movie.movie_status}" />
							<select class="custom-select d-block w-100" id="root" name="movie_status" required>
								<option >상영상태를 선택하세요</option>
								<option <c:if test='${movie_status eq "개봉예정작"}'> selected </c:if> value="개봉예정작">개봉예정작</option>
								<option <c:if test='${movie_status eq "절찬상영중"}'> selected </c:if> value="절찬상영중">절찬상영중</option>
								<option <c:if test='${movie_status eq "상영종료"}'> selected </c:if> value="상영종료">상영종료</option>
							</select>
							<div class="invalid-feedback">상영상태를 선택해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="movie_startDate">개봉일</label> 
						<input type="date" name="movie_open_date" id="movie_startDate" class="form-control" required value="${movie.movie_open_date}"/>
						<div class="invalid-feedback">개봉일을 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_endDate">종영일</label> 
						<input type="date" id="movie_endDate" class="form-control" value="movie_date"/>
						<div class="invalid-feedback">종영일을 선택해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_poster">포스터</label> 
						<input type="text" name="movie_poster" id="movie_poster" class="form-control" required value="${movie.movie_poster}" />
						<div class="invalid-feedback">포스터를 선택해주세요.</div>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_stillCut1">스틸컷1</label>  -->
<%-- 						<input type="text" name="stillcut_num" id="movie_stillCut1" class="form-control" value="${movie.stillcut_num'}" /> --%>
<!-- 						<div class="invalid-feedback">스틸컷을 선택해주세요.</div> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_stillCut2">스틸컷2</label>  &nbsp; (필수 아님) 
						<input type="text" id="movie_stillCut2" class="form-control" />
					</div>
					<div class="mb-3">
						<label for="movie_stillCut3">스틸컷3</label>  &nbsp; (필수 아님)
						<input type="text" id="movie_stillCut3" class="form-control" />
					</div>
					<div class="mb-3">
						<label for="movie_trailer">트레일러</label> 
						<input type="text" name="movie_trailler" id="movie_trailer" class="form-control" required value="${movie.movie_trailler}" />
						<div class="invalid-feedback">트레일러를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_story">줄거리</label> 
						<textArea name="movie_summary" id="movie_story" class="form-control" rows="10px" required>${movie.movie_summary}</textArea>
						<div class="invalid-feedback">줄거리를 입력해주세요.</div>
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
	    
        // JavaScript Date 객체로 변환
        var movie_date = new Date("${movie.movie_open_date}");

        // 3개월을 더함
        movie_date.setMonth(date.getMonth() + 3);
 	</script>
</body>
</html>