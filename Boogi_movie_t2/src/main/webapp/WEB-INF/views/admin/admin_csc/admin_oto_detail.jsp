<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_detail</title>
<style>
	.container {
		width:850px;
		height:auto;
		margin: 0 auto;
		border-width: 5px;
		padding: 10px;
		
	}
	
	table {
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:800px;
		margin: 50px auto;
		border-collapse: collapse;
		text-align: center;
	}
	table tr td {
		border:1px solid black;
		padding : 15px;
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
	 
	input {
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
		<div>
			<form action="admin_oto_detail" method="post" onsubmit="return confirm('답변을 등록하시겠습니까?');">
			<input type="hidden" value="${oto.oto_num }" name="oto_num">
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
						<td><span>[${oto.theater_name}]</span></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${otoDate }</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="oto_content" rows="20" cols="100" style="resize: none" readonly >${oto.oto_content }</textarea>
						</td>
					</tr>
				</table>
				<div align="center">
					<h2>답변 쓰기</h2>
					<textarea name="oto_reply_content" rows="20" cols="100" style="resize: none"></textarea>
				</div>
				<!-- 답변 버튼 -->
				<div class="detail_button">
					<input type="submit" value="답변하기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="돌아가기" onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>