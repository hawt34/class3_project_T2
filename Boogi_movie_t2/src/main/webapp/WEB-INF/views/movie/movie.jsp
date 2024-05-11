<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/movie.css"	rel="stylesheet" type="text/css"> --%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
/*  	border: 1px solid skyblue; */
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

article {
	position: relative;
	width: 1400px;
	height: 800px;
/* 	background-color: #ffd54f; */
}

article video {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 100%;
	max-height: 100%;
}

section {
	width: 100%;
	height:700px; 
/* 	background-color : #ffca28; */
	overflow-y: scroll;
	
	
}
 
 section h1 {
 	position: relative;
    text-align: center; /* 가운데 정렬 */
    font-size: 32px; /* 폰트 크기 수정 */
    width: 100%; /* 너비 조정 */
/*     height: 40px; */
	white-space: nowrap; 
}

.nowMovie {
	width: 100%;
	height: 100px;
}
.nowMovie .btn{
	margin-left: 30px; 
	font-size: 40px;
	white-space: nowrap;
}

.list {
	width:1350px;
	margin-left:20px;
	margin-top: 10px;
	display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
}
.movie {
	text-align: center;
}

.movie img {
	padding: 30px;
	width: 280px;
	height: 400px;
	display: flex;
}
footer {
	width: 1400px;
	height: 100px;
/* 	background-color: #ffb300; */
}

</style>


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
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href=''">상영 중인 영화찾기</button>
			</div>
			<div class="list">
			<c:forEach var="movie" items="${movieInfo}" varStatus="loop" begin="0">
    		<div class="movie">
            <img src="${movie.movie_poster}">
            <p>${movie.movie_name}</p>
            <input type="hidden" class="movie_num" name="movie_num" value="${movie.movie_num}">
            <button type="button" class="btn btn-outline-primary">예매하기</button>
            <button type="button" class="btn btn-outline-primary detail_button">상세보기</button>
    		</div>
			</c:forEach>
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
			$(".list").on("click", ".detail_button", function() {
				let movie_num = $(this).siblings(".movie_num").val();
				window.location.href = "movieInfo?movie_num=" + movie_num;
			});
		});
	</script>
</body>
</html>