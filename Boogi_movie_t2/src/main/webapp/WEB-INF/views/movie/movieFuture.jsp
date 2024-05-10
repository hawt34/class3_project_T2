<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/movieFuture.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">
		<article>
			<video src="${pageContext.request.contextPath}/resources/home.mp4"
				autoplay muted>
			</video>
		</article>
		<section>
			<div class="nowMovie">
				<button id="showFutureMovies" type="button" class="btn btn-outline-primary">현재
					상영작</button>
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFuture'">상영예정작</button>
			</div>
			<div class="list">
				<div class="movie">
					<img src="${pageContext.request.contextPath}/resources/images/movieF1.jpg">
					<p>범죄의 재구성</p>
					<button type="button" class="btn btn-outline-primary">찜하기
					</button>
					<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFutureInfo1'">상세보기
					</button>
				</div>
				<div class="movie">
					<img
						src="${pageContext.request.contextPath}/resources/images/movieF2.jpg">
					<p>다크 나이트</p>
					<button type="button" class="btn btn-outline-primary">찜하기
					</button>
					<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFutureInfo2'">상세보기
					</button>
				</div>
				<div class="movie">
					<img src="${pageContext.request.contextPath}/resources/images/movieF3.jpg">
					<p>노팅힐</p>
					<button type="button" class="btn btn-outline-primary">찜하기
					</button>
					<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFutureInfo3'">상세보기
					</button>
				</div>
				<div class="movie">
					<img src="${pageContext.request.contextPath}/resources/images/movieF4.jpg">
					<p>쇼생크탈출</p>
					<button type="button" class="btn btn-outline-primary">찜하기
					</button>
					<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFutureInfo4'">상세보기
					</button>
				</div>
				<div class="movie">
					<img src="${pageContext.request.contextPath}/resources/images/movieF5.jpg">
					<p>타짜</p>
					<button type="button" class="btn btn-outline-primary">찜하기
					</button>
					<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFutureInfo5'">상세보기
					</button>
				</div>
			</div>
			<div id="movieList">
    <!-- 여기에 영화 목록이 표시될 것입니다 -->
</div>
		</section>
		<footer>
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
$(document).ready(function(){
    // 버튼에 클릭 이벤트를 추가합니다.
    const settings = {
        async: true,
        crossDomain: true,
        url: 'https://api.themoviedb.org/3/movie/upcoming?language=ko&page=1',
        method: 'GET',
        headers: {
            accept: 'application/json',
            Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTAzYWI2NWEyZWVkNGY2NjM2MjUyMWM5Y2NmYzg0YiIsInN1YiI6IjY2MTBkNjAwMTEwOGE4MDE2NDhjMjA4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BgI_9gW8Nd9HTb07uqQuWAP9-Lahow2QO9WQi_mxXmc'
        }
    };

    // Ajax 요청을 수행합니다.
    $.ajax(settings).done(function (response) {
        console.log(response);
        // 원하는 동작을 수행합니다. 예를 들어, 응답 데이터를 화면에 표시할 수 있습니다.
        
        let htmlString = '<table><thead><tr><th>제목</th><th>개봉일</th></tr></thead><tbody>';
        response.results.forEach(function(movie) {
            htmlString += '<tr><td>' + movie.title + '</td><td>' + movie.release_date + '</td></tr>';
        });
        htmlString += '</tbody></table>';

        // 영화 목록을 표시할 영역에 HTML을 삽입합니다.
        $('#movieList').html(htmlString);
    });
});
</script>
</html>