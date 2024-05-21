<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="theater_info">
		<h4 class="text-primary">관람료</h4>
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
						    	<th scope="col">우대/경로</th>
					    	</tr>
				  		</thead>
						<tbody>
					    <tr>
					      <th scope="row" rowspan="2">월~목</th>
					      <td>조조</td>
					      <td id="2DWDMTNP"></td>
					      <td id="2DWDMTYP"></td>
					      <td id="2DWDMTOP"></td>
					    </tr>
					    <tr>
					    	<td>일반(10:01~)</td>
					    	<td id="2DWDGTNP"></td>
					    	<td id="2DWDGTYP"></td>
					    	<td id="2DWDGTOP"></td>
					    </tr>
					    <tr>
					    	<td>심야(23:01~)</td>
					    	<td id="2DWDNTNP"></td>
					    	<td id="2DWDNTYP"></td>
					    	<td id="2DWDNTOP"></td>
					    </tr>
					    <tr>
					 		<th scope="row" rowspan="2">금~일<br>공휴일</th>
					     	<td>조조</td>
					      	<td id="2DHDMTNP"></td>
					      	<td id="2DHDMTYP"></td>
					      	<td id="2DHDMTOP"></td>
					    </tr>
					    <tr>
					    	<td>일반(10:01~)</td>
					      	<td id="2DHDGTNP"></td>
					      	<td id="2DHDGTYP"></td>
					      	<td id="2DHDGTOP"></td>
					    </tr>
					      <tr>
					    	<td>심야(23:01~)</td>
					    	<td id="2DHDNTNP"></td>
					    	<td id="2DHDNTYP"></td>
					    	<td id="2DHDNTOP"></td>
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
							<th scope="col">우대/경로</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" rowspan="2">월~목</th>
							<td>조조</td>
							<td id="3DWDMTNP"></td>
							<td id="3DWDMTYP"></td>
							<td id="3DWDMTOP"></td>
						</tr>
					    <tr>
					    	<td>일반(10:01~)</td>
					    	<td id="3DWDGTNP"></td>
					    	<td id="3DWDGTYP"></td>
					    	<td id="3DWDGTOP"></td>
					    </tr>
					      <tr>
					    	<td>심야(23:01~)</td>
					    	<td id="3DWDNTNP"></td>
					    	<td id="3DWDNTYP"></td>
					    	<td id="3DWDNTOP"></td>
					    </tr>
					    <tr>
					 		<th scope="row" rowspan="2">금~일<br>공휴일</th>
					     	<td>조조</td>
					      	<td id="3DHDMTNP"></td>
					      	<td id="3DHDMTYP"></td>
					      	<td id="3DHDMTOP"></td>
					    </tr>
					    <tr>
					    	<td>일반(10:01~)</td>
					      	<td id="3DHDGTNP"></td>
					      	<td id="3DHDGTYP"></td>
					      	<td id="3DHDGTOP"></td>
					    </tr>
					     <tr>
					    	<td>심야(23:01~)</td>
					    	<td id="3DHDNTNP"></td>
					    	<td id="3DHDNTYP"></td>
					    	<td id="3DHDNTOP"></td>
					    </tr>
					</tbody>
				</table>
			</div><!-- col -->
		</div><!--row-->
		<p>
		<h4 class="text-primary">요금제</h4>
		<ul>
			<li>경로 만65세 이상 본인에 한함(신분증 확인)</li>
			<li>청소년 요금 만4세~ 만18세 : 미취학 아동~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인 가능 서류)</li>
			<li>48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능</li>
		</ul>
		<br>
		<h4 class="text-primary">우대적용</h4>
		<ul>
			<li>부산 지역 주민 본인만 가능(신분증 확인)</li>
			<li>국가유공자 현장에서 국가유공자증을 소지한 본인만 가능</li>
			<li>장애인 현장에서 복지카드를 소지한 장애인(1급~3급까지 동반 1인까지 적용 / 4급~6급은 본인에 한함)</li>
			<li>미취학아동 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)</li>
			<li>소방종사자 공무원증을 소지하거나 정복을 입은 소방관 본인</li>
		</ul>
	</div><!-- theater_info -->
	<script type="text/javascript">
		$(function() {
			// 요금표내 숫자 포맷팅, 500원 단위로 반내림
			$('table').find('*').filter(function() {
		        // 숫자인지 확인 (정규 표현식 사용)
		        return $.isNumeric($(this).text());
		    }).each(function() {
		        // 숫자를 포맷팅하여 변경
		        let formattedNumber = new Intl.NumberFormat().format(parseFloat($(this).text()));
		        $(this).text(formattedNumber);
		    });
			
			let standard = 15000; // 기본 표준 가격 = 2D/평일/낮/성인
			
			// 2D 평일 성인 요금 
			let fee_2DWDGTNP = standard;		//	낮
			let fee_2DWDMTNP = fee_2DWDGTNP * 0.8;	//	조조
			let fee_2DWDNTNP = fee_2DWDGTNP * 0.9;	//	심야
			// 2D 주말 성인 요금 
			let fee_2DHDGTNP = fee_2DWDGTNP * 1.2;	// 낮
			let fee_2DHDMTNP = fee_2DHDGTNP * 0.8;	// 조조
			let fee_2DHDNTNP = fee_2DHDGTNP * 0.9;	// 심야
			// 3D 평일 성인 요금 
			let fee_3DWDGTNP = fee_standard * 1.2;	// 낮
			let fee_3DWDMTNP = fee_3DWDGTNP * 0.8;	// 조조
			let fee_3DWDNTNP = fee_3DWDGTNP * 0.9;	// 심야
			// 3D 주말 성인 요금
			let fee_3DHDGTNP = fee_3DWDGTNP * 1.2;	// 낮
			let fee_3DHDMTNP = fee_3DHDGTNP * 1.2;	// 낮
			let fee_3DHDNTNP = fee_3DHDGTNP * 1.2;	// 낮
			
			$("#2DWDGTNP").html(fee_2DWDGTNP);
			$("#2DWDMTNP").html(fee_2DWDMTNP);
			$("#2DWDNTNP").html(fee_2DWDNTNP);
			
			$("#2DHDGTNP").html(fee_2DHDGTNP);
			$("#2DHDMTNP").html(fee_2DHDMTNP);
			$("#2DHDNTNP").html(fee_2DHDNTNP);
			
			$("#3DWDGTNP").html(fee_3DWDGTNP);
			$("#3DWDMTNP").html(fee_3DWDMTNP);
			$("#3DWDNTNP").html(fee_3DWDNTNP);
			
			$("#3DHDGTNP").html(fee_3DHDGTNP);
			$("#3DHDMTNP").html(fee_3DHDMTNP);
			$("#3DHDNTNP").html(fee_3DHDNTNP);
			
			
			
		});
	
	</script>
</body>
</html>