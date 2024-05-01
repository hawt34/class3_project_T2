<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="theater-info">
		<h4>관람료</h4>
			<div class="row gx-5">
		    	<div class="col">
		    		<ul><li>2D</li></ul>
		      		<table class="table table-bordered">
				 		<thead>
					    	<tr class="table-secondary">
					    	<th scope="col">요일</th>
					    	<th scope="col">상영시간</th>
					    	<th scope="col">일반</th>
					    	<th scope="col">청소년</th>
					    	</tr>
				  		</thead>
						<tbody>
					    <tr>
					      <th scope="row" rowspan="2">월~목</th>
					      <td>조조(06:00~)</td>
					      <td>10,000</td>
					      <td>8,000</td>
					    </tr>
					    <tr>
					    	<td>일반(11:01~)</td>
					    	<td>13,000</td>
							<td>10,000</td>
					    </tr>
					    <tr>
					 		<th scope="row" rowspan="2">금~일<br>공휴일</th>
					     	<td>조조(06:00~)</td>
					      	<td>11,000</td>
					      	<td>8,000</td>
					    </tr>
					    <tr>
					    	<td>일반(11:01~)</td>
					      	<td>15,000</td>
					     	<td>12,000</td>
					    </tr>
					  </tbody>
				</table>
		    </div>
		    <div class="col">
				<ul><li>3D</li></ul>
				<table class="table table-bordered">
					<thead>
						<tr class="table-secondary">
							<th scope="col">요일</th>
							<th scope="col">상영시간</th>
							<th scope="col">일반</th>
							<th scope="col">청소년</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" rowspan="2">월~목</th>
							<td>조조(06:00~)</td>
							<td>12,000</td>
							<td>10,000</td>
						</tr>
					    <tr>
					    	<td>일반(11:01~)</td>
					    	<td>15,000</td>
							<td>12,000</td>
					    </tr>
					    <tr>
					 		<th scope="row" rowspan="2">금~일<br>공휴일</th>
					     	<td>조조(06:00~)</td>
					      	<td>13,000</td>
					      	<td>11,000</td>
					    </tr>
					    <tr>
					    	<td>일반(11:01~)</td>
					      	<td>17,000</td>
					     	<td>14,000</td>
					    </tr>
					</tbody>
				</table>
			</div>
		</div>
		<p>
		<h4>요금제</h4>
		<ul>
			<li>경로 만65세 이상 본인에 한함(신분증 확인)</li>
			<li>청소년 요금 만4세~ 만18세 : 미취학 아동~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인 가능 서류)</li>
			<li>48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능</li>
		</ul>
		<p>
		<h4>우대적용</h4>
		<ul>
			<li>부산 지역 주민 본인만 가능(신분증 확인)</li>
			<li>국가유공자 현장에서 국가유공자증을 소지한 본인만 가능</li>
			<li>장애인 현장에서 복지카드를 소지한 장애인(1급~3급까지 동반 1인까지 적용 / 4급~6급은 본인에 한함)</li>
			<li>미취학아동 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)</li>
			<li>소방종사자 공무원증을 소지하거나 정복을 입은 소방관 본인</li>
		</ul>
	</div>
</body>
</html>