<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 리뷰관리</title>
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
th:nth-child(1),
td:nth-child(1) {
  width: 15%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 10%;
}

th:nth-child(3),
td:nth-child(3) {
  width: 20%;
}
th:nth-child(4),
td:nth-child(4) {
  width: 10%;
}
th:nth-child(5),
td:nth-child(5) {
  width: 20%;
}
th:nth-child(6),
td:nth-child(6) {
  width: 20%;
}
.admin_review_head{
	margin: 50px 0;
	text-align: right;
}
.admin_review_body{
	margin-bottom: 100px;
	clear:right;
}
.admin_review_search{
	height: 50px;
	width: 360px;
	background: #black;
	float: right;
	margin-right: 100px;
	margin-bottom: 20px;
}
.admin_review_search > input[type=text]{
	font-size: 18px;
	height: 46px;
	width: 150px;
	padding: 5px;
 	outline: none; 
}
.admin_review_search > select{
	font-size: 18px;
	height: 46px;
	width: 100px;
 	outline: none;
 	padding-left: 10px;
}
.admin_review_search > button{
	width: 90px;
	height: 46px;
	background: black;
	outline: none; 
	color: white;
	font-weight: bold;
}
.admin_review_title{
	float: left;
	font-size: 30px;
	margin-left: 100px;
}

</style>
</head>
<body>

	<header>
		<jsp:include page="../admin_main/admin_header.jsp"></jsp:include>
	</header>

	<main>
		<div class="row">
		
			<div class="col-md-2">
				<!-- 사이드바 영역 -->
				<jsp:include page="../admin_main/admin_aside.jsp"></jsp:include>
			</div>
			
			<div class="col-md-10">
				<!--  메인 중앙 영역  -->
					<!-- 헤드 부분 여기 검색 기능 넣을거임 -->
				<div class="admin_review_head">
					<div class="admin_review_title">리뷰관리</div>
					<div class="admin_review_search">
						<select>
							<option>이름</option>
							<option>아이디</option>
						</select>
						<input type="text" placeholder="검색어 입력">
						<button>검색</button>
					</div>
				</div>
				
					<!-- 바디 부분 여기 표 넣을거임 -->
				<div class="admin_review_body">
					<table>
						<thead>
							<tr>
								<th>영화제목</th>
								<th>아이디</th>
								<th>제목</th>
								<th>별점</th>
								<th>등록날짜</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>
									<button type="button" class="btn btn-outline-primary">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
			
		</div>
	</main>

	<footer>
		<jsp:include page="../admin_main/admin_footer.jsp"></jsp:include>
	</footer>

</body>
</html>