<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 결제관리</title>
<!-- <link href="../admin_main/admin_main.css" rel="stylesheet"> -->
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
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
					<div class="admin_movie_title">스토어 결제관리</div>
					<div class="admin_movie_search">
						<select>
							<option>스토어</option>
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
									<button type="button" class="btn btn-outline-primary" onclick="pay_cancel()">취소</button>
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
									<button type="button" class="btn btn-outline-primary" onclick="pay_cancel()">취소</button>
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
									<button type="button" class="btn btn-outline-primary" onclick="pay_cancel()">취소</button>
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
									<button type="button" class="btn btn-outline-primary" onclick="pay_cancel()">취소</button>
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
		function pay_cancel() {
			if(confirm("정말 취소하시겠습니까?")){
				location.href = "admin_pay_cancel";
			}
		}
	
	
	</script>
</body>
</html>