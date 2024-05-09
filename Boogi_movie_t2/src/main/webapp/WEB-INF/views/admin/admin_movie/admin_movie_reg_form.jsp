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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js" ></script>
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
				<h4 class="mb-4">영화등록</h4>
				<form class="validation-form" novalidate action="admin_movie_reg_pro" method="post" onsubmit="return confirm('영화를 등록하시겠습니까?');">
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_num">영화코드</label>  -->
<!-- 						<input type="text" name="movie_num" id="movie_num" class="form-control" required"/> -->
<!-- 						<div class="invalid-feedback">영화코드를 입력해주세요.</div> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_name">영화명</label> 
						<input type="text" name="movie_name" id="movie_name" class="form-control" required />
						<div class="invalid-feedback">영화명을 입력해주세요.</div>
						<div><button id="getMovie">영화불러오기</button></div>
					</div>
					<div class="mb-3">
						<label for="movie_director">감독</label> 
						<input type="text" name="movie_director" id="movie_director" class="form-control" readonly/>
					</div>
					<div class="mb-3">
						<label for="genre_num">장르</label> 
						<input type="text" name="genre_num" id="genre_num" class="form-control" readonly/>
					</div>
					<div class="mb-3">
						<label for="movie_grade">관람등급</label> 
						<input type="text" class="form-control" id="movie_grade" name="movie_grade" readonly >
					</div>
					<div class="mb-3">
						<label for="movie_runtime">상영시간</label> 
						<input type="text" class="form-control" id="movie_runtime" name="movie_runtime" readonly >
					</div>
					<div class="mb-3">
						<label for="movie_status">상영시간</label> 
						<input type="text" class="form-control" id="movie_status" name="movie_status" readonly >
					</div>
					<div class="mb-3">
						<label for="movie_open_date">개봉일</label> 
						<input type="date" name="movie_open_date" id="movie_open_date" class="form-control"  />
						<div class="invalid-feedback">개봉일을 선택해주세요.</div>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_endDate">종영일</label>  -->
<!-- 						<input type="date" id="movie_endDate" class="form-control" required /> -->
<!-- 						<div class="invalid-feedback">종영일을 선택해주세요.</div> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_poster">포스터</label> 
						<input type="text" name="movie_poster" id="movie_poster" class="form-control" required />
						<div class="invalid-feedback">포스터를 선택해주세요.</div>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_stillCut1">스틸컷1</label>  -->
<!-- 						<input type="text" name="stillcut_num" id="movie_stillCut1" class="form-control" required /> -->
<!-- 						<div class="invalid-feedback">스틸컷을 선택해주세요.</div> -->
<!-- 					</div> -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_stillCut2">스틸컷2</label>  &nbsp; (필수 아님)  -->
<!-- 						<input type="text" id="movie_stillCut2" class="form-control" /> -->
<!-- 					</div> -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_stillCut3">스틸컷3</label>  &nbsp; (필수 아님) -->
<!-- 						<input type="text" id="movie_stillCut3" class="form-control" /> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_trailer">트레일러</label> 
						<input type="text" name="movie_trailler" id="movie_trailer" class="form-control" required />
						<div class="invalid-feedback">트레일러를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="movie_story">줄거리</label> 
						<textArea  name="movie_summary" id="movie_story" class="form-control" rows="10px" required></textArea>
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
	    
	    window.onload = function(){
	    	var btnGetMovie = document.getElementById('getMovie');
	    	
	    	btnGetMovie.onclick = function(){
	    		
	    		var movieNm = $('#movie_name').val();
	    		
	    		$.ajax({    
	    			type : 'get',           // 타입 (get, post, put 등등)    
	    			url : 'https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888&movieNm=' + movieNm,           // 요청할 서버url    
	    			  
	    			// dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)    
	    			//data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)      
	    			//	"no" : no,      
	    			//	"name" : name,      
	    			//	"nick" : nick    
	    			//}),    
	    			success : function(result) { // 결과 성공 콜백함수
	    			console.log(result);
	    				
	    			// 영화코드
    				var movieCode = result.movieListResult.movieList[0].movieCd;
    				//장르
    				$('#genre_num').val(result.movieListResult.movieList[0].repGenreNm);
					// 감독	    				
    				$('#movie_director').val(result.movieListResult.movieList[0].directors[0].peopleNm);
					// 개봉상태
    				$('#movie_status').val(result.movieListResult.movieList[0].prdtStatNm);

					//개봉일
    				let dateString = result.movieListResult.movieList[0].openDt;
    				let year = dateString.substring(0, 4);
    				let month = dateString.substring(4, 6);
    				let day = dateString.substring(6, 8);
    				let formattedDate = year + '-' + month + '-' + day;
    				
    				$('#movie_open_date').val(formattedDate);
    				
					$.ajax({
						type : 'get',
						url: 'https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=' + movieCode,           // 요청할 서버url
						
						success : function(result2) { // 결과 성공 콜백함수
						console.log(result2);
						// 영화등급
	    				$('#movie_grade').val(result2.movieInfoResult.movieInfo.audits[0].watchGradeNm);
						// 상영시간
	    				$('#movie_runtime').val(result2.movieInfoResult.movieInfo.showTm + "분");
						
						
						},
						error : function(request, status, error) { // 결과 에러 콜백함수        
		    				console.log(error)    
		    				
		    			}
						
					}) // inner ajax
	    				
	    			},    
	    			error : function(request, status, error) { // 결과 에러 콜백함수        
	    				console.log(error)    
	    			}
	    		}) // outter ajax
	    	}
	    } // window.onload
	    
 	</script>
</body>
</html>