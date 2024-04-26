<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/boogi_store.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<header>
<%-- 		<jsp:include page="/inc/admin_header.jsp"></jsp:include> --%>
	</header>
	<div id="wrap">
		<article>
			<img src="${pageContext.request.contextPath}/resources/images/boogi_store_hello1.jpg">
			<div class="container">
				<div class="neon">BOOGI</div>
				<div class="flux">STORE</div>
			</div>
		</article>
		<section>
			<div class="content">
				<h1>부기 스낵</h1>
				<div class="snackList">
					<div class="snack1">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_popcorn.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="snack2">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_cola.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="snack3">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_popCol.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="snack4">
						<img src="${pageContext.request.contextPath}/images/boogi_store_chi.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
				</div>
				<h1>부기굿즈</h1>
				<div class="goodsList">
					<div class="goods1">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_bo1.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="goods2">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_small.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="goods3">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_eco.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
					<div class="goods4">
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_key.jpg" style="width: 300px; height: 200px">
						<div class="buttons">
							<input type="button" value="장바구니"> 
							<input type="button" value="결제하기">
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer> 푸터 </footer>
	</div>

</body>
</html>