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
	<jsp:include page="inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row box1">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>	
			<div class="col-md-10">
				<h2>마이페이지</h2>
				<hr>
				<blockquote class="bluejeans">
					<br>
					<div class="main">
						<h3>김현경님</h3>
						<h4>2024년 고객님의 회원등급은 VIP입니다.</h4>
					</div>
					<section class="content">
						<div class="box col-6">
							<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='info_modify.jsp'">회원정보수정</button>
						</div>
						<div class="box col-6">
							<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='membership.jsp'">VIP라운지</button>
						</div>
					</section>
				</blockquote>
				<hr>
			</div><!-- col-md-10 -->
		</div><!-- row -->
		<div class="row ">
			<div class="col-md-2"> </div>
				<div class="col-md-7">
				<div class="row">
					<div class="col-10">
						<h2>예매내역</h2>
					</div>
					<div class="col-2 box2">
						<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='pay/pay1.jsp'">+ 더보기</button>
					</div>
				</div><!-- row -->
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
					    <tr  class="table-secondary">
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
					    <tr  class="table-secondary">
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
		          		<tr  class="table-secondary">
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
				</div><!-- col-md-7 -->
				<div class="col-md-3">
					<div class="row">
						<div class="col-10">
							<h2>MY 극장</h2>
						</div><!-- col-5 -->
						<div class="col-2">
							<img src="${pageContext.request.contextPath}/resources/images/myp_mytheater.png" data-bs-toggle="modal" data-bs-target="#exampleModal" width="25px" height="25px">
						</div><!-- col-7 -->
					</div>	<!-- row -->				
					<!-- Modal -->
					<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">자주가는 극장</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div><!-- modal-header -->
					      <div class="modal-body">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	서면
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	아시아드
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	삼정타워
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	롯데백화점서면
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	센텀시티
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  	해운대
							</div>
					      </div><!-- modal-body -->
					      <div class="modal-footer">
								<button type="button" class="btn btn-outline-primary btn-lg"  class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      </div><!--modal-footer  -->
					    </div><!-- modal-content -->
					  </div> <!-- modal-dialog -->
					</div><!-- modal fade 모달 div 끝 -->
					<ol class="list-group list-group-numbered" >
					  <li class="list-group-item d-flex justify-content-between align-items-start">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold ">서면</div>
					    </div>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-start">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">아시아드</div>
					    </div>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-start">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">삼정타워</div>
					    </div>
					  </li>
					</ol>
				</div><!-- col-md-3-->
		</div> <!-- row -->
	</div><!-- container2 -->
</div><!-- container -->



<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

