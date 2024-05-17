<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
<style>
.admin_store_head {
	margin: 50px 0;
	text-align: right;
}
.admin_store_search {
	height: 50px;
	width: 360px;
	background: #black;
	float: right;
	margin-right: 100px;
	margin-bottom: 20px;
}

.admin_store_search>input[type=text] {
	font-size: 18px;
	height: 46px;
	width: 150px;
	padding: 5px;
	outline: none;
}

.admin_store_search>select {
	font-size: 18px;
	height: 46px;
	width: 100px;
	outline: none;
	padding-left: 10px;
}

.admin_store_search>button {
	width: 90px;
	height: 46px;
	background: black;
	outline: none;
	color: white;
	font-weight: bold;
}

.admin_store_title {
	float: left;
	font-size: 30px;
	margin-left: 100px;
}
	
.admin_store_footer > button {
	width: 90px;
	height: 46px;
	background: black;
	outline: none;
	color: white;
	font-weight: bold;
	margin: 20px auto;

}
</style>
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
<!-- 						  <select id="categorySelect"> -->
<!--                             <option value="전체">전체</option> 전체 카테고리를 선택하는 옵션을 추가할 수 있습니다. -->
<!--                            	<option value="음료">음료</option> 귀찮아서 그냥 전체로 끌고옴. -->
<!--                            	<option value="음료">음료</option> -->
<!--                            	<option value="음료">음료</option> -->
<!--                           </select>  -->
					</div>
				</div>

				<!-- 바디 부분 여기 표 넣을거임 -->
				
				<div class="admin_store_body">
					<table>
						<thead>
			
							<tr>
								<th>스낵 종류</th>
								<th>스낵 이름</th>
								<th>스낵 가격</th>
								<th>이미지</th>
								<th>수정삭제</th>
							</tr>
						</thead>
				<!--  이 부분을 반복문을 통해서 상영관 정보를 담은 리스트를 
			      전달받아 출력하면 좋을듯-->
						<tbody>
							<c:forEach var="itemFull" items="${itemFull}">
								 <tr>
	        					 <td>${itemFull.item_info_category}</td>
	        					 <td>${itemFull.item_info_name}</td>
	        					 <td>${itemFull.item_info_price}</td>
	        					 <td>${itemFull.item_info_image}</td>
	                             <td>
									<button type="button" class="btn btn-outline-primary" onclick="store_form('${itemFull.item_info_name}')">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="store_delete('${itemFull.item_info_name}')">삭제</button>
								 </td>
								 </tr>
						   </c:forEach> 
						</tbody>
					</table>
				</div>
				
				<div class="admin_store_footer" align="center">
					<button onclick="location.href='admin_store_form'">스낵 등록</button>
				</div>

			</div>

		</div>
	</main>

	<footer>
		<jsp:include page="../../inc/admin_footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript">
		function store_form(item_info_name) {
			if(confirm("정말 수정하시겠습니까?")){
				location.href = "admin_store_modify?item_info_name=" + encodeURIComponent(item_info_name);
			}
		}
		function store_delete(item_info_name) {
			if(confirm("정말 삭제하시겠습니까?")){
				  location.href = "admin_store_delete?item_info_name=" + encodeURIComponent(item_info_name);
				}
		}
		
		
	
	</script>
</body>
</html>