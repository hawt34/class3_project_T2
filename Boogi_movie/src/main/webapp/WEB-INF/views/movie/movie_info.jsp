<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/movie_info.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">

		<article>
			<video src="./home.mp4" autoplay muted>
			</video>
		</article>
		<section>
			<div class="content">
				<h1>영화 상세페이지</h1>
				<div class="list">
					<div class="movie">
						<img src="${pageContext.request.contextPath}/images/movie_1.jpg">
						<input type="button" value="예매하기">
						<input type="button" value="상세보기">
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
						<input type="button" value="뒤로"> 
						<input type="button" value="앞으로">
					</div>	
				</div>
			</div>
			<div class="reviewContents">
				<div class="star">
					<h2>별점</h2>
				</div>
				<div class="review">
					<h2>리뷰</h2>
				</div>		
			</div>
		</section>
		<footer> 푸터 </footer>
	</div>

</body>
</html>