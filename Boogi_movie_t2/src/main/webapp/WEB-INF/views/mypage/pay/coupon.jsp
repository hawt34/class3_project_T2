<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_default.css">
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
			<div class="col-md-2">
				<jsp:include page="../inc/myp_aside.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<h2>쿠폰</h2>
				<hr>
				<!-- 탭 메뉴 -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
							data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
							aria-selected="true">쿠폰함</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
							data-bs-target="#myreview" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">사용내역</button>
					</li>
				</ul>
				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="userinfo" role="tabpanel"aria-labelledby="userinfo-tab">
						<table class="table table-hover" >
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">쿠폰 이름</th>
						      <th scope="col">번호</th>
						      <th scope="col">사용기간</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr  class="table-secondary">
						      <th scope="row">1</th>
							      <td>뫄뫄쿠폰</td>
							      <td>4568798541612</td>
							      <td>2024 / 04 / 01 ~ 2024 / 04 /30</td>
						    </tr>      
						    <tr>
						      <th scope="row">2</th>
						        <td>어쩌구쿠폰</td>
						        <td>5984513521651</td>
						        <td>2024 / 04 / 01 ~ 2024 / 04 /30</td>
						    </tr>
						    <tr  class="table-secondary">
						      <th scope="row">3</th>
					            <td>저쩌구쿠폰</td>
					            <td>7854126589561</td>
					            <td>2024 / 04 / 01 ~ 2024 / 04 /30</td>
					         </tr>
							<tr>
						      <th scope="row">4</th>
								<td>예예쿠폰</td>
			          			<td>37482937264930</td>
			            		<td>2024 / 04 / 01 ~ 2024 / 06 /30</td>
			          		</tr>
			          		<tr  class="table-secondary">
						      <th scope="row">5</th>
						      	<td>솨솨쿠폰</td>
				              	<td>559842654125</td>
								<td>2024 / 04 / 01 ~ 2024 / 06 /30</td>
			         		</tr>
			          		
			          		<tr>
						      <th scope="row">6</th>
			          			<td>다다쿠폰</td>
			            		<td>8852145657842</td>
					            <td>2024 / 04 / 01 ~ 2024 / 12 /31</td>
					          </tr>
						  </tbody>
						</table>
					</div><!-- tab-pane -->
					<div class="tab-pane fade" id="myreview" role="tabpanel"aria-labelledby="myreview-tab">
						<table class="table table-hover" >
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">쿠폰 이름</th>
						      <th scope="col">번호</th>
						      <th scope="col">사용일</th>
						      <th scope="col">사용경로</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr  class="table-secondary">
						      <th scope="row">1</th>
							      <td>뫄뫄쿠폰</td>
							      <td>4568798541612</td>
							      <td>2024 / 04 / 05</td>
							      <td>서면점</td>
						    </tr>      
						    <tr>
						      <th scope="row">2</th>
						        <td>어쩌구쿠폰</td>
						        <td>5984513521651</td>
						        <td>2024 / 03 / 29</td>
						        <td>아시아드점</td>
						    </tr>
						    <tr  class="table-secondary">
						      <th scope="row">3</th>
					            <td>저쩌구쿠폰</td>
					            <td>7854126589561</td>
					            <td>2024 / 03 / 05</td>
					            <td>서면점</td>
					         </tr>
							<tr>
						      <th scope="row">4</th>
								<td>예예쿠폰</td>
			          			<td>37482937264930</td>
			          			<td>2024 / 02 / 04</td>
			            		<td>삼정타워점</td>
			          		</tr>
			          		<tr  class="table-secondary">
						      <th scope="row">5</th>
						      	<td>솨솨쿠폰</td>
				              	<td>559842654125</td>
				              	<td>2024 / 01 / 19</td>
								<td>아시아드점</td>
			         		</tr>
			          		<tr>
						      <th scope="row">6</th>
			          			<td>다다쿠폰</td>
			            		<td>8852145657842</td>
			            		<td>2023 / 12 / 25</td>
					            <td>서면점</td>
					          </tr>
						  </tbody>
						</table>	
					</div><!-- tab-pane  -->
				</div><!-- tab-content -->
			</div><!-- col-md-10 box1 -->
		</div> <!-- row -->
	</div> <!-- container2 -->
</div> <!-- contanier1 -->
<footer>
	<jsp:include page="../inc/myp_footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>