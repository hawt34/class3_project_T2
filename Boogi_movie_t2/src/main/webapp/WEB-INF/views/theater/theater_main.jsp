<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">

</head>

<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<article>
	<h1>전체 극장</h1>
	<hr>
	<div class="theater_all">
		<div class="theater_top">
			<nav class="nav justify-content-center theater_name">
				 <a class="nav-link" href="theater_detail">해운대점</a>
				 <a class="nav-link" href="theater_detail">센텀점</a>
				 <a class="nav-link" href="theater_detail">서면점</a>
				 <a class="nav-link" href="theater_detail">남포점</a>
				 <a class="nav-link" href="theater_detail">부산대점</a>
				 <a class="nav-link" href="theater_detail">사직점</a>
				 <a class="nav-link" href="theater_detail">영도점</a>
				 <a class="nav-link" href="theater_detail">덕천점</a>
				 <a class="nav-link" href="theater_detail">정관점</a>
				 <a class="nav-link" href="theater_detail">사상점</a>
				 <div class="dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MY 극장</a>
					<ul class="dropdown-menu">
						 <!-- 비로그인 상태 -->
						<li><input type="button" class="btn btn-outline-primary btn-sm" value="로그인하기" onclick="location.href='member_login'"></li>
						<!-- 로그인 상태 -->
						<!-- 나의극장 관리 모달 버튼 -->
						<li><button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">MY 극장 관리</button></li>
						<!-- 체크된 MY극장 리스트 -->
						<li><a class="dropdown-item" href="#">정관점</a></li>
						<li><a class="dropdown-item" href="#">서면점</a></li>
					</ul>
				</div>
			</nav>
					
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-gear"></i>MY 극장 관리</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check1">
								<label class="form-check-label" for="check1">해운대점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check2">
								<label class="form-check-label" for="check2">센텀점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check3">
								<label class="form-check-label" for="check3">서면점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check4">
								<label class="form-check-label" for="check4">남포점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check5">
								<label class="form-check-label" for="check5">부산대점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check6">
								<label class="form-check-label" for="check6">사직점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check7">
								<label class="form-check-label" for="check7">영도점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check8">
								<label class="form-check-label" for="check8">덕천점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check9">
								<label class="form-check-label" for="check9">정관점</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="check10">
								<label class="form-check-label" for="check10">사상점</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">저장</button>
		      			</div>
					</div>
		  		</div>
		  	</div> <!-- 모달 끝 -->
		</div><!-- theater_top 끝 -->
		
		<!-- 극장 관련 이벤트 불러오기 -->
		<div class="theater_main_cont" id="theater-event">
			<h3>극장 이벤트</h3>
			<a href="${pageContext.request.contextPath}/resources/images/theater_event_ex2.jpg"><img src="${pageContext.request.contextPath}/resources/images/theater_event_ex1.jpg"></a>
		</div>
		<div class="theater_main_cont" id="theater-notice">
			<div class="row">
	    		<div class="col-11">
	     			<h3>극장 공지사항</h3>	
	   			</div>
	    		<div class="col">
	      			<a href="">더보기 
	      			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
					</svg></a>
	   			</div>
	   		</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col" width="">극장</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">해운대점</td>
						<td>Mark</td>
						<td>Otto</td>
					</tr>
					<tr>
						<td scope="row">서면점</td>
						<td>Jacob</td>
						<td>Thornton</td>
					</tr>
					<tr>
						<td scope="row">동래점</td>
						<td>Larry the Bird</td>
						<td>@twitter</td>
					</tr>
					<tr>
						<td scope="row">남포점</td>
						<td>Larry the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>	
	</article>
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>

</body>
</html>


