<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 영화관리</title>
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
<style>
table {
	border-collapse: collapse;
	width: 90%;
	margin: 0rem auto;
	box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.1);
	background-color: white;
	text-align: center;
}

/* 테이블 행 */
th, td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #1b1b1b;
	color: #ddd;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
	background-color: #eee;
	opacity: 0.9;
	cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1), td:nth-child(1) {
	width: 10%;
}

th:nth-child(2), td:nth-child(2) {
	width: 15%;
}

th:nth-child(3), td:nth-child(3) {
	width: 10%;
}

th:nth-child(4), td:nth-child(4) {
	width: 10%;
}

th:nth-child(5), td:nth-child(5) {
	width: 10%;
}

th:nth-child(6), td:nth-child(6) {
	width: 10%;
}
th:nth-child(7), td:nth-child(7) {
	width: 10%;
}


.admin_movie_head {
	margin: 50px 0;
	text-align: right;
}

.admin_movie_body {
	clear: right;
}

.admin_movie_search {
	height: 50px;
	width: 360px;
	background: #black;
	float: right;
	margin-right: 100px;
	margin-bottom: 20px;
}

.admin_movie_search>input[type=text] {
	font-size: 18px;
	height: 46px;
	width: 150px;
	padding: 5px;
	outline: none;
}

.admin_movie_search>select {
	font-size: 18px;
	height: 46px;
	width: 100px;
	outline: none;
	padding-left: 10px;
}

.admin_movie_search > button {
	width: 90px;
	height: 46px;
	background: black;
	outline: none;
	color: white;
	font-weight: bold;
}
.admin_movie_footer > button {
	width: 90px;
	height: 46px;
	background: black;
	outline: none;
	color: white;
	font-weight: bold;
	margin: 20px auto;
}

.admin_movie_title {
	float: left;
	font-size: 30px;
	margin-left: 100px;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>

	<main>

		<div class="row">

			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>

			<div class="col-md-9">
				<!--  메인 중앙 영역  -->
				<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_movie_head">
					<div class="admin_movie_title">영화관리</div>
					<div class="admin_movie_search">
						<select>
							<option>영화명</option>
							<option>상영상태</option>
						</select> 
						<input type="text" placeholder="검색어 입력">
						<button>검색</button>
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_movie_body">
					<table>
						<thead>
							<tr>
								<th>영화코드</th>
								<th>영화제목</th>
								<th>상영시간</th>
								<th>상영일</th>
								<th>종영일</th>
								<th>상영상태</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1231221</td>
								<td>윙카</td>
								<td>126분</td>
								<td>2024-04-12</td>
								<td>2024-06-19</td>
								<td>현재상영작</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="movieForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="movieWithdraw()">삭제</button>
								</td>
							</tr>
							<tr>
								<td>1231221</td>
								<td>윙카</td>
								<td>126분</td>
								<td>2024-04-12</td>
								<td>2024-06-19</td>
								<td>현재상영작</td>
								<td>
									<button type="button" class="btn btn-outline-primary" onclick="movieForm()">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="movieWithdraw()">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="admin_movie_footer" align="center">
					<button onclick="movieForm()">영화등록</button>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function movieForm() {
			window.open("admin_movie_form", "_self");
		}
		
		function movieWithdraw(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "admin_movie_delete";
			}
		}
	</script>
</body>
</html>