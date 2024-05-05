<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/movie.css"
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
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movie'">현재
					상영작</button>
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFuture'">상영예정작</button>
			</div>
			<div class="list">
				<div class="movie">
					<c:forEach var= "movie" items="${movieInfo}"> 
					<c:if test="${movie.movie_num eq 1}">					
					<img src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
					<p>${movie.movie_name}</p>
					<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
					<button type="button" class="btn btn-outline-primary">예매하기
					</button>
					<button type="button" class="btn btn-outline-primary detail_button" >상세보기
					</button>
					</c:if>
					</c:forEach>	
				</div>
				<div class="movie">
					<c:forEach var= "movie" items="${movieInfo}">
					<c:if test="${movie.movie_num eq 2}">
					<img  src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
					<p>${movie.movie_name}</p>
					<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
					<button type="button" class="btn btn-outline-primary">예매하기
					</button>
					<button type="button" class="btn btn-outline-primary detail_button" >상세보기
					</button>
					</c:if>
					</c:forEach>
				</div>
				<div class="movie">
					<c:forEach var= "movie" items="${movieInfo}">
					<c:if test="${movie.movie_num eq 3}">
					<img src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
					<p>${movie.movie_name}</p>
					<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
					<button type="button" class="btn btn-outline-primary">예매하기
					</button>
					<button type="button" class="btn btn-outline-primary detail_button" >상세보기
					</button>
					</c:if>
					</c:forEach>
				</div>
				<div class="movie">
					<c:forEach var= "movie" items="${movieInfo}">
					<c:if test="${movie.movie_num eq 4}">
					<img src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
					<p>${movie.movie_name}</p>
					<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
					<button type="button" class="btn btn-outline-primary">예매하기
					</button>
					<button type="button" class="btn btn-outline-primary detail_button" >상세보기
					</button>
					</c:if>
					</c:forEach>
				</div>
				<div class="movie">
					<c:forEach var= "movie" items="${movieInfo}">
					<c:if test="${movie.movie_num eq 5}">
					<img src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
					<p>${movie.movie_name}</p>
					<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
					<button type="button" class="btn btn-outline-primary">예매하기
					</button>
					<button type="button" class="btn btn-outline-primary detail_button" >상세보기
					</button>
					</c:if>
					</c:forEach>
				</div>
				
			</div>
			<div id="carouselExample" class="carousel slide">
				<h1>박스오피스 순위</h1>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/resources/images/movie_1.jpg" class="d-block w-100" alt="..." >
						<div class="carousel-caption">1st</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/movie_2.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption">2rd</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/movie_3.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption">3rd</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#carouselExample" data-bs-slide="prev">
					<img src="${pageContext.request.contextPath}/resources/images/movie_left.png">
				</button>
				<button class="carousel-control-next" type="button"	data-bs-target="#carouselExample" data-bs-slide="next">
					<img src="${pageContext.request.contextPath}/resources/images/movie_right.png">
				</button>
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
	<script type="text/javascript">
	$(document).ready(function() {
	    // 상세보기 버튼 클릭 이벤트 처리
	    $(".detail_button").click(function() {
	        // 클릭된 버튼의 부모 요소에서 movie_num 값을 가져와서 상세보기 페이지의 URL에 파라미터로 추가하여 전달
	        let movieNum = $(this).closest(".movie").find("#movie_num").val();
	        window.location.href = "movieInfo?movie_num=" + movieNum;
	    });
	});
	</script>
</body>
</html>