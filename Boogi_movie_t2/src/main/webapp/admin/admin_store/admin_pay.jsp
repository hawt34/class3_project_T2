<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 결제관리</title>
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
				<div class="admin_movie_head">
					<div class="admin_movie_title">결제관리</div>
					<div class="admin_movie_search">
						<select>
							<option>예매</option>
							<option>스낵</option>
						</select> 
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>결제코드</th>
								<th>결제회원</th>
								<th>결제종류</th>
								<th>결제시간</th>
								<th>결제금액</th>
								<th>결제상태</th>
								<th>결제취소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1231221</td>
								<td>홍길동</td>
								<td>스낵</td>
								<td>2024-05-12 20:00</td>
								<td>12,000원</td>
								<td>결제완료</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>박종민</td>
								<td>예매</td>
								<td>2024-02-22 09:00</td>
								<td>34,000원</td>
								<td>결제취소</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>admin</td>
								<td>예매</td>
								<td>2024-04-12 20:00</td>
								<td>32,000원</td>
								<td>결제완료</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>admin</td>
								<td>예매</td>
								<td>2024-04-12 20:00</td>
								<td>32,000원</td>
								<td>결제완료</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>admin</td>
								<td>예매</td>
								<td>2024-04-12 20:00</td>
								<td>32,000원</td>
								<td>결제완료</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>admin</td>
								<td>예매</td>
								<td>2024-04-12 20:00</td>
								<td>32,000원</td>
								<td>결제완료</td>
								<td>
									<button type="button" class="btn btn-outline-primary">취소</button>
								</td>
							</tr>
							
						</tbody>
					</table>
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