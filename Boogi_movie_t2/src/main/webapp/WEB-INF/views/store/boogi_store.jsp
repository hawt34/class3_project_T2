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
	height: 50px;
	text-align: center;
}


section {
	width: 1400px;
	height: 1500px;
/* 	background-color: #ffca28; */
	
}
.content {
	margin-top: 10px;
	margin-left: 10px;
	width: 660px;
	height: 1400px;
	float: left;
}
.contentPay {
	margin-top: 10px;
	margin-left: 10px;
	width: 700px;
	height: 1300px;
	float: right;
}


.snack1_box, .snack2_box, .snack3_box, .snack4_box{
	font-size:24px;
	height:200px;
	width:300px;
	float: right;
}
.snack1_image, .snack2_image, .snack3_image, .snack4_image{
	height:200px;
	width:300px;
	float:left;
}
.snack1_image img,
.snack2_image img,
.snack3_image img,
.snack4_image img {
	margin-left:30px;
    max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 조정합니다. */
    max-height: 100%; /* 이미지의 최대 높이를 부모 요소에 맞게 조정합니다. */
}
.snack1_box select,
.snack2_box select,
.snack3_box select,
.snack4_box select {
    margin-top: 10px;
    border: 1px solid black;  
}

.snack1 {
	width: 650px;
	height: 300px;
}
.snack1_name,.snack2_name,.snack3_name,.snack4_name{
	text-align: center;
	font-size: 24px;
}
.snack2 {
	width: 650px;
	height: 300px;
}
.snack3 {
	width: 650px;
	height: 300px;
}
.snack4 {
	width: 650px;
	height: 300px;
}
.bottomButton {
	text-align: center;
	margin-bottom: 10px;
	margin-top: 10px;
	font-size: 24px;
}


footer {
	width: 100%;
	height: 100px;
	/* 	background-color: #ffb300; */
}

</style>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<div class="snack1">
					<div class= "snack1_name"> 부기스낵</div>
						<div class = "snack1_box">
						<h4>종류 및 가격</h4>
						<select name="category1_snack" id="category1_snack">
                        <c:forEach items="${itemInfoSnack}" var="item_snack">
							<option value="${item_snack.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_snack.item_info_image}">
                                ${item_snack.item_info_name} - ${item_snack.item_info_price}원
                            </option>
                        </c:forEach>
                    	</select>
						</div>
						<div class = "snack1_image">
							<img id="snack1_image" src="" >
						</div>
				</div>		
				<div class="snack2">
					<div class= "snack2_name"> 부기팝콘</div> 
						<div class = "snack2_box">
						<h4>종류 및 가격</h4>
						<select name="category2_pop" id="category2_pop">
  					  	<c:forEach items="${itemInfoPop}" var="item_pop">
        				<option value="${item_pop.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_pop.item_info_image}">
        				${item_pop.item_info_name} ${item_pop.item_info_price}원</option>
    					</c:forEach>
						</select>
						</div>
						<div class = "snack2_image">
							<img id="snack2_image" src="" >
						</div>
				</div>
				<div class="snack3">
    				<div class="snack3_name">부기음료</div>
    					<div class="snack3_box">
        				<h4>종류 및 가격</h4>
       				    <select name="category3_juice" id="category3_juice" >
            			<c:forEach items="${itemInfoJuice}" var="item_juice">
                		<option value="${item_juice.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_juice.item_info_image}">
                		${item_juice.item_info_name} ${item_juice.item_info_price}원</option> 
                		</c:forEach>
        				</select>
           				</div>
           				<div class = "snack3_image">
           					<img id="snack3_image" src="" >
           				</div>
			    </div>
				<div class="snack4">
					<div class= "snack4_name">부기콤보</div> 
						<div class = "snack4_box">
						<h4>종류 및 가격</h4>
						<select name="category4_combo" id ="category4_combo">
  					  	<c:forEach items="${itemInfoCombo}" var="item_combo">
        				<option value="${item_combo.item_info_name}"  data-image="${pageContext.request.contextPath}/resources/images/${item_combo.item_info_image}">
        				${item_combo.item_info_name}  ${item_combo.item_info_price}원</option>
    					</c:forEach>
						</select>
						</div>
						<div class = "snack4_image">
							<img id="snack4_image" src="" >
						</div>
				</div>
			<div class="bottomButton">
				<button type="submit" id="cartButton" class="btn btn-outline-primary" >장바구니 </button>
				<input type="button" class="btn btn-outline-primary" value="뒤로가기" onclick="history.back()"> 
			</div>
		</div>
		<div class="contentPay">
			<h2>담은 품목</h2>
		</div>				
		</section>
		<footer> 
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include> 
		</footer>
	</div>

</body>
	<script>
	$(document).ready(function() {
	    // 페이지가 로드될 때 초기 이미지를 설정
	    var initialImageSrc = $('#category1_snack').find('option:first').data('image');
	    $('#snack1_image').attr('src', initialImageSrc);

	    // 셀렉트 박스의 변경 이벤트를 감지하여 이미지를 변경
	    $('#category1_snack').change(function() {
	        var selectedImageSrc = $(this).find(':selected').data('image');
	        $('#snack1_image').attr('src', selectedImageSrc);
	    });
		
	    var initialImageSrc2 = $('#category2_pop').find('option:first').data('image');
	    $('#snack2_image').attr('src', initialImageSrc2);

	    // 셀렉트 박스의 변경 이벤트를 감지하여 이미지를 변경
	    $('#category2_pop').change(function() {
	        var selectedImageSrc2 = $(this).find(':selected').data('image');
	        $('#snack2_image').attr('src', selectedImageSrc2);
	    });
	    
	    
	    var initialImageSrc3 = $('#category3_juice').find('option:first').data('image');
	    $('#snack3_image').attr('src', initialImageSrc3);

	    $('#category3_juice').change(function() {
	        var selectedImageSrc3 = $(this).find(':selected').data('image');
	        $('#snack3_image').attr('src', selectedImageSrc3);
	    });
	   
	    var initialImageSrc4 = $('#category4_combo').find('option:first').data('image');
	    $('#snack4_image').attr('src', initialImageSrc4);

	    $('#category4_combo').change(function() {
	        var selectedImageSrc4 = $(this).find(':selected').data('image');
	        $('#snack4_image').attr('src', selectedImageSrc4);
	    });
	   
	    
	    
	    
	 
	 $("#cartButton").click(function(event) {
		    // 세션 아이디 가져오기
		    let sessionId = "${sessionScope.sId}";
			    
		    // 로그인 여부 확인
		    if (!sessionId) {
		    	if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
                    window.location.href = 'member_login';
                }
		        event.preventDefault(); // 폼 제출 중단
		        return;
		    }
		});

 	});   
	</script>
</html>