<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_point.css">
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
	<jsp:include page="inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
		
			<div class="col-md-2">
				<jsp:include page="sidebar/sidebar.jsp"></jsp:include>
			</div>	<!-- col-md-2 사이드바  -->
			
			<div class="col-md-10">
				<h2>포인트</h2>
				<hr>
				<!-- 탭 메뉴 -->
				
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
							data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
							aria-selected="true">적립내역</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
							data-bs-target="#myreview" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">사용내역</button>
					</li>
					<div class="col-md-2 selectbox1">
						<select class="form-select form-select-sm" aria-label=".form-select-sm example">
						  <option selected>최근 1주일</option>
						  <option value="1">최근 1개월</option>
						  <option value="2">최근 3개월</option>
						</select>
					</div>
					
					
				</ul>
				
								
					<!-- 내용 -->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="userinfo" role="tabpanel"aria-labelledby="userinfo-tab">
						<table class="table2 table table-hover" >
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">구매 구분</th>
						      <th scope="col">구매 극장</th>
						      <th scope="col">적립일</th>
						      <th scope="col">적립</th>
						      
						    </tr>
						  </thead>
						  <tbody>
						    <tr  class="table-primary">
						      <th scope="row">1</th>
							      <td>매표</td>
							      <td>서면점</td>
							      <td>2024 / 04 / 24</td>
							      <td>750점</td>
						    </tr>      
						    <tr>
						      <th scope="row">2</th>
						        <td>매표</td>
						        <td>삼정타워점</td>
						        <td>2024 / 04 / 01</td>
						        <td>540점</td>
						    </tr>
						    <tr  class="table-primary">
						      <th scope="row">3</th>
			          			<td>매점</td>
					            <td>삼정타워점</td>
					            <td>2024 / 04 / 01</td>
					            <td>120점</td>
					         </tr>
					         
							<tr>
						      <th scope="row">4</th>
					            <td>매표</td>
								<td>아시아드</td>
			            		<td>2024 / 02 / 18</td>
			            		<td>820점</td>
			          		</tr>
			          		
			          		<tr  class="table-primary">
						      <th scope="row">5</th>
				              	<td>매표</td>
				              	<td>아시아드</td>
				              	<td>2024 / 02 / 08</td>
				              	<td>430점</td>
			         		</tr>
			          		
			          		<tr>
						      <th scope="row">6</th>
			            		<td>매점</td>
			            		<td>아시아드</td>
			            		<td>2024 / 02 / 08</td>
			            		<td>250점</td>
					          </tr>
						  </tbody>
						</table>
						</div><!-- tab-pane -->
						<div class="tab-pane fade" id="myreview" role="tabpanel"aria-labelledby="myreview-tab">
							<textarea class="textarea1" rows="13" cols="110" readonly>
ㅇㅇ							
						</textarea>		
							
						</div><!-- tab-pane  -->
					</div><!-- tab-content -->
			
			
			
			
			</div><!-- col-md-10 -->
		</div><!-- row -->
	</div><!-- container2 -->
</div><!-- container1 -->
	
			
			
			
			
			
			
			
			
			
			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>