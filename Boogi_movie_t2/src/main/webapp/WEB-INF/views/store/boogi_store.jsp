<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
 	border: 1px solid skyblue; 
}

body {
	/* 	background-color: #fffde7; */
	
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

article {
	margin-top: 50px;
	width : 1400px;
	height: 100px;
	text-align: center;
}

.content img {
    width: 200px;
    height: 200px;
}

section {
	width: 1400px;
	height: 1000px;
/* 	background-color: #ffca28; */
	
}
.content {
	margin: 10px 10px 10px 10px;
	
}

.snack1 {
	width: 600px;
	height: 300px;
	float: left;
}

.snack2 {
	width: 600px;
	height: 300px;
	float: right;
}
.snack3 {
	width: 600px;
	height: 300px;
	float: left;
	margin-top: 100px; 
}
.snack4 {
	width: 600px;
	height: 300px;
	float: right;
	margin-top: 100px;
}

.bottomButton {
    margin-top: 800px; /* 페이지의 하단에 배치 */
	text-align: center;
	margin-bottom: 10px;
	font-size: 24px;
}


footer {
	width: 100%;
	height: 100px;
	/* 	background-color: #ffb300; */
}

</style>
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/boogi_store.css" rel="stylesheet" type="text/css"> --%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">
		<section>
			<article> 
				<h1>부기 스토어</h1>
			</article>
			<div class="content">
				<div class= snack1>
					<div class= snack1_name> 여기는 스낵이름 영역</div>
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_popCol.jpg">
						<select name="category">
  					  	<c:forEach items="${itemInfoSnack}" var="item">
        				<option value="${item.item_info_name}">${item.item_info_name} - ${item.item_info_price}원</option>
    					</c:forEach>
						</select>
						<select name="snackNum" onchange="">
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
				</div>		
				<div class="snack2">
					<div class= snack2_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_pop.jpg">
						<select name="category">
  					  	<c:forEach items="${itemInfoPop}" var="item">
        				<option value="${item.item_info_name}">${item.item_info_name} - ${item.item_info_price}원</option>
    					</c:forEach>
						</select>
						<select name="snackPop" onchange="">
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
												
				</div>
				<div class="snack3">
					<div class= snack3_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_col.jpg">
						<select name="category">
  					  	<c:forEach items="${itemInfoJuice}" var="item">
        				<option value="${item.item_info_name}">${item.item_info_name} - ${item.item_info_price}원</option>
    					</c:forEach>
						</select>
						<select name="snackJuice" onchange="">
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
				</div>
				<div class="snack4">
					<div class= snack4_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_snack.jpg">
						<select name="category">
  					  	<c:forEach items="${itemInfoCombo}" var="item">
        				<option value="${item.item_info_name}">${item.item_info_name} - ${item.item_info_price}원</option>
    					</c:forEach>
						</select>
						<select name="snackCombo" onchange="">
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
						
				</div>
			</div>
			<div class="bottomButton">
				<button type="submit" class="btn btn-outline-primary" >장바구니 </button>
				<input type="button" class="btn btn-outline-primary" value="뒤로가기"> 
			</div>
			
			
						
		</section>
		<footer> 
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include> 
		</footer>
	</div>

</body>
	<script>
	
	</script>
</html>