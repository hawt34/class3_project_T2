<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<style>
main {
	width: 1400px;
	margin: 0 auto;
}

.event_title {
	text-align: left;
	margin: 30px 60px 0px;
	border-bottom: 3px solid lightgray;
}

* {
	box-sizing: border-box;
	padding: 0;
}

.container {
	display: flex;
	flex-flow: row wrap;
	align-content: flex-start;
}

/* item에 hidden 처리하기. */
.item {
	width: 350px;
	aspect-ratio: 10/6;
	position: relative;
 	overflow: hidden; 
	border-radius: 10px;
	margin: 10px 40px;
}

.item:after {
	/* block & content */
	display: block;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.2);
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	opacity: 0;
}

.imgBox {
	width: 100%;
	height: 100%;
	position: absolute;
}

.imgBox img {
	width: 100%;
	height: 100%;
	/* 사진이나 비디오의 규격 맞출 때 object-fit 이용하기. */
	object-fit: cover;
	z-index: 1;
}

.textBox {
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-items: flex-start;
	padding: 20px;
	z-index: 3;
}

.textBox p {
	color: white;
	margin: 5px 0 0;
}

.textBox_name {
	font-size: 16px;
	font-weight: 500;
	opacity: 0;
	transform: translateY(50px);
}

.textBox_price {
	font-size: 16px;
	font-weight: 400;
	opacity: 0;
	transform: translateY(50px);
}

/* 마우스 올렸을 때에 기능 추가하기. */
.item:hover:after {
	opacity: 1;
}

/* 기능 1 : 화면 살짝 불투명 + 화면 커지기. */
.item:hover .imgBox img {
	transform: scale(1.1);
	/* 블러 처리하기. */
	filter: blur(3px);
}

/* 기능 2 : 상품 정보 보이면서 위로 올라가기. */
.item:hover .textBox .textBox_name {
	opacity: 1;
	transform: translateY(0px);
}

/* 기능 2 : 상품 정보 보이면서 위로 올라가기. */
.item:hover .textBox .textBox_price {
	opacity: 1;
	transform: translateY(0px);
}

/* 자연스럽게 트랜지션 적용하기. */
.item:after, .item .imgBox img, .item .textBox_name, .item .textBox_price
	{
	transition: all 0.4s ease-in-out;
}
.event_cate_title{
	margin-top: 20px;
}
.btn{
	margin-right: 100px;
}

</style>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>
		<div class="event_title">
			<h2>이벤트페이지</h2>
		</div>
		<div class="event_cate_title">
			<h3>영화이벤트</h3>
		</div>
		<div align="right">
			<button type="button" class="btn btn-outline-primary" id="MovieShowMoreBtn">더 보기</button>
		</div>
		<div class="container">
			<c:forEach var="movieEvent" items="${movieEventList}" varStatus="loop">
				<div class="item movie-event" onclick="event_detail(${movieEvent.event_num})">
					<div class="imgBox">
						<img src="${pageContext.request.contextPath}/resources/images/${movieEvent.event_thumbnail}" alt="썸네일" onclick="location.href='eventDetail?event_num?=${movieEvent.event_num}'"/>
					</div>
					<div class="textBox">
						<p class="textBox_name">${movieEvent.event_subject}</p>
						<p class="textBox_price">${movieEvent.event_start}  ~  ${movieEvent.event_end}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="event_cate_title">
			<h3>극장이벤트</h3>
		</div>
		<div align="right">
			<button type="button" class="btn btn-outline-primary" id="TheaterShowMoreBtn">더 보기</button>
		</div>
		<div class="container">
			<c:forEach var="theaterEvent" items="${theaterEventList}"  varStatus="loop">
				<div class="item theater-event" onclick="event_detail(${theaterEvent.event_num})">
					<div class="imgBox">
						<img src="${pageContext.request.contextPath}/resources/images/${theaterEvent.event_thumbnail}" alt="썸네일" onclick="location.href='eventDetail?event_num?=${theaterEvent.event_num}'"/>
					</div>
					<div class="textBox">
						<p class="textBox_name">${theaterEvent.event_subject}</p>
						<p class="textBox_price">${theaterEvent.event_start}  ~  ${theaterEvent.event_end}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="event_cate_title">
			<h3>할인이벤트</h3>
		</div>
		<div align="right">
			<button type="button" class="btn btn-outline-primary" id="DiscountShowMoreBtn">더 보기</button>
		</div>
		<div class="container">
			<c:forEach var="discountEvent" items="${discountEventList}" varStatus="loop">
				<div class="item discount-event" onclick="event_detail(${discountEvent.event_num})">
					<div class="imgBox">
						<img src="${pageContext.request.contextPath}/resources/images/${discountEvent.event_thumbnail}" alt="썸네일" onclick="location.href='eventDetail?event_num?=${discountEvent.event_num}'"/>
					</div>
					<div class="textBox">
						<p class="textBox_name">${discountEvent.event_subject}</p>
						<p class="textBox_price">${discountEvent.event_start}  ~  ${discountEvent.event_end}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		function event_detail(event_num) {
			location.href='eventDetail?event_num=' + event_num;
		} 
	
		document.addEventListener("DOMContentLoaded", function() {
		    var movieEvents = document.querySelectorAll(".movie-event");
		    var MovieShowMoreBtn = document.getElementById("MovieShowMoreBtn");
		    var movieShowMore = false;

		    // 처음 3개의 아이템만 보이도록 설정
		    for (var i = 3; i < movieEvents.length; i++) {
		        movieEvents[i].style.display = "none";
		    }

		    // "더 보기" 버튼 클릭 시 추가 아이템 보이기
		    MovieShowMoreBtn.addEventListener("click", function() {
		        if (!movieShowMore) {
		            for (var i = 3; i < movieEvents.length; i++) {
		                movieEvents[i].style.display = "block";
		            }

		            movieShowMore = true;
		            MovieShowMoreBtn.textContent = "간략히 보기";
		        } else {
		            for (var i = 3; i < movieEvents.length; i++) {
		                movieEvents[i].style.display = "none";
		            }

		            movieShowMore = false;
		            MovieShowMoreBtn.textContent = "더 보기";
		        }
		    });
		});
		document.addEventListener("DOMContentLoaded", function() {
		    var TheaterEvents = document.querySelectorAll(".theater-event");
		    var showMoreButton = document.getElementById("TheaterShowMoreBtn");
		    var theaterShowMore = false;

		    // 처음 3개의 아이템만 보이도록 설정
		    for (var i = 3; i < TheaterEvents.length; i++) {
		    	TheaterEvents[i].style.display = "none";
		    }

		    // "더 보기" 버튼 클릭 시 추가 아이템 보이기
		    showMoreButton.addEventListener("click", function() {
		        if (!theaterShowMore) {
		            for (var i = 3; i < TheaterEvents.length; i++) {
		            	TheaterEvents[i].style.display = "block";
		            }

		            theaterShowMore = true;
		            showMoreButton.textContent = "간략히 보기";
		        } else {
		            for (var i = 3; i < TheaterEvents.length; i++) {
		            	TheaterEvents[i].style.display = "none";
		            }

		            theaterShowMore = false;
		            showMoreButton.textContent = "더 보기";
		        }
		    });
		});
		document.addEventListener("DOMContentLoaded", function() {
		    var DiscountEvents = document.querySelectorAll(".movie-event");
		    var showMoreButton = document.getElementById("DiscountShowMoreBtn");
		    var discountShowMore = false;

		    // 처음 3개의 아이템만 보이도록 설정
		    for (var i = 3; i < movieEvents.length; i++) {
		        movieEvents[i].style.display = "none";
		    }

		    // "더 보기" 버튼 클릭 시 추가 아이템 보이기
		    showMoreButton.addEventListener("click", function() {
		        if (!discountShowMore) {
		            for (var i = 3; i < DiscountEvents.length; i++) {
		            	DiscountEvents[i].style.display = "block";
		            }

		            discountShowMore = true;
		            showMoreButton.textContent = "간략히 보기";
		        } else {
		            for (var i = 3; i < DiscountEvents.length; i++) {
		            	DiscountEvents[i].style.display = "none";
		            }

		            discountShowMore = false;
		            showMoreButton.textContent = "더 보기";
		        }
		    });
		});
	</script>

</body>
</html>