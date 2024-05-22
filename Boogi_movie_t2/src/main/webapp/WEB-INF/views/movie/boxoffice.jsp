<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnRequest").on("click", function() {
			
			let selectedDate = $("#date").val();
			console.log("선택된 날짜 : " + selectedDate); 
			if(selectedDate == "") {
				alert("날짜 선택 필수!");
				$("#date").focus();
				return;
			}
			
			// -----------------------------------------------------
		
			let targetDt = selectedDate.replaceAll("-",  "");
			console.log("요청할 조회 대상일자(replaceAll) : " + targetDt); 
			
			$(".movieList").remove();
			$(".info").remove();
			let key = "f5eef3421c602c6cb7ea224104795888";
			
			$.ajax({
				type : "GET",
				url : "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=" + key + "&targetDt=" + targetDt,
				dataType : "json",
				success : function(data) {
					let boxOfficeResult = data.boxOfficeResult;
					let boxofficeType = boxOfficeResult.boxofficeType;
					let showRange = boxOfficeResult.showRange;
						
					$("#resultArea").prepend("<h3 class='info'>" + boxofficeType + "(" + showRange.split("~")[0] + ")</h3>");
					
		
					let dailyBoxOfficeList = boxOfficeResult.dailyBoxOfficeList;
// 					console.log("dailyBoxOfficeList : " + dailyBoxOfficeList);
			
					for(let movie of dailyBoxOfficeList) {
						// 상세정보 조회를 위한 변수 생성
						let movieCd = movie.movieCd;
						let movieDetailUrl = "test6_json_movie_detail.jsp?key=" + key + "&movieCd=" + movieCd;
						
						$("#resultArea > table").append( // 테이블 내의 마지막에 행 추가
							"<tr class='movieList'>"
							+ "<td>" + movie.rank + "</td>"
							+ "<td>" + movie.movieNm + "</td>"
							+ "<td>" + movie.openDt + "</td>"
							+ "<td>" + movie.audiAcc + " 명</td>"
							+ "<td><input type='button' value='상세정보' onclick='location.href=\"" + movieDetailUrl + "\"'></td>"
							+ "</tr>"
						);
					}
				},
				error : function() {
					$("#resultArea").html("AJAX 요청 실패!");
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>AJAX - test5_json_movie_list2.jsp</h1>
	<input type="date" id="date">
	<input type="button" value="일별 박스오피스 조회" id="btnRequest">
	<hr>
	<div id="resultArea">
		<table border="1">
			<tr>
				<th width="80">현재순위</th>
				<th width="400">영화명</th>
				<th width="150">개봉일</th>
				<th width="100">누적관객수</th>
				<th></th>
			</tr>
			<%-- 영화 정보 파싱 결과 출력 위치 --%>
		</table>
	</div>
	<hr>
</body>
</html>








