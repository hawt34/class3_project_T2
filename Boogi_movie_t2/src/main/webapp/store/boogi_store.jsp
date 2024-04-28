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
					<div class="pay">결제하기
						 <table id="cartTable" class="table-primary">
				             <thead>
						        <tr>
						            <th>빈칸</th>
						            <th>구매 수량</th>
						            <th>가 격</th>
						            <th>취소</th>
						            <th>열 5</th>
						        </tr>
						    </thead>
						    <tbody>
						        <tr>
						            <td>부기 팝콘</td>
						            <td>개</td>
						            <td>원</td>
						            <td>취소</td>
						        </tr>
						        <tr>
						            <td>부기 콜라</td>
						            <td>개</td>
						            <td>원</td>
						            <td>취소</td>
						        </tr>
						        <tr>
						            <td>부기 세트</td>
						            <td>개</td>
						            <td>원</td>
						            <td>취소</td>
						        </tr>
						        <tr>
						            <td>행 4, 열 1</td>
						            <td>행 4, 열 2</td>
						            <td>행 4, 열 3</td>
						            <td>행 4, 열 4</td>
						        </tr>
						        <tr>
						            <td>행 5, 열 1</td>
						            <td>행 5, 열 2</td>
						            <td>행 5, 열 3</td>
						            <td>행 5, 열 4</td>
						        </tr>
						    </tbody>
				        </table>
				        <div class="pay_buttons">
							<button type="button" class="btn btn-outline-primary">취소</button>
							<button type="button" class="btn btn-outline-primary">결제하기</button>
						</div>	
						</div>
					<div class="snack1">
						<div class= "snack_name">부기팝콘</div>
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
							<button type="button" class="btn btn-outline-primary">담기</button>
							<button type="button" class="btn btn-outline-primary">결제하기</button>
						</div>
					</div>
					<div class="snack2">
						<div class= "snack_name">부기콜라</div>
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
							<button type="button" class="btn btn-outline-primary">담기</button>
							<button type="button" class="btn btn-outline-primary">결제하기</button>
						</div>
					</div>
					<div class="snack3">
						<div class= "snack_name">부기세트</div>
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
							<button type="button" class="btn btn-outline-primary">담기</button>
							<button type="button" class="btn btn-outline-primary">결제하기</button>
						</div>
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