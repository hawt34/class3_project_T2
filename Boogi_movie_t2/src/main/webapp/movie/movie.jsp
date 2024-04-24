<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/movie.css" rel="stylesheet" type="text/css">
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
			<jsp:include page="${pageContext.request.contextPath}/admin_header.jsp"></jsp:include>
		</header>
	<div id="wrap">
		
		<article>
			<video src="./home.mp4" autoplay muted>
			</video>
		</article>
		<section>
			<div class="content">
				<h1>현재 상영중 / 개봉 예정작</h1>
				<div class="list">
					<input type="button" value="뒤로">
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_1.jpg">
						<p>범죄도시</p>
						<input type="button" value="예매하기"> <input type="button"
							value="상세보기">
					</div>
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_2.jpg"> 팬더
					</div>
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_3.jpg">
					</div>
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_4.jpg">
					</div>
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_5.jpg">
					</div>
					<input type="button" value="앞으로">
				</div>
			</div>
			<div id="carouselExample" class="carousel slide">
				<h1>박스오피스 순위</h1>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/images/movie_1.jpg" class="d-block w-100" alt="..." >
						<div class="lank">
						 <img src="${pageContext.request.contextPath}/images/movie_1st.png">
<!-- 						 대충해놓음 -->
						 
						</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/images/movie_1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/images/movie_2.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExample" data-bs-slide="prev">
					 <img src="${pageContext.request.contextPath}/images/movie_left.png">
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExample" data-bs-slide="next">
					 <img src="${pageContext.request.contextPath}/images/movie_right.png">
				</button>
			</div>
	
	</section>
	<footer> 푸터 </footer>
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
</html>