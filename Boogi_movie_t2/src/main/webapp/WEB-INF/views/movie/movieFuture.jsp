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
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movie'">현재
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
</html>