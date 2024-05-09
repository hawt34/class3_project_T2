<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 상영관 관리</title>
<link href="../admin_main/admin_main.css" rel="stylesheet">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources//js/bootstrap.bundle.min.js"></script>
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
					<div class="admin_movie_title">상영관관리</div>
					<div class="admin_movie_search">
						<select>
							<option>해운대점</option>
							<option>서면점</option>
							<option>사직점</option>
							<option>부산대점</option>
							<option>점점</option>
							<option>멀어지나봐</option>
						</select> 
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				
				<div class="admin_movie_body">
					<table>
						<thead>
			
							<tr>
								<th>상영관 코드</th>
								<th>상영관 이름</th>
								<th>상영관 위치</th>
								<th>상영관 크기</th>
								<th>운영 시간</th>
								<th>운영 상태</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
				<!--  이 부분을 반복문을 통해서 상영관 정보를 담은 리스트를 
			      전달받아 출력하면 좋을듯-->
						<tbody>
							<tr>
								<td>4984981</td>
								<td>xxx관</td>
								<td>9층</td>
								<td>10 x 12</td>
								<td>09 : 00 ~ 22 : 00</td>
								<td>운영 중</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="boothForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="boothWithdraw()">삭제</button>
								</td>
							</tr>
							<tr>
								<td>4984981</td>
								<td>xxx관</td>
								<td>9층</td>
								<td>10 x 12</td>
								<td>09 : 00 ~ 22 : 00</td>
								<td>운영 중</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="boothForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="boothWithdraw()">삭제</button>
								</td>
							</tr>
							<tr>
								<td>4984981</td>
								<td>xxx관</td>
								<td>8층</td>
								<td>10 x 12</td>
								<td>09 : 00 ~ 22 : 00</td>
								<td>운영 중</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="boothForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="boothWithdraw()">삭제</button>
								</td>
							</tr>
							<tr>
								<td>4912381</td>
								<td>xxx관</td>
								<td>11층</td>
								<td>10 x 12</td>
								<td>09 : 00 ~ 22 : 00</td>
								<td>미운영</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="boothForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="boothWithdraw()">삭제</button>
								</td>
							</tr>
							<tr>
								<td>4984981</td>
								<td>xxx관</td>
								<td>9층</td>
								<td>10 x 12</td>
								<td>09 : 00 ~ 22 : 00</td>
								<td>운영 중</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="boothForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="boothWithdraw()">삭제</button>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				<div class="admin_movie_footer" align="center">
					<button onclick="boothForm()">상영관 등록</button>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="../../inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function boothForm() {
			window.open("admin_booth_form", "_self");
		}
		function boothWithdraw() {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="admin_booth_delete";
			}
		}
	
	
	</script>
</body>
</html>