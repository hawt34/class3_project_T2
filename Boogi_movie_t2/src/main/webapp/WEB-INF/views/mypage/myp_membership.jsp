<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_membership.css">
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
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>	<!-- col-md-2 사이드바  -->
			
			<div class="col-md-10 box1 w-75">
				<h2>멤버십</h2>
				<hr>
			
<!-- 			<div class=""> -->
				<blockquote class="bluejeans">
					<br>
					<h1><span class="Cbluejeans">VIP LOUNGE</span></h1>  
				</blockquote>
					<div class="text1"><h4>2024년 고객님의 회원등급은 VIP입니다.</h4></div>
				
				<div class="progress">
				  <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
				</div><!-- progress -->
				
				<div class="position-relative">
				  	<div class="position-absolute top-50 start-50 ">
						<section class="content">
							<div class="box bg-1 ">
									<button class="button button--ujarak " data-bs-toggle="modal" data-bs-target="#exampleModal">>> 나의 혜택</button>
							</div><!-- box bg-1  -->
							<!-- Modal -->
							<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">VIP 혜택</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div><!-- modal-header -->
							      <div class="modal-body">
								        VIP고객님 취향에 따라 쿠폰 선택이 가능한 맞춤형 온라인 쿠폰북<br>
										상영일 이전 예매 5%, 상영일 당일 예매 3% 적립<br>
										매주 수요일 영화 관람 시 추가 포인트 적립<br>
										선정기준(12,000점)달성 시 다음 달초 부터 영화 관람 추가 포인트 적립<br>
										VIP 고객님이 직접 설정한 기념일에 영화 관람 시 혜택 증정<br>
										VIP 고객님의 법적 생년월일 기준 혜택 증정<br>
							      </div><!-- modal-body -->
							      <div class="modal-footer">
		        					<div class="box bg-1 ">
										<button class="button button--ujarak " data-bs-toggle="modal" data-bs-dismiss="modal" >닫기</button>
									</div><!-- box bg-1 -->
							      </div><!--modal-footer  -->
							      
							    </div><!-- modal-content -->
							  </div> <!-- modal-dialog -->
							</div><!-- modal fade 모달 div 끝 -->
						</section>
					</div><!-- position-absolute top-50 start-50 translate-middle -->
				</div><!-- position-relative -->
			</div><!-- col-md-10 box1 w-50 -->
		</div> <!-- row -->
		
		<div class="row">
			<div class="col-md-2"> 
			</div>
			<div class="col-md-10">
				<!-- 탭 메뉴 -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
							data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
							aria-selected="true">등급별 혜택</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
							data-bs-target="#myreview" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">선정기준</button>
					</li>
				</ul>
			
				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="userinfo" role="tabpanel"aria-labelledby="userinfo-tab">
						<table class="table2 table table-hover" >
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">SVIP</th>
						      <th scope="col">VVIP</th>
						      <th scope="col">RVIP</th>
						      <th scope="col">VIP</th>
						      
						    </tr>
						  </thead>
						  <tbody>
						    <tr  class="table-primary">
						      <th scope="row">온라인 쿠폰북</th>
							      <td>영화 무료쿠폰 14매<br>
									매점 무료쿠폰 7매<br>
									매점 할인쿠폰 5매<br>
									포토플레이 무료쿠폰 96매</td>
							      <td>영화 무료쿠폰 12매<br>
									매점 무료쿠폰 5매<br>
									매점 할인쿠폰 4매<br>
									포토플레이 무료쿠폰 12매</td>
							      <td>영화 무료쿠폰 9매<br>
									매점 무료쿠폰 5매<br>
									매점 할인쿠폰 4매<br>
									포토플레이 무료쿠폰 8매</td>
							      <td>영화 무료쿠폰 3매<br>
									포토플레이 무료쿠폰 4매</td>
						    </tr>      
						    <tr>
						      <th scope="row">포인트 반값 할인</th>
						        <td>등급 기간 내 30매</td>
						        <td>등급 기간 내 20매</td>
						        <td>등급 기간 내 10매</td>
						        <td>등급 기간 내 5매</td>
						    </tr>
						    <tr  class="table-primary">
						      <th scope="row">VIP 더블적립</th>
			          			<td>3% / 5%</td>
					            <td>3% / 5%</td>
					            <td>3% / 5%</td>
					            <td>3% / 5%</td>
					         </tr>
					         
							<tr>
						      <th scope="row">VIP 리필적립</th>
					            <td>5%</td>
								<td>3%</td>
			            		<td>1%</td>
			            		<td>-</td>
			          		</tr>
			          		
			          		<tr  class="table-primary">
						      <th scope="row">스페셜데이</th>
				              	<td>에이드 2잔 무료</td>
				              	<td>에이드 2잔 무료</td>
				              	<td>에이드 2잔 무료</td>
				              	<td>-</td>
			         		</tr>
			          		
			          		<tr>
						      <th scope="row">생일혜택</th>
			            		<td>생일 콤보 무료</td>
			            		<td>생일 콤보 무료</td>
			            		<td>생일 콤보 무료</td>
			            		<td>생일 콤보 무료</td>
					          </tr>
						  </tbody>
						</table>
					</div><!-- tab-pane fade show active -->
					
					
					<div class="tab-pane fade" id="myreview" role="tabpanel"aria-labelledby="myreview-tab">
						<textarea class="textarea1" rows="13" cols="110" readonly>	
						
						SVIP
						선정 :5년 연속 VVIP 고객 중 등급유지기간 내 14,000점 달성 고객
						유지 :SVIP 고객 중 등급유지기간 내 18,000점 달성 고객
						
						VVIP
						선정 :① 3년 연속 RVIP 고객 중 등급유지기간 내 12,000점 달성 고객
						OR ② RVIP 1~2년차 고객 중 등급유지기간 내 52,000점 달성 시
						선정월로부터 1년뒤 조기승급 (고객별 선정월 상이)
						유지 :VVIP 1~4년차 고객 중 등급유지기간 내 14,000점 달성 고객
						
						RVIP
						선정 :① VIP 고객 중 등급유지기간 내 (승급후 1년) 12,000점 달성 고객
						OR ② VIP 승급 전후로 최근 1년간 VIP점수 30,000점 달성 시 다음달 즉시 조기승급
						유지 :RVIP 1~2년차 고객 중 등급유지기간 내 12,000점 달성 고객
						
						VIP
						선정 :일반고객 중 최근 1년간 VIP점수
						10,000점 달성 고객
							
						</textarea>
					</div> <!-- tab-pane fade show active -->
				</div><!-- tab-content -->
			</div><!-- col-md-10 -->
		</div><!-- row -->
		
		
	</div><!-- container2 -->
</div><!-- container1 -->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>