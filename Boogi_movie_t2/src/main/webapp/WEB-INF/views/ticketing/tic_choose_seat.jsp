<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/tic_choose_seat.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>



<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>


<section class="choose_seat_section">
	<div class="choose_seat_title">
		<h3>좌석 선택</h3>
		<hr>
	</div>
	<div class="row">
	
	<div class="col-md-2">
		<jsp:include page="../inc/admin_aside.jsp"></jsp:include>
	</div>
	
<div class="box1 col-md-10">
<div class="choose_person">
	<div class="asdf">
		<label class="person_option">일반</label>
		
		<div class="custom-select">
	  	<select onchange="updateSeatSelection(this.value, 'NP')">
		    <option>0명</option>
		    <option value="1">1명</option>
		    <option value="2">2명</option>
	  	</select>
		</div>     
		
		<label class="person_option">청소년</label>
		<div class="custom-select">
		  	<select onchange="updateSeatSelection(this.value, 'YP')">
			    <option>0명</option>
			    <option value="1">1명</option>
			    <option value="2">2명</option>
		  	</select>
		</div>
		
		<label class="person_option">노약자</label>
		<div class="custom-select">
		  	<select onchange="updateSeatSelection(this.value, 'OP')">
			    <option>0명</option>
			    <option value="1">1명</option>
			    <option value="2">2명</option>
		  	</select>
		</div>
	</div>
	<div class="person_info">
		<h3>인원을 선택해주세요</h3>
	</div>    
	
	<div class="center">
		<c:forEach var="seat" items="${seats}" varStatus="status">
			<div class="seat" onclick="toggleSeat(this)" value="${seat}">${seat}</div>
				<c:if test="${status.index % firstRoad eq firstRoad - 1 || status.index % secondRoad eq secondRoad - 1}">
					<span class="spacer">&nbsp;&nbsp;&nbsp;&nbsp;</span> <!-- 복도에 공백 삽입 -->
				</c:if>
				<c:if test="${(status.index + 1) % endCol eq 0}">
					<br/> <!-- 각 행의 끝에서 줄바꿈 -->
				</c:if>
		</c:forEach>   	
	</div>
			<div class="final_pay row" style="margin-top: 50px; margin-left: 100px;">
	
		<div class="col-md-3 pay_movie_img">
			<img src="${scs.movie_poster}" width="100" height="150">
			<label class="movie_ex">${scs.movie_name }</label>
		</div>
		
		<div class="col-md-3 pay_theater">
			<div class="theater_ex">${scs.theater_name} ${scs.screen_cinema_num }관</div>
		</div>
			
		
		<div class="col-md-2 pay_seat">
			<div class="seat_ex" id="seat_ex">선택된 좌석: 없음</div>
		</div>
			
			
		<div class="col-md-2 pay_fee">
			<div class="fee_ex" id="fee_ex"></div>
		</div>
			
		<div class="col-md-2 pay_button">
			<button type="submit" class="btn btn-outline-primary">결제</button>
		</div>
			
	</div>
</div>
</div>


</div>
</section>
		
		


<footer style="margin-top: 100px;">
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
<script>
    var totalSeats = 0; // 전체 선택 가능한 좌석 수
    var selectedSeats = 0; // 현재 선택된 좌석 수
    var selectedSeatNumbers = []; // 선택된 좌석 번호들을 저장하는 배열
    var selectedPersonCount = { // 각 유형별 선택된 인원 수를 저장하는 객체
    	    'NP': 0,
    	    'YP': 0,
    	    'OP': 0
    	};
    
    // 서버에서 전달된 요금 관련 키워드
    var fee_day_discount = "${fee_day_discount}";
    var fee_time_discount = "${fee_time_discount}";
    var fee_dimension_discount = "${fee_dimension_discount}";
    // 좌석에 따른 요금 계산
    var fee_middle = 15000 
    				+ 15000 / 100 * fee_day_discount
    				+ 15000 / 100 * fee_time_discount
    				+ 15000 / 100 * fee_dimension_discount;
    
    function feeCalc(){
    	$.ajax({
	        url: "api/fee_calc",
	        method: "GET",
	        data: {
	        	selectedPersonCount : selectedPersonCount,
	            fee_middle : fee_middle
	           
	        },
	        dataType: "json",
	        success: function (response) {
	            var result = $("#fee_ex");
	            result.empty();
				
	            response.forEach(function (fee_calc) {
	            	var finalDiv = resopnse + "원"; 
						
	                result.append(finalDiv);
	            });
	        },
	        error: function () {
	            alert("요금 정보를 가져오는 데 실패했습니다.");
	        }
	    });
    }
    
    // 선택 가능한 인원 수를 업데이트하는 함수
	function updateSeatSelection(value, type) {
	    var num = parseInt(value, 10);
	    totalSeats -= selectedPersonCount[type]; // 이전에 선택된 해당 유형의 인원 수를 총석에서 제거
	    totalSeats += num; // 새로운 인원 수를 총석에 추가
	    selectedPersonCount[type] = num; // 해당 유형의 선택된 인원 수 업데이트
	
	    console.log("Total seats to select: " + totalSeats);
	    console.log("Selected person types:", selectedPersonCount);
	    updateSeatDisplay(); // 인원 수 변경 시 좌석 표시 업데이트
	    feeCalc();
	}

    // 좌석을 토글하는 함수
    function toggleSeat(element) {
        var seatNumber = element.getAttribute("value");
        if (element.classList.contains('selected')) {
            // 이미 선택된 좌석을 해제하는 경우
            element.classList.remove('selected');
            selectedSeats--;
            // 선택된 좌석 배열에서 좌석 번호 제거
            selectedSeatNumbers = selectedSeatNumbers.filter(num => num !== seatNumber);
        } else {
            // 새로운 좌석을 선택하는 경우
            if (selectedSeats < totalSeats) {
                element.classList.add('selected');
                selectedSeats++;
                selectedSeatNumbers.push(seatNumber); // 배열에 좌석 번호 추가
            } else {
                alert("최대 선택 가능한 좌석 수를 초과하였습니다.");
            }
        }
        updateSeatDisplay();
        console.log("Selected seats: " + selectedSeats);
    }

    // 선택된 좌석을 화면에 표시하는 함수
    function updateSeatDisplay() {
        var displayElement = document.querySelector('.seat_ex');
        if (selectedSeatNumbers.length > 0) {
            displayElement.textContent = "선택된 좌석: " + selectedSeatNumbers.join(", ");
        } else {
            displayElement.textContent = "선택된 좌석: 없음";
        }
    }

    // 모든 좌석에 클릭 이벤트 리스너 추가
//     document.querySelectorAll('.seat').forEach(function(seat) {
//         seat.onclick = function() { toggleSeat(this); };
//     });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
</body>
</html>