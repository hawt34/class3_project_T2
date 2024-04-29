<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일대일 문의 내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style type="text/css">
	.admin_csc_selectBox {
		display: flex;
		justify-content: space-around;
	}
	
	h3 {
		margin-left: 20px;
	}
	
	h1 {
		font-style: italic;
	}
	
	/* 테이블 css */
	.admin_ono_body > table {
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
	  width: 10%;
	}
	
	th:nth-child(2),
	td:nth-child(2) {
	  width: 10%;
	}
	
	th:nth-child(3),
	td:nth-child(3) {
	  width: 25%;
	}
	th:nth-child(4),
	td:nth-child(4) {
	  width: 10%;
	}
	th:nth-child(5),
	td:nth-child(5) {
	  width: 10%;
	}
	th:nth-child(6),
	td:nth-child(6) {
	  width: 10%;
	}
	.admin_ono_head {
	margin: 30px 0;
	text-align: right;
	border
	}
	
	.admin_ono_title {
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
	
<!-- 	<div class="container"> -->
		<div class="row">
			<!-- side 영역 -->
			<div class="col-2">
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>
			<!-- content 영역 -->
			<div class="col-9">
				<div class="admin_ono_head">
					<div class="admin_ono_title">고객센터관리</div>
						<div class="admin_ono_search">
							<table>
								<tr>
									<td>
							<!-- 문의 유형 카테고리 -->
										<select class="form-select form-select-sm"
											aria-label="Default select example">
											<option selected>문의 유형 선택</option>
											<option value="영화">영화</option>
											<option value="극장">극장</option>
											<option value="예매/결제">예매/결제</option>
											<option value="쿠폰">쿠폰</option>
											<option value="회원정보">회원정보</option>
										</select> 
									</td>
									<td>
										<select class="form-select form-select-sm"
											aria-label="Default select example">
											<option selected>문의 지점 선택</option>
											<option value="부산진구">부산진구</option>
											<option value="해운대구">해운대구</option>
											<option value="북구">북구</option>
											<option value="남구">남구</option>
											<option value="서구">서구</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
				
				<div class="admin_ono_body">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>문의내용</th>
								<th>문의유형</th>
								<th>문의지점</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>2024.04.26~</td>
							</tr>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>2024.04.26~</td>
							</tr>
							<tr>
								<td>윙카</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>2024-04-19</td>
								<td>2024.04.26~</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
<!-- 	</div> -->
	
	<footer>
<<<<<<< HEAD
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
=======
		<jsp:include page="/WEB-INF/views/admin/admin_main/admin_footer.jsp"></jsp:include>
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
	</footer>
	
</body>
</html>