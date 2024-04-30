<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/boogi_store.css"
	rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">
		<section>
			<div class="content">
				<h1>부기 스낵</h1>
				<div class="snackList">
					<div class="snack1">
						<div class= "snack_name">부기 팝콘</div>
						<div class= "snack_info"><p>고소한 부기팝콘</p> 가격 개당 5000원</div>
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_pop.jpg">
						<select class="form-select" >
			 				<option selected>수량을 선택해주세요</option>
			  				<option value="1">1개</option>
			  				<option value="2">2개</option>
			  				<option value="3">3개</option>
			  				<option value="4">4개</option>
			  				<option value="5">5개</option>
			  				<option value="6">6개</option>
			  				<option value="4">7개</option>
			  				<option value="5">8개</option>
			  				<option value="6">9개</option>
			  			</select>	
						<div class="buttons">
							<button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">장바구니담기</button>
							<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  					<div class="offcanvas-header">
			    				<h5 class="offcanvas-title" id="offcanvasScrollingLabel">장바구니</h5>
			    				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  					</div>
			  					<div class="offcanvas-body">
									<div class="payBox" >
				 	 					<ul class="list-group list-group-flush">
				 	 						<li class="list-group-item">종목 및 합계</li>
  											<li class="list-group-item">부기 팝콘</li>
  											<li class="list-group-item">부기 콜라</li>
										    <li class="list-group-item">부기 세트</li>
										    <li class="list-group-item">합계</li>
										</ul>
				 	 				</div>
				 	 			</div>
			  					<button type="button" class="btn btn-outline-primary" onclick="">취소</button>
			    				<button type="button" class="btn btn-outline-primary">결제하기</button>	
							</div>
						</div>
					</div>
					<div class="snack2">
						<div class= "snack_name">부기 콜라</div>
						<div class= "snack_info"><p>시원한 부기콜라</p>  가격 개당 2000원</div>
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_col.jpg">
						<select class="form-select" >
			 				<option selected>수량을 선택해주세요</option>
			  				<option value="1">1개</option>
			  				<option value="2">2개</option>
			  				<option value="3">3개</option>
			  				<option value="4">4개</option>
			  				<option value="5">5개</option>
			  				<option value="6">6개</option>
			  				<option value="4">7개</option>
			  				<option value="5">8개</option>
			  				<option value="6">9개</option>
			  			</select>		
						<div class="buttons">
							<div class="buttons">
							<button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">장바구니담기</button>
							<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  					<div class="offcanvas-header">
			    				<h5 class="offcanvas-title" id="offcanvasScrollingLabel">장바구니</h5>
			    				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  				</div>
			  				<div class="offcanvas-body">
			  					<div class="payBox" >
				 	 					<ul class="list-group list-group-flush">
				 	 						<li class="list-group-item">종목 및 합계</li>
  											<li class="list-group-item">부기 팝콘</li>
  											<li class="list-group-item">부기 콜라</li>
										    <li class="list-group-item">부기 세트</li>
										    <li class="list-group-item">합계</li>
										</ul>
				 	 			</div>
			  					<button type="button" class="btn btn-outline-primary" onclick="">취소</button>
			    				<button type="button" class="btn btn-outline-primary">결제하기</button>	
			 	 			</div>
							</div>
							</div>
						</div>
					</div>
					<div class="snack3">
						<div class= "snack_name">부기 세트</div>
						<div class= "snack_info"><p>고소한 부기팝콘 +</p> <p>부기 콜라2잔</p> 세트 가격 8000원</div>
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_popCol.jpg">
						<select class="form-select" >
			 				<option selected>수량을 선택해주세요</option>
			  				<option value="1">1개</option>
			  				<option value="2">2개</option>
			  				<option value="3">3개</option>
			  				<option value="4">4개</option>
			  				<option value="5">5개</option>
			  				<option value="6">6개</option>
			  				<option value="4">7개</option>
			  				<option value="5">8개</option>
			  				<option value="6">9개</option>
			  			</select>	
						<div class="buttons">
							<button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">장바구니담기</button>
							<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  					<div class="offcanvas-header">
			    				<h5 class="offcanvas-title" id="offcanvasScrollingLabel">장바구니</h5>
			    				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  				</div>
			  				<div class="offcanvas-body">
			  					<div class="payBox" >
				 	 					<ul class="list-group list-group-flush">
				 	 						<li class="list-group-item">종목 및 합계</li>
  											<li class="list-group-item">부기 팝콘</li>
  											<li class="list-group-item">부기 콜라</li>
										    <li class="list-group-item">부기 세트</li>
										    <li class="list-group-item">합계</li>
										</ul>
				 	 				</div>
			  					<button type="button" class="btn btn-outline-primary" onclick="">취소</button>
			    				<button type="button" class="btn btn-outline-primary">결제하기</button>	
			 	 			</div>
							</div>
						</div>
					</div>
				</div>
				<div class="basket_buttons">
					<div class="buttons">
							<button class="btn btn-outline-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">장바구니 확인하기</button>
							<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  					<div class="offcanvas-header">
			    				<h5 class="offcanvas-title" id="offcanvasScrollingLabel"></h5>
			    				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  				</div>
			  				<div class="offcanvas-body">
			  					<div class="payBox" >
				 	 					<ul class="list-group list-group-flush">
				 	 						<li class="list-group-item">종목 및 합계</li>
  											<li class="list-group-item">부기 팝콘</li>
  											<li class="list-group-item">부기 콜라</li>
										    <li class="list-group-item">부기 세트</li>
										    <li class="list-group-item">합계</li>
										</ul>
				 	 				</div>
							 </div>
				</div>			 	 				
					<button type="button" class="btn btn-outline-primary">결제하기</button>
				</div>
			</div>
		</div>	
		</section>
		<footer> 
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include> 
		</footer>
	</div>

</body>
	<script>
 
	</script>
</html>