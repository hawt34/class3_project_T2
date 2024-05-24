<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
</head>
<style>
    .seat.disabled {
        background-image: url("${pageContext.request.contextPath}/resources/images/tic_payed_seat.png");
        background-size: cover; /* 이미지가 좌석 크기에 맞게 조정되도록 설정 */
        cursor: not-allowed; /* 마우스 커서가 not-allowed로 표시되도록 설정 */
       	background-color: transparent;
    }
</style>
<script>
	console.log("${keyword}");
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<%-- <link href="${pageContext.request.contextPath}/resources/css/tic_choose_seat.css" rel="stylesheet" type="text/css"> --%>
<style>
	#seat_num{
		margin-bottom : 50px;
		position : relative;
	}
	
	.choose_seat_section{
		width : 1400px;
		margin: 0 auto;
	}
	.opacity {
		opacity : 0.6;
		pointer : none;
		
	}
	
	div{
		diplay : block;
		unicode-bidi: isolate;
		
	}
	
	#wrapper {
    	user-select: none;
	}
	
	.center {
	    text-align: center;
	}
	
	section {
	    display: block;
	    unicode-bidi: isolate;
	}
	.seat {
	    width: 25px;
	    height: 25px;
	    background-color: #a6a6a6;
	    margin: 1px;
	    display: inline-block;
	    cursor: pointer;
	    align-items: center;
	    line-height: 30px;
	    color: white;
	    font-size: 0.8em;
	    border-radius : 5px;
	}
	
	.seat.selected {
	    background-color: #B2FFFF; /* 선택된 좌석 색상 변경 */
	    color: black;
	}

	
	.asdf label {
	    display: inline-block; /* 각 라벨을 가로로 정렬 */
	}
	
	.asdf > div {
    	display: inline-block;
    	padding-right: 0; /* 라벨과 셀렉트 박스 사이의 간격을 조정합니다. */
	}
	
	.asdf {
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    width:100%;
	    justify-content: center; /* 요소를 가운데 정렬합니다. */
	    text-align: center;
		margin-top: 50px; /* 위쪽 여백 설정 */
		margin-bottom: 40px;
		margin-left: auto; /* 왼쪽 여백을 자동으로 설정 */
		margin-right: auto; /* 오른쪽 여백을 자동으로 설정 */
	}
	
	.person_info{
		text-align : center;
		margin-bottom : 40px;		
	}
	
	
	.asdf label, .asdf select {
	    margin-bottom: 5px;
	}
	
	.asdf > div {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin-right: 0px;
    	width: 100px;
	}
	
	.asdf > div:last-child {
    	margin-right: 0; /* 마지막 요소의 우측 여백 제거 */
	}
	
    
    
	.final_pay{
		width : 70%;
		height: 300px;
		background-color : white;
		height:20%;
	} 
	

	
	.choose_seat_title{
		margin: 50px 350px;
	}
	
	.pay_movie_img{
		border-right: solid 3px black;
		paading-top : 30px;
	}
	
	.pay_theater{
		border-right: solid 3px black;
	}
	
	.pay_seat{
		border-right: solid 3px black;
	}
	
	.pay_fee{
		border-right: solid 3px black;
	}
	
	
	
	.box1{
		height: 900px;
		margin : auto;
	}
	
	.choose_person{
		width: 70%;
		height : 65%;
		margin: 20px auto;
	}
	
	img{
		padding-top : 20px;
	}
	
	.movie_ex{
		font-size : 15px;
		font-color : white;
		font-weight : bold;
	}
	
	.theater_ex{
		font-size : 17px;
 		padding-top: 50px;
 		font-color : white;
 		font-weight : bold; 
	}
	
	.seat_ex{
 		padding-top: 70px ;
		font-size : 15px;
		font-color : white;
		font-weight : bold;
	}
	
	.fee_ex{
		font-size : 10px;
 		padding-top: 70px;
 		font-color : white; 
 		font-weight : bold;
	}
	
	.pay_button{
		padding-top: 50px;
	}
	
	
	
	
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<form action="payment" method="post" id="fr">
    <input type="hidden" id="movie_name" name="movie_name" value="${scs.movie_name}">
    <input type="hidden" id="theater_name" name="theater_name" value="${scs.theater_name}">
    <input type="hidden" id="screen_cinema_num" name="screen_cinema_num" value="${scs.screen_cinema_num}">
    <input type="hidden" id="selected_seats" name="selected_seats">
    <input type="hidden" id="person_info" name="person_info">
    <input type="hidden" id="total_fee" name="total_fee">
    <input type="hidden" id="scs_start_time" name="scs_start_time" value="${start_time}">
    <input type="hidden" id="scs_end_time" name="scs_end_time" value="${end_time}">
    <input type="hidden" id="scs_date2" name="scs_date2" value="${scs_date }">
    <input type="hidden" id="scs_num" name="scs_num" value="${scs.scs_num }">
    <input type="hidden" id="keyword" name="keyword" value="${keyword}">
    
    
<div class="choose_seat_title">
	<h3>좌석 선택</h3>
	<hr>
</div>
<section class="choose_seat_section">
	<div class="row">
	
	
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
			
			<label class="person_option">우대</label>
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
				<div class="theater_ex">${scs.theater_name} ${scs.screen_cinema_num }관<br>${start_time} ~ ${end_time}</div>
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
</form>		
		


<footer style="margin-top: 100px;">
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
<script>
//폼 제출 이벤트 처리
document.getElementById('fr').onsubmit = function (event) {
    event.preventDefault(); // 기본 제출 이벤트 방지

    // 선택된 좌석 정보 업데이트
    document.getElementById('selected_seats').value = selectedSeatNumbers.join(", ");

    // 인원 정보 업데이트
    var personInfo = "일반: " + selectedPersonCount['NP'] + "명, " +
                     "청소년: " + selectedPersonCount['YP'] + "명, " +
                     "우대: " + selectedPersonCount['OP'] + "명";
    document.getElementById('person_info').value = personInfo;

    // 총 요금 업데이트
    var totalFee = $("#fee_ex").text();
    document.getElementById('total_fee').value = totalFee;

    // 폼 데이터 서버로 제출
    this.submit();
};


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
    var fee_middle = 15000 * (fee_day_discount / 100) * (fee_time_discount / 100) * (fee_dimension_discount / 100);
	
    
    function feeCalc(){
    	$.ajax({
	        url: "api/fee_calc",
	        method: "GET",
	        data: {
	            NP: selectedPersonCount.NP,
	            YP: selectedPersonCount.YP,
	            OP: selectedPersonCount.OP,
	            fee_middle: fee_middle
	        },
	        dataType: "json",
	        success: function (response) {
	            var result = $("#fee_ex");
	            result.empty();
				
	         // 서버에서 받은 응답을 화면에 표시
	            var finalDiv = $("<div>").text(response + "원"); // 여기서 response는 계산된 총 요금을 담은 정수입니다.
	            result.append(finalDiv);
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
	    updatePersonInfoDisplay(); // 인원 정보 표시를 업데이트하는 함수 호출
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
 // 인원 정보를 화면에 표시하는 함수
    function updatePersonInfoDisplay() {
        var info = "일반: " + selectedPersonCount['NP'] + "명, " +
                   "청소년: " + selectedPersonCount['YP'] + "명, " +
                   "우대: " + selectedPersonCount['OP'] + "명";
        $('.person_info h3').text("선택한 인원: " + info); // 인원 정보 영역을 업데이트
    }
 
    window.onload = function() {
        var payedSeats = "${payedSeats}";
        
        // 문자열을 '/'로 분할
        var seatsArray = payedSeats.split('/');
        
        // 분할된 배열의 각 요소를 로그로 출력
        seatsArray.forEach(function(seat) {
        	 var seatElement = document.querySelector('.seat[value="' + seat + '"]');
             if (seatElement) {
                 // 좌석을 비활성화 (클릭 이벤트 제거)
                 seatElement.classList.add('disabled');
                 seatElement.onclick = null;
             }
        });
    };
    
    function toggleSeat(element) {
        if (element.classList.contains('disabled')) {
            // 비활성화된 좌석은 선택하지 않음
            return;
        }
        
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
    // 모든 좌석에 클릭 이벤트 리스너 추가
//     document.querySelectorAll('.seat').forEach(function(seat) {
//         seat.onclick = function() { toggleSeat(this); };
//     });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
</body>
</html>