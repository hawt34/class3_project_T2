<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 스토어 관리</title>
<link href="../admin_main/admin_main.css" rel="stylesheet">
<!-- 부트스트랩 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin_list.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<jsp:include page="../../inc/admin_header.jsp"></jsp:include>
	</header>

	<main>

		<div class="row">

			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="../../inc/admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_store_head">
					<div class="admin_store_title">스토어 관리</div>
					<div class="admin_store_search">
						<select>
							<option>음료류</option>
							<option>치킨류</option>
							<option>팝콘류</option>
							<option>감자류</option>
							<option>그 외</option>
						</select> 
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				
				<div class="admin_store_body">
					<table>
						<thead>
			
							<tr>
								<th>스낵 코드</th>
								<th>스낵 종류</th>
								<th>스낵 이름</th>
								<th>스낵 가격</th>
								<th>운영 상태</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
				<!--  이 부분을 반복문을 통해서 상영관 정보를 담은 리스트를 
			      전달받아 출력하면 좋을듯-->
						<tbody>
							<tr>
								<td>919893</td>
								<td>음료류</td>
								<td>제로 펩시 라임향</td>
								<td>3,000원</td>
								<td>판매중</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>98383</td>
								<td>팝콘류</td>
								<td>카라멜 팝콘(중)</td>
								<td>7,000원</td>
								<td>판매중</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>123124</td>
								<td>팝콘류</td>
								<td>팝콘(대)</td>
								<td>8,000원</td>
								<td>판매 중지</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>34234</td>
								<td>치킨류</td>
								<td>지코바 숯불향</td>
								<td>322,300원</td>
								<td>판매중</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
						
							
						</tbody>
					</table>
				</div>
				
				<div class="admin_store_footer" align="center">
					<button onclick="Form()">스낵 등록</button>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="../../inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function movieForm() {
			window.open("admin_movie_form.jsp", "movieForm", "width=1000, height=800, top=100, left=400");
		}
	
	
	</script>
</body>
</html>