<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
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
main {
	width: 1400px;
	margin: 0 auto;
}

.event_title {
	text-align: center;
	margin: 30px auto;
	margin-top: 50px;
}

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

.container {
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
	align-content: flex-start;
}

/* item에 hidden 처리하기. */
.item {
	width: 300px;
	aspect-ratio: 10/6;
	position: relative;
 	overflow: hidden; 
	border-radius: 10px;
	margin: 30px 0px;
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

.textBox__name {
	font-size: 22px;
	font-weight: 500;
	opacity: 0;
	transform: translateY(50px);
}

.textBox__price {
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
.item:hover .textBox .textBox__name {
	opacity: 1;
	transform: translateY(0px);
}

/* 기능 2 : 상품 정보 보이면서 위로 올라가기. */
.item:hover .textBox .textBox__price {
	opacity: 1;
	transform: translateY(0px);
}

/* 자연스럽게 트랜지션 적용하기. */
.item:after, .item .imgBox img, .item .textBox__name, .item .textBox__price
	{
	transition: all 0.4s ease-in-out;
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
		<hr>
		<div class="container">
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum2.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum2.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum2.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum2.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
			<div class="item">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/resources/images/event_sum.jpg" alt="썸네일" />
				</div>
				<div class="textBox">
					<p class="textBox__name">팝콘할인해줘! 이벤트</p>
					<p class="textBox__price">극장이벤트</p>
				</div>
			</div>
		</div>



	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>


</body>
</html>