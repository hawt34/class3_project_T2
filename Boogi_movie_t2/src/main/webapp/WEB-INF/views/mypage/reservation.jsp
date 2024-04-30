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
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div><!-- sidebar1 -->
				<!-- 탭 메뉴 -->
				<!-- 내용 -->
			<div class="col-md-10 box-in">
				<div class="row">
					<div class="col-10">
						<h2>예매내역</h2>
					</div> <!-- col-10 -->
					<div class="col-2">
						<select class="form-select form-select-sm box1" aria-label=".form-select-sm example">
						  <option selected>최근 1주일</option>
						  <option value="1">최근 1개월</option>
						  <option value="2">최근 3개월</option>
						  <option value="3">기간 설정</option>
						</select>
					</div><!-- col-2 -->
					<hr>
				</div><!--  하위 row -->
				<div class="box2">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
								data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
								aria-selected="true">예매내역</button>
						</li>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-3"> <!-- 첫번째 사진 -->
							<img src="${pageContext.request.contextPath}/resources/images/myp_img1.jpg" width="200px" height="250px">
					</div>	
					<div class="paybox1 col-md-6">
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="영화제목" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="범죄도시">
							<input type="text" readonly class="form-control-plaintext" value="2024 / 04 / 24">
							<input type="text" readonly class="form-control-plaintext" value="서면 8관">
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="관람인원" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="1명">
							<input type="text" readonly class="form-control-plaintext" value="F9">
							<input type="text" readonly class="form-control-plaintext" value="12,000원">
						</div>
					</div> <!-- paybox1 첫번째 예매칸 -->
				</div><!-- row -->
				<hr>
				<div class="row"><!-- 두번째 사진 -->
					<div class="col-md-3">
						<img src="${pageContext.request.contextPath}/resources/images/myp_img2.jpg" width="200px" height="250px">
					</div>	
					<div class="paybox1 col-md-6">
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="영화제목" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="쿵푸팬더">
							<input type="text" readonly class="form-control-plaintext" value="2024 / 04 / 20">
							<input type="text" readonly class="form-control-plaintext" value="아시아드 1관">
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="관람인원" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="2명">
							<input type="text" readonly class="form-control-plaintext" value="H9 H10">
							<input type="text" readonly class="form-control-plaintext" value="24,000원">	
						</div>
					</div> <!-- paybox1 첫번째 예매칸 -->	
				</div><!-- row -->
				<hr>
				<div class="row"><!-- 세번째 사진 -->
					<div class="col-md-3">
						<img src="${pageContext.request.contextPath}/resources/images/myp_img3.jpg" width="200px" height="250px">
					</div>	
					<div class="paybox1 col-md-6">
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="영화제목" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="듄2">
							<input type="text" readonly class="form-control-plaintext" value="2024 / 03 / 18">
							<input type="text" readonly class="form-control-plaintext" value="서면 4관">
						</div>
					
						<div class="col-md-4 d-grid gap-5">
							<input class="form-control box3 w-75" type="text" value="관람인원" aria-label="Disabled input example " disabled readonly >
							<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly>
							<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly>
						</div>
						<div class="col-md-4 d-grid gap-5">
							<input type="text" readonly class="form-control-plaintext" value="1명">
							<input type="text" readonly class="form-control-plaintext" value="G16">
							<input type="text" readonly class="form-control-plaintext" value="18,000원">	
						</div>
					</div> <!-- paybox1 첫번째 예매칸 -->	
				</div><!-- row -->
				<hr>
					<div class="row"><!-- 네번째 사진 -->
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath}/resources/images/myp_img4.jpg" width="200px" height="250px">
						</div>	
						<div class="paybox1 col-md-6">
							<div class="col-md-4 d-grid gap-5">
								<input class="form-control box3 w-75" type="text" value="영화제목" aria-label="Disabled input example " disabled readonly >
								<input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example " disabled readonly>
								<input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example " disabled readonly>
							</div>
							<div class="col-md-4 d-grid gap-5">
								<input type="text" readonly class="form-control-plaintext" value="파묘">
								<input type="text" readonly class="form-control-plaintext" value="2024 / 03 / 10">
								<input type="text" readonly class="form-control-plaintext" value="삼정타워 11관">
							</div>
						
							<div class="col-md-4 d-grid gap-5">
								<input class="form-control box3 w-75" type="text" value="관람인원" aria-label="Disabled input example " disabled readonly >
								<input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example " disabled readonly>
								<input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example " disabled readonly>
							</div>
							<div class="col-md-4 d-grid gap-5">
								<input type="text" readonly class="form-control-plaintext" value="3명">
								<input type="text" readonly class="form-control-plaintext" value="K13 K14 K15">
								<input type="text" readonly class="form-control-plaintext" value="36,000원">
							</div>
						</div> <!-- paybox1 첫번째 예매칸 -->	
					</div><!-- row -->
				<hr>
			</div><!-- col-md-10 -->
		</div><!-- row box1 -->
	</div><!-- container2 -->
</div> <!-- container -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>