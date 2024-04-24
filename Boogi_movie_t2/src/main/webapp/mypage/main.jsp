<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_main.css">
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


<div class="container1">
	<div class="container2">
		<header>
			<jsp:include page="inc/admin_header.jsp"></jsp:include>
		</header>
	
		<div class="row">
			<div class="col-2">
				<jsp:include page="sidebar/sidebar.jsp"></jsp:include>
			</div>	
		
			<div class="col-10">
				<blockquote class="bluejeans">
					<br>
<!-- 					<h3><span class="Cbluejeans">김현경님</span></h3>   -->
<!-- 					<h4>2024년 고객님의 회원등급은 VIP입니다.</h4> -->
					<div class="main">
						<h3>김현경님</h3>
						<h4>2024년 고객님의 회원등급은 VIP입니다.</h4>
					</div>
				<section class="content">
					<div class="box bg-1">
						<button class="button button--ujarak " onclick="location.href='link.jsp'">회원정보수정</button>
					</div>
					<div class="box bg-1">
						<button class="button button--ujarak " onclick="location.href='link.jsp'">VIP라운지 바로가기</button>
					</div>
				</section>
				</blockquote>
			</div><!-- col-md-10 -->
		</div><!-- row -->
			
	<!-- 		<div class="col-md-6"> -->
	<!-- 			<div class="d-flex" style="margin-top: 15px; height: 250px;"> -->
	<!-- 				<div class="vr"></div> -->
	<!-- 			</div> -->
				
				
				
	<!-- 	</div>row box1 -->
		
		<hr>
		<div class="row">
			<div class="col-md-8 box2">
				<h2>예매내역</h2>
				<table class="table2 table table-hover " >
					
	
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">영화</th>
				      <th scope="col">날짜</th>
				      <th scope="col">시간</th>
				      <th scope="col">극장</th>
				      <th scope="col">가격</th>
				      
				    </tr>
				  </thead>
				  <tbody>
				    <tr  class="table-primary">
				      <th scope="row">1</th>
					      <td>듄2</td>
					      <td>2024 / 04 / 16</td>
					      <td>17:00 ~ 19:20</td>
					      <td>서면</td>
					      <td>15,000원</td>
				    </tr>      
				    <tr>
				      <th scope="row">2</th>
				        <td>아바타3</td>
				        <td>2024 / 03 / 29</td>
				        <td>18:20 ~ 20:15</td>
				        <td>서면</td>
				        <td>15,000원</td>
				    </tr>
				    <tr  class="table-primary">
				      <th scope="row">3</th>
			            <td>토이스토리</td>
			            <td>2024 / 01 / 18</td>
			            <td>21:10 ~ 23:10</td>
			            <td>서면</td>
			            <td>12,000원</td>
			         </tr>
			         
					<tr>
				      <th scope="row">4</th>
						<td>파묘</td>
	          			<td>2024 / 03 / 18</td>
	            		<td>12:10 ~ 14:30</td>
	           			<td>아시아드</td>
	            		<td>12,000원</td>
	          		</tr>
	          		
	          		<tr  class="table-primary">
				      <th scope="row">5</th>
				      	<td>폴라익스프레스</td>
		              	<td>2013 / 12 / 25</td>
						<td>21:00 ~ 23:10</td>
		            	<td>아시아드</td>
		            	<td>9,000원</td>
	         		</tr>
	          		
	          		<tr>
				      <th scope="row">6</th>
	          			<td>엘리멘탈</td>
	            		<td>2023 / 10 / 29</td>
			            <td>19:35 ~ 22:10</td>
			            <td>삼정타워</td>
			            <td>12,000원</td>
			          </tr>
				  </tbody>
				</table>
			</div><!-- col-md-8 box2 -->
			<div class="col-4 col-md-4">
			
				<h2>MY 극장</h2>
					<div class="list-group">
				
					  <a href="#" class="list-group-item list-group-item-action" aria-current="true">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">서면</h5>
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small>And some small print.</small>
					  </a>
					  
					  <a href="#" class="list-group-item list-group-item-action">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">아시아드</h5>
			<!-- 		      <small class="text-body-secondary">3 days ago</small> -->
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small class="text-body-secondary">And some muted small print.</small>
					  </a>
					  
					  <a href="#" class="list-group-item list-group-item-action">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">삼정타워</h5>
			<!-- 		      <small class="text-body-secondary">3 days ago</small> -->
					    </div>
					    <p class="mb-1">Some placeholder content in a paragraph.</p>
					    <small class="text-body-secondary">And some muted small print.</small>
					  </a>
		<!-- 		  	<div class="list-group list1"> -->
			
		<!-- 				<a href="#" class=" list-group-item list-group-item-action form-control-lg">서면</a> -->
		<!-- 				<a href="#" class=" list-group-item list-group-item-action form-control-lg">아시아드</a> -->
		<!-- 				<a href="#"  class=" list-group-item list-group-item-action form-control-lg">삼정타워</a> -->
		
		<!-- 			</div> -->
					</div><!-- list-group -->
			</div><!-- col-4 col-md-4-->
		</div> <!-- row -->
	</div><!-- container2 -->
</div><!-- container -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

