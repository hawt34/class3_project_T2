<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_pay1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
body { 
	font-family: "Noto Sans KR", sans-serif; 
	font-optical-sizing: auto;
	font-weight: 400;
	font-style: normal;
	
}


</style>
</head>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>



<div class="container1">
	<div class="container2">
		<div class="row">
			<div class="col-md-2 box1">
				<jsp:include page="../sidebar/sidebar.jsp"></jsp:include>
			</div><!-- sidebar1 -->
	<!-- 			<div class="col-10 top"> -->
	<!-- 			</div>top -->
				<!-- 탭 메뉴 -->
				<!-- 내용 -->
			<div class="col-md-10 box-in">
				<div class="row">
					<div class="col-10">
						<h2>예매내역</h2>
					</div>
					<div class="col-2">
<!-- 						<select> -->
<!-- 							<option selected>1주일</option> -->
<!-- 							<option value="1">1개월</option> -->
<!-- 							<option value="2">3개월</option> -->
<!-- 							<option value="3">기간 설정</option> -->
<!-- 						</select> -->
						<select class="form-select form-select-sm" aria-label=".form-select-sm example">
						  <option selected>최근 1주일</option>
						  <option value="1">최근 1개월</option>
						  <option value="2">최근 3개월</option>
						  <option value="3">기간 설정</option>
						</select>
					</div><!-- col-2 -->
				</div><!--  하위 row -->
				
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
							data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
							aria-selected="true">예매내역</button>
					</li>
				</ul>
				
				
				
					<div class="box2"> <!-- 첫번째 사진 -->
							<img src="${pageContext.request.contextPath}/resources/images/myp_img1.jpg" width="200px" height="250px">
					</div>	
					<div class="paybox1">
					<div class="col-md-4">
						<input class="form-control " type="text" value="영화 제목" aria-label="Disabled input example " disabled readonly>
						<h5>범죄도시</h5>
					</div>
					
					
					
					
					</div> <!-- 첫번째 예매칸 -->




					
					<hr>
					<div class="box2">
						<img src="${pageContext.request.contextPath}/resources/images/myp_img2.jpg" width="200px" height="250px">
					</div>	
					<hr>
					<div class="box2">
						<img src="${pageContext.request.contextPath}/resources/images/myp_img3.jpg" width="200px" height="250px">
					</div>	
					<hr>
					<div class="box2">
						<img src="${pageContext.request.contextPath}/resources/images/myp_img4.jpg" width="200px" height="250px">
					</div>	
				<hr>
			</div><!-- col-md-10 -->
		</div><!-- row box1 -->
	</div><!-- container2 -->
</div> <!-- container -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>