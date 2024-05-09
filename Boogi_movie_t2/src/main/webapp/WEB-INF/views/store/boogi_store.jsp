<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				</div>		
				<div class="snack2">
					<div class= snack2_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_pop.jpg">
				</div>
				<div class="snack3">
					<div class= snack3_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_col.jpg">
				</div>
				<div class="snack4">
					<div class= snack4_name> 여기는 스낵이름 영역</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_snack.jpg">
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