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
  	border: 1px solid white;  
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
.snack1_box, .snack2_box, .snack3_box, .snack4_box{
	font-size:24px;
	height:200px;
	width:300px;
	float: right;
	
}
.snack1_box select,
.snack2_box select,
.snack3_box select,
.snack4_box select {
    margin-top: 10px;
    border: 1px solid black;  
}
#totalSnack,#totalPop,#totalJuice,#totalCombo {
	width:300px;
	height:80px;
    font-size: 24px; /* 원하는 글자 크기 값으로 변경하세요 */
	margin-left: 150px;
}  
.snack1 {
	width: 650px;
	height: 300px;
	float: left;
}
.snack1_name,.snack2_name,.snack3_name,.snack4_name{
	text-align: center;
	font-size: 24px;
}
.snack2 {
	width: 650px;
	height: 300px;
	float: right;
}
.snack3 {
	width: 650px;
	height: 300px;
	float: left;
	margin-top: 30px;
}
.snack4 {
	width: 650px;
	height: 300px;
	float: right;
	margin-top: 30px;
}
.bottomButton {
    margin-top: 700px; /* 페이지의 하단에 배치 */
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
				<form action="storePay" method="post">
				<div class="snack1">
					<div class= "snack1_name"> 부기스낵</div>
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_popCol.jpg">
						<div class = "snack1_box">
						<h4>종류 및 가격</h4>
						<select name="category1_snack" id="category1_snack" >
  					  	<c:forEach items="${itemInfoSnack}" var="item_snack">
        				<option value="${item_snack.item_info_price}">${item_snack.item_info_name} - ${item_snack.item_info_price}원</option>
    					</c:forEach>
						</select>
						<h4>수량</h4>
						<select name="snackNum" id="snackNum">
            			<option value="0" selected>스낵 미선택</option>
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
				        </div>
						<div id="totalSnack"></div>
        				
						 
				</div>		
				<div class="snack2">
					<div class= "snack2_name"> 부기팝콘</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_pop.jpg">
						<div class = "snack2_box">
						<h4>종류 및 가격</h4>
						<select name="category2_pop" id="category2_pop">
  					  	<c:forEach items="${itemInfoPop}" var="item_pop">
        				<option value="${item_pop.item_info_price}">${item_pop.item_info_name} ${item_pop.item_info_price}원</option>
    					</c:forEach>
						</select>
						<h4>수량</h4>
						<select name="snackPop" id="snackPop">
						<option value="0" selected>팝콘 미선택</option>
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
				        </div>
						<div id="totalPop"></div> 						
					
				</div>
				<div class="snack3">
					<div class= "snack3_name"> 부기음료</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_col.jpg">
						<div class = "snack3_box">
						<h4>종류 및 가격</h4>
						<select name="category3_juice" id="category3_juice">
  					  	<c:forEach items="${itemInfoJuice}" var="item_Juice">
        				<option value="${item_Juice.item_info_price}">${item_Juice.item_info_name} ${item_Juice.item_info_price}원</option>
    					</c:forEach>
						</select>
						<h4>수량</h4>
						<select name="snackJuice" id="snackJuice" >
						<option value="0" selected>음료 미선택</option>
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
				        </div>
				        <div id="totalJuice"></div>
				</div>
				<div class="snack4">
					<div class= "snack4_name">부기콤보</div> 
						<img src="${pageContext.request.contextPath}/resources/images/boogi_store_snack.jpg">
						<div class = "snack4_box">
						<h4>종류 및 가격</h4>
						<select name="category4_combo" id ="category4_combo">
  					  	<c:forEach items="${itemInfoCombo}" var="item_combo">
        				<option value="${item_combo.item_info_price}">${item_combo.item_info_name}  ${item_combo.item_info_price}원</option>
    					</c:forEach>
						</select>
						<h4>수량</h4>
						<select name="snackCombo" id = "snackCombo">
						<option value="0" selected>콤보 미선택</option>
            			<option value="1">1개</option>
            			<option value="2">2개</option>
            			<option value="3">3개</option>
            			<option value="4">4개</option>
            			<option value="5">5개</option>
				        </select>
						</div>
						<div id="totalCombo"></div>	
				</div>
			<div class="bottomButton">
				<button type="submit" id="cartButton" class="btn btn-outline-primary" >장바구니 </button>
				<input type="button" class="btn btn-outline-primary" value="뒤로가기" onclick="history.back()"> 
			</div>
		</form>	
			
		</div>
						
		</section>
		<footer> 
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include> 
		</footer>
	</div>

</body>
	<script>
	 $(document).ready(function() {
	        // 아이템이나 수량이 변경될 때마다 총 가격을 다시 계산하여 업데이트
	        $("#category1_snack, #snackNum").change(function() {
	            // 선택한 아이템의 가격
	            let snackPrice = $("#category1_snack").val();
	            // 선택한 수량
	            let snackYang = $("#snackNum").val();
	            // 총 가격 계산
	            let totalSnack = snackPrice * snackYang;
	            // 결과를 표시하는 요소에 총 가격을 업데이트
	            $("#totalSnack").text("스낵 총 합계  " + totalSnack + "원");
	        });

	        
	        $("#category2_pop, #snackPop").change(function() {
	            let popPrice = $("#category2_pop").val();
	            let popYang = $("#snackPop").val();
	            let totalPop = popPrice * popYang;
	            $("#totalPop").text("팝콘 총 합계  " + totalPop + "원");
	        });
			
	        $("#category3_juice, #snackJuice").change(function() {
	            let juicePrice = $("#category3_juice").val();
	            let juiceYang = $("#snackJuice").val();
	            let totalJuice = juicePrice * juiceYang;
	            $("#totalJuice").text("음료 총 합계  " +totalJuice + "원");
	        });
	        
	        $("#category4_combo, #snackCombo").change(function() {
	            let comboPrice = $("#category4_combo").val();
	            let comboYang = $("#snackCombo").val();
	            let totalCombo = comboPrice * comboYang;
	            $("#totalCombo").text("콤보 총 합계  " + totalCombo + "원");
	        });
	        
	                
	        // 페이지 로드 시 총 가격을 초기화
	        $("#category1_snack, #snackNum").change();
	        $("#category2_pop, #snackJuice").change();       
	        $("#category3_juice, #snackPop").change();
	        $("#category4_combo, #snackCombo").change();
	             
	    });
	 
	 $("#cartButton").click(function(event) {
		    // 세션 아이디 가져오기
		    let sessionId = "${sessionScope.sId}";
			
		    
		    // 로그인 여부 확인
		    if (!sessionId) {
		        if (confirm("로그인이 필요합니다. 상단의 로그인영역으로 이동하시겠습니까?")) {
		            // 로그인 페이지로 이동
		        	$('a[href="member_login"]').focus();
		        }
		        event.preventDefault(); // 폼 제출 중단
		        return;
		    }
			   

		});
// 	 	$("#cartButton").click(function() {
// 	        // 팝업 창 띄우기
// 	        window.open("storePay", "장바구니", "width=400, height=300, top=100, left=100");
// 	    }); //get방식으로만 가능..
	 
	</script>
</html>