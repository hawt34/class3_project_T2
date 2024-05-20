<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_detail</title>
<style>
	.container {
		width:750px;
		height:auto;
		margin: 0 auto;
/* 		border:1px solid #6699FF; */
/* 		border-width: 5px; */
		padding: 10px;
		
	}
	table {
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:80%;
		margin: 0 auto;
		border-collapse: collapse;
		text-align: center;
	}
	table tr td {
		border:1px solid black;
		padding : 10px;
	}
	
	td:nth-child(odd) {
	  font-weight: bold;
	  text-align: left;
	  background-color: skyblue;
	}
	
	td:nth-child(even) {
	  font-weight: bold;
	  text-align: left;
	}
	
	 tr:nth-child(4) td {
	 	text-align: center;
	 	background-color: white;
	 }
	 
	table td:first-child {
		border-left: 0;
	}
	
	table td:last-child {
		border-right: 0;
	}
	 
	
	input[value="목록"] {
		padding:10px;
		background-color: skyblue;	
		font-weight: bold;
		border-radius: 5px;
	}
	.detail_button {
		text-align: center;
		margin-top: 15px;
	}
	
	span {
		color:#6699FF;
	}
	
</style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
	<div class="container">
		<div class="row">
			<div class="col-2">
				<jsp:include page="/WEB-INF/views/mypage/inc/myp_aside.jsp"></jsp:include>
			</div>
			<div class="col-10">
				<form action="myp_oto_modifyPro" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td>${oto.oto_subject }</td>
							<td>작성자</td>
							<td>${oto.member_id }</td>
						</tr>
						<tr>
							<td>문의 유형</td>
							<td><span>[${oto.oto_category }]</span></td>
							<td>문의 지점</td>
							<td><span>[${oto.theater_name }]</span></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${otoDate}</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="18" cols="90" style="resize: none" disabled>${oto.oto_content }</textarea>
							</td>
						</tr>
						
					</table>
					<!-- 답변 버튼 -->
					<div class="detail_button">
						<input type="button" value="목록" onclick="history.back()">
					</div>
				</form>
			</div>
		</div>
	</div>
<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>