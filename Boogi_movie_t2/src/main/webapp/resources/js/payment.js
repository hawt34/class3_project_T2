//체크박스 전체선택
const selectAll = (selectAll) => {
    const checkboxes = document.querySelectorAll('input[name="agmt"]');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
    }); // forEach

} // selectAll

// 하나라도 체크 해제되면 전체선택 해제
const checkSelectAll = (checkbox) => {
    const selectall = document.querySelector('#agmt-all');

    if (!checkbox.checked) {
        selectall.checked = false;
    } // if

} // checkSelectAll


// 모달창에 사용가능한 포인트 조회
const getMemberPoint = () => {
	$('.wrapper>.box').empty();

	// 전송파라미터
	const params = { "member_id": member_id };
	    

    $.ajax({
        url: "/coupons/my",
        type: "GET",
        data: params,
        dataType: "JSON",
        success: data => {
            
			document.querySelector("#payModalLabel>span").innerText = data.length; // 사용가능 쿠폰갯수 표시
			
            $.each(data, (i, e) => {
	
				e.couponEndTs = e.couponEndTs === null ? '' : ('~' + e.couponEndTs);

                let str = '<input type="radio" class="coupon-select" name="select" id="coupon-' + i + '" value="'
                    + e.couponId + '"/>'
                    + '<label for="coupon-' + i + '" class="coupon-select" id="' + e.couponId + '">'
                    + '<div class="select-dots"></div>'
                    + '<div class="row">'
                    + '<div class="col-2 text-dc-pct">' + e.couponDcPct + '%</div>'
                    + '<div class="col-7 text-name">' + e.couponName + '</div>'
                    + '<div class="col-3 text-ts">' + e.couponEndTs + '</div>'
                    + '</div>'
                    + '</label>';

                $('.wrapper>.box').append(str);
            }); // .each

        } // success
    }) // .ajax
} // getCouponList
	
// 모달창에 사용가능한 쿠폰 조회
const getCouponList = () => {
	    $('.wrapper>.box').empty();

	    // 전송파라미터
	    const params = { "member_id": member_id };
	    

	    $.ajax({
	        url: "memberCoupon",
	        type: "GET",
	        data: params,
	        dataType: "JSON",
	        success: data => {
	            
				document.querySelector("#payModalLabel>span").innerText = data.length; // 사용가능 쿠폰갯수 표시
				
	            $.each(data, (i, e) => {

	                let str = '<input type="radio" class="coupon-select" name="select" id="coupon-' + i + '" value="'
	                    + e.coupon_num + '"/>'
	                    + '<label for="coupon-' + i + '" class="coupon-select" id="' + e.coupon_num + '">'
	                    + '<div class="select-dots"></div>'
	                    + '<div class="row">'
	                    + '<div class="col-2 text-dc-pct">' + e.coupon_num + '%</div>'
	                    + '<div class="col-7 text-name">' + e.coupon_name + '</div>'
	                    + '</div>'
	                    + '</label>';

	                $('.wrapper>.box').append(str);
	            }); // .each

	        } // success
	    }) // .ajax
	} // getCouponList