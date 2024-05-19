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
	height: 1400px;
	float: right;
	font-size: 20px;
	overflow-y: auto;
}
.cart-item {
    float: right;
    margin-right: 200px;
    align-items: center;
}
.cart-item input[type="number"] {
    text-align: right; /* 넘버박스 숫자를 오른쪽으로 정렬 */
    padding-right: 15px;
    font-size: 20px;
}
.cart-item button {
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
							<option value="${item_snack.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_snack.item_info_image}" data-price="${item_snack.item_info_price}">
                                ${item_snack.item_info_name} - ${item_snack.item_info_price}원
                            </option>
                        </c:forEach>
                    	</select><br>
                    	<input type="button" class="btn btn-outline-primary" value="담기" id="snackbutton" >
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
        				<option value="${item_pop.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_pop.item_info_image}" data-price="${item_pop.item_info_price}">
        				${item_pop.item_info_name} ${item_pop.item_info_price}원</option>
    					</c:forEach>
						</select>
						<input type="button" class="btn btn-outline-primary" value="담기" id="snackpop">
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
                		<option value="${item_juice.item_info_name}" data-image="${pageContext.request.contextPath}/resources/images/${item_juice.item_info_image}" data-price="${item_juice.item_info_price}">
                		${item_juice.item_info_name} ${item_juice.item_info_price}원</option> 
                		</c:forEach>
        				</select>
        				<input type="button" class="btn btn-outline-primary" value="담기" id="snackjuice">
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
        				<option value="${item_combo.item_info_name}"  data-image="${pageContext.request.contextPath}/resources/images/${item_combo.item_info_image}" data-price="${item_combo.item_info_price}">
        				${item_combo.item_info_name}  ${item_combo.item_info_price}원</option>
    					</c:forEach>
						</select>
						<input type="button" class="btn btn-outline-primary" value="담기" id="snackcombo">
						</div>
						<div class = "snack4_image">
							<img id="snack4_image" src="" >
						</div>
				</div>
			
		</div>
		<div class="contentPay">
			<h4>담은 품목</h4>
			<div class="bottomButton">
			<input type="button" class="btn btn-outline-primary" value="뒤로가기" onclick="history.back()"> 
			</div>
		</div>				
		</section>
		<footer> 
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include> 
		</footer>
	</div>

</body>
	<script>
	$(document).ready(function() {
	    // 로그인 여부를 위한 배열
	    const snackButtons = [
	        { buttonId: "#snackbutton", categoryId: "#category1_snack" },
	        { buttonId: "#snackpop", categoryId: "#category2_pop" },
	        { buttonId: "#snackjuice", categoryId: "#category3_juice" },
	        { buttonId: "#snackcombo", categoryId: "#category4_combo" }
	    ];

	    // 이미지 설정 함수 이거 안 하면 처음에 화면이 없음.. 
	    function setImage(selectId, imgId) {
	        let firstImage = $(selectId).find('option:first').data('image');
	        $(imgId).attr('src', firstImage);

	        $(selectId).change(function() {
	            let selectedImage = $(this).find(':selected').data('image');
	            $(imgId).attr('src', selectedImage);
	        });
	    }
	    // 이미지 설정
	    setImage('#category1_snack', '#snack1_image');
	    setImage('#category2_pop', '#snack2_image');
	    setImage('#category3_juice', '#snack3_image');
	    setImage('#category4_combo', '#snack4_image');

	    // 장바구니에 추가하는 함수
	    function addToCart(categoryId) {
	        let selectedItem = $(categoryId).val();
	        let selectedItemPrice = $(categoryId).find(':selected').data('price');

	        $.ajax({
	            type: "POST",
	            url: "add_to_cart",
	            data: {
	                itemName: selectedItem,
	                itemPrice: selectedItemPrice
	            },
	            success: function(response) {
	                alert("장바구니에 추가되었습니다!");
	                let quantity = 1;
	                let totalPrice = selectedItemPrice * quantity;
	                let itemHtml = "<div class='cart-item' data-name='" + response.itemName + "'>" +
	                "<p>" + response.itemName + " - " + selectedItemPrice + "원 </p>" +
	                "<input type='number' class='quantity' value='" + quantity + "' min='1'>" +
	                "<p class='total-price'>선택 품목 가격: " + totalPrice + "원</p>" + // 총 가격 표시
	                "<button class='remove-item btn btn-danger'>취소</button>" +
	                "</div>";
	            	let newItem = $(itemHtml);
	           		 $(".contentPay").append(newItem)
					
	                    // 수량 변경 이벤트 리스너 추가
	                    newItem.find('.quantity').on('input', function() {
	                        let newQuantity = parseInt($(this).val());
	                        let newTotalPrice = selectedItemPrice * newQuantity;
	                        newItem.find('.total-price').text("선택 품목 가격: " + newTotalPrice + "원");
	                    });
	                },
	            error: function(xhr) {
	                if (xhr.status === 409) {
	                    var errorResponse = JSON.parse(xhr.responseText);
	                    var errorMessage = errorResponse.msg;
	                    alert(errorMessage);
	                } else {
	                    alert("장바구니 추가 중 오류가 발생했습니다.");
	                }
	            }
	        });
	    }

	    // 장바구니에서 제거하는 함수
	    function removeFromCart(itemName) {
	        $.ajax({
	            type: "POST",
	            url: "remove_from_cart",
	            data: { itemName: itemName },
	            success: function(response) {
	                alert(response.message);
	                $(".cart-item[data-name='" + itemName + "']").remove();
	            },
	            error: function() {
	                alert("장바구니에서 항목을 제거하는 중 오류가 발생했습니다.");
	            }
	        });
	    }
	    snackButtons.forEach(function(button) {
	        $(button.buttonId).click(function() {
	            // 로그인 여부 확인
	            let sessionId = "${sessionScope.sId}";
	            if (!sessionId) {
	                if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
	                    window.location.href = 'member_login'; // 로그인 페이지로 이동
	                }
	            } else {
	                addToCart(button.categoryId);
	            }
	        });
	    });
	    

	    // 장바구니에서 항목 제거 버튼에 이벤트 바인딩
	    $(".contentPay").on("click", ".remove-item", function() {
	        let itemName = $(this).parent().data("name");
	        removeFromCart(itemName);
	    });

	});
	</script>
</html>