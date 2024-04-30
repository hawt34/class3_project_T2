<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/movie_info1.css" rel="stylesheet" type="text/css">
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
			<iframe width="1400px" height="600px"  src="https://www.youtube.com/embed/ft70sAYrFyY?si=mh2AS2Sw3V2Lfhh2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</article>
		<section>
			<div class="content">
				<h1>영화 상세페이지</h1>
				<div class="list">
					<div class="movie">
						<img src="${pageContext.request.contextPath}/resources/images/movie_2.jpg">
						<button type="button" class="btn btn-outline-primary">예매하기</button>
					</div>
					<div class="movieInfo">
						<ul>
							<li><span>기본 정보 : </span> </li>
							<li><span>개봉 : 	</span>  </li>
							<li><span>감독 : </span></li>
							<li><span>배우 : </span> </li>
							<li><span>등급 : </span> </li>
							<li><span>총관객수 : </span></li>
						</ul>
						
						<h2>팬더의 핵펀치!</h2>
						<button type="button" class="btn btn-outline-primary">뒤로가기</button>
					</div>	
				</div>
			</div>
			<div class="reviewContents">
				<div class="star-rating">
				    <input type="radio" class="star" value="1">
    				<input type="radio" class="star" value="2">
				    <input type="radio" class="star" value="3">
				    <input type="radio" class="star" value="4">
				    <input type="radio" class="star" value="5">
				</div>
				<button type="button" class="btn btn-outline-primary">별점주기</button>
				<div class="review">
  				<label for="exampleFormControlTextarea1" class="form-label"></label>
  				<h2>관람평</h2>
  				<textarea class="form-control"  rows="3"  cols="2"></textarea>
				</div>	
				<button type="button" class="btn btn-outline-primary">저장하기</button>
			</div>
		</section>
		<footer> 
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>