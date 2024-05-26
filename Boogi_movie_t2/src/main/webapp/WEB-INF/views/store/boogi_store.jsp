<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	/*   	border: 1px solid skyblue;   */
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

article {
	margin-top: 50px;
	width: 1400px;
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
	font-size: 25px;
	overflow-y: auto;
}

.cart-item input[type="number"] {
	text-align: right; /* 넘버박스 숫자를 오른쪽으로 정렬 */
	font-size: 20px;
	width: 50px;
}

.cart-item button {
	
}

.snack1_box, .snack2_box, .snack3_box, .snack4_box {
	font-size: 24px;
	height: 200px;
	width: 300px;
	float: right;
}

.snack1_image, .snack2_image, .snack3_image, .snack4_image {
	height: 200px;
	width: 300px;
	float: left;
}

.snack1_image img, .snack2_image img, .snack3_image img, .snack4_image img
	{
	margin-left: 30px;
	max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞게 조정합니다. */
	max-height: 100%; /* 이미지의 최대 높이를 부모 요소에 맞게 조정합니다. */
}

.snack1_box select, .snack2_box select, .snack3_box select, .snack4_box select
	{
	margin-top: 10px;
	border: 1px solid black;
}

.snack1 {
	width: 650px;
	height: 300px;
}

.snack1_name, .snack2_name, .snack3_name, .snack4_name {
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
	margin-top: 10px margin-right:30px;
	font-size: 24px;
}

footer {
	width: 100%;
	height: 100px;
	/* 	background-color: #ffb300; */
}
</style>
<title>부기무비 스토어</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
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
				<div class="snack1">
					<div class="snack1_name">부기스낵</div>
					<div class="snack1_box">
						<h4>종류 및 가격</h4>
						<select name="category1_snack" id="category1_snack">
							<c:forEach items="${itemInfoSnack}" var="item_snack">
								<option value="${item_snack.item_info_num}"
									data-name="${item_snack.item_info_name}"
									data-image="${pageContext.request.contextPath}/resources/images/${item_snack.item_info_image}"
									data-price="${item_snack.item_info_price}">
									${item_snack.item_info_name} - ${item_snack.item_info_price}원</option>
							</c:forEach>
						</select><br> <input type="button" class="btn btn-outline-primary"
							value="담기" id="snackbutton">
					</div>
					<div class="snack1_image">
						<img id="snack1_image" src="">
					</div>
				</div>
				<div class="snack2">
					<div class="snack2_name">부기팝콘</div>
					<div class="snack2_box">
						<h4>종류 및 가격</h4>
						<select name="category2_pop" id="category2_pop">
							<c:forEach items="${itemInfoPop}" var="item_pop">
								<option value="${item_pop.item_info_num}"
									data-name="${item_pop.item_info_name}"
									data-image="${pageContext.request.contextPath}/resources/images/${item_pop.item_info_image}"
									data-price="${item_pop.item_info_price}">
									${item_pop.item_info_name} ${item_pop.item_info_price}원</option>
							</c:forEach>
						</select> <input type="button" class="btn btn-outline-primary" value="담기"
							id="snackpop">
					</div>
					<div class="snack2_image">
						<img id="snack2_image" src="">
					</div>
				</div>
				<div class="snack3">
					<div class="snack3_name">부기음료</div>
					<div class="snack3_box">
						<h4>종류 및 가격</h4>
						<select name="category3_juice" id="category3_juice">
							<c:forEach items="${itemInfoJuice}" var="item_juice">
								<option value="${item_juice.item_info_num}"
									data-name="${item_juice.item_info_name}"
									data-image="${pageContext.request.contextPath}/resources/images/${item_juice.item_info_image}"
									data-price="${item_juice.item_info_price}">
									${item_juice.item_info_name} ${item_juice.item_info_price}원</option>
							</c:forEach>
						</select> <input type="button" class="btn btn-outline-primary" value="담기"
							id="snackjuice">
					</div>
					<div class="snack3_image">
						<img id="snack3_image" src="">
					</div>
				</div>
				<div class="snack4">
					<div class="snack4_name">부기콤보</div>
					<div class="snack4_box">
						<h4>종류 및 가격</h4>
						<select name="category4_combo" id="category4_combo">
							<c:forEach items="${itemInfoCombo}" var="item_combo">
								<option value="${item_combo.item_info_num}"
									data-name="${item_combo.item_info_name}"
									data-image="${pageContext.request.contextPath}/resources/images/${item_combo.item_info_image}"
									data-price="${item_combo.item_info_price}">
									${item_combo.item_info_name} ${item_combo.item_info_price}원</option>
							</c:forEach>
						</select> <input type="button" class="btn btn-outline-primary" value="담기"
							id="snackcombo">
					</div>
					<div class="snack4_image">
						<img id="snack4_image" src="">
					</div>
				</div>

			</div>
			<div class="contentPay">
				<h4>담은 품목</h4>
				<table id="cartTable" class="table">
					<thead>
						<tr>
							<th colspan="3">품목명</th>
							<th>가격</th>
							<th>수량</th>
							<th>총 가격</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody>
						<!-- 여기에 장바구니 항목이 추가될 예정 -->
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6"></td>
							<!-- 여유 공간 -->
							<td></td>
						</tr>
					</tfoot>
				</table>
				<div class="realTotalPrice">
					<P>총 가격</P>
				</div>
				<div class="bottomButton">
					<input type="button" class="btn btn-outline-primary" value="뒤로가기"
						onclick="history.back()"> <input type="button"
						value="결제하기" class="btn btn-outline-primary" id="submitBtn"
						onclick="submit()">
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
		    let selectedItemName = $(categoryId).find(':selected').data('name');
	        // 배열로 보내기.
	        let cartItem = {
	                item_info_num: selectedItem,  // 아이템 번호
	                item_quantity: 1,              // 수량은 일단 1로 설정
	                item_price: selectedItemPrice, // 가격
	                member_id: "${sessionScope.sId}",  // 회원 ID
	            };
	        
	        	        
	        $.ajax({
	            type: "POST",
	            url: "add_to_cart",
	            contentType: "application/json",
	            data: JSON.stringify([cartItem]),
	            success: function(response) {
	                alert("장바구니에 추가되었습니다!");
	                let quantity = 1;
	                let totalPrice = selectedItemPrice * quantity;
	                let itemHtml = "<tr class='cart-item' data-item-num='" + selectedItem + "'>" +
                    "<td  colspan='3'>" + selectedItemName + "</td>" +
                    "<td>" + selectedItemPrice + "원 </td>" +
                    "<td><input type='number' class='quantity' value='" + quantity + "' min='1'></td>" +
                    "<td class='total-price'>" + totalPrice + "원</td>" +
                    "<td><button class='remove-item btn btn-danger'>취소</button></td>" +
                	"</tr>";
					$("#cartTable tbody").append(itemHtml);
					   updateTotalPrice(); // 장바구니 1차 담기 후 업데이트
					
					 $(".contentPay").on("change", ".quantity", function() {
					    let newQuantity = parseInt($(this).val());
					    let selectedItemPrice = parseFloat($(this).closest("tr").find("td:nth-child(2)").text()); // 선택된 품목의 가격
					    let newTotalPrice = selectedItemPrice * newQuantity;
					    $(this).closest("tr").find("td:nth-child(4)").text(newTotalPrice.toLocaleString() + "원"); // 총 가격 업데이트
					    updateTotalPrice(); // 수량 변경 후 전체 총 가격 업데이트

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
		
	    function updateTotalPrice() {
	    	var totalSum = 0;
	        $(".contentPay .total-price").each(function() {
	            let totalPrice = parseInt($(this).text().replace("원", "").replace(",", ""));
	            totalSum += totalPrice;
	        });
	        $(".realTotalPrice p").text("총 가격: " + totalSum.toLocaleString() + "원");
	    }
	    
	    
	    $(".contentPay").on("click", ".remove-item", function(event) {
	        event.preventDefault(); // 폼의 제출을 방지
	        let itemNum = $(this).closest("tr").data("item-num"); // 선택된 품목의 아이템 번호 가져오기
	        removeFromCart(itemNum); // 항목 제거 함수 호출
	    });

	 
		    // 장바구니에서 제거하는 함수
		    function removeFromCart(itemNum) {
		        $.ajax({
		            type: "POST",
		            url: "remove_from_cart",
		            data: { item_info_num: itemNum },
		            success: function(response) {
		            	alert(response.message);
		                $(".cart-item[data-item-num='" + itemNum + "']").remove();
		                updateTotalPrice(); // 제거 후에 총 가격 업데이트
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
	    
	    $("#submitBtn").click(function() {
	        // 장바구니 데이터를 수집
	        let cartItems = [];
	        $("#cartTable tbody tr.cart-item").each(function() {
	            let itemName = $(this).find("td:nth-child(1)").text().trim();
	            let quantity = parseInt($(this).find(".quantity").val());
	            let totalPrice = parseInt($(this).find(".total-price").text().replace("원", "").replace(",", "").trim());
	            
	            cartItems.push({ itemName: itemName, quantity: quantity, totalPrice: totalPrice });
	        });
	        if (cartItems.length === 0) {
	            alert("장바구니에 담은 품목이 없습니다.");
	            return; // 함수를 여기서 종료합니다.
	        }
	        // 총 가격 계산
	        let totalSum = 0;
	        cartItems.forEach(item => {
	            totalSum += item.totalPrice * item.quantity;
	        });

	        // 폼 생성
	        let $form = $("<form>", {
	            action: "payment_store",
	            method: "post"
	        });

	        // 장바구니 항목을 숨겨진 필드로 추가
	        cartItems.forEach(item => {
	            $form.append($("<input>", { type: "hidden", name: "itemName", value: item.itemName }));
	            $form.append($("<input>", { type: "hidden", name: "quantity", value: item.quantity }));
	            $form.append($("<input>", { type: "hidden", name: "totalPrice", value: item.totalPrice }));
	        });

	        // 총 가격 필드 추가
	        $form.append($("<input>", { type: "hidden", name: "totalSum", value: totalSum }));

	        // 폼을 문서에 추가하고 제출
	        $form.appendTo("body").submit();
	    });
	        
	        
	  		    
	});
	</script>
</html>