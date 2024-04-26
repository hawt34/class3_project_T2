<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - FAQ관리</title>
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
					<div class="admin_movie_title">FAQ관리</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>FAQ 코드</th>
								<th>제목</th>
								<th>등록일</th>
								<th>작성자</th>
								<th>상세보기/수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1259933</td>
								<td>결제 취소는 어디서 하나요?</td>
								<td>2023-11-12</td>
								<td>어드민</td>
								<td>
									<button type="button" class="btn btn-outline-primary">상세보기</button>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>7323232</td>
								<td>분신물 신고는 어디서 하나요?</td>
								<td>2023-12-22</td>
								<td>어드민</td>
								<td>
									<button type="button" class="btn btn-outline-primary">상세보기</button>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>12312341</td>
								<td>하나둘하나둘</td>
								<td>2023-11-12</td>
								<td>어드민</td>
								<td>
									<button type="button" class="btn btn-outline-primary">상세보기</button>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>848293</td>
								<td>마이크쳌마이크쳌</td>
								<td>2023-11-12</td>
								<td>어드민</td>
								<td>
									<button type="button" class="btn btn-outline-primary">상세보기</button>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
						
							
						</tbody>
					</table>
				<div class="admin_movie_footer" align="center">
					<button onclick="movieForm()">FAQ 등록</button>
				</div>
				
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