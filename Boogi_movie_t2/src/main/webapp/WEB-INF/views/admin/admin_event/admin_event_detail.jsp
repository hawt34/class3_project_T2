<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/admin_detail.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>
	
	<div class="row box">
		<div class="col-md-2" style="margin-right : 80px;">
		<!-- 사이드바 영역 -->
			<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
		</div>
		
		
		<div class="col-md-9">
		<div>
			<h3>이벤트 상세보기</h3>
			<hr>
		</div>
		<div class="container">
        <table class="table table-bordered board-table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">글번호</th>
                    <td>12412412</td>
                    <th scope="col">작성자</th>
                    <td>admin</td>
                </tr>
            
                <tr>
                    <th scope="col">제목</th>
                    <td colspan="3">adminadminadminadmin</td>
                </tr>
                <tr>
                    <th scope="col">이미지</th>
                    <td colspan="3"><a>webapp/resources/images/anything.jps</a></td>
                </tr>
                <tr>
                    <th scope="col"  colspan="4">내용</th>
                </tr>
                <!-- 이곳에 서버로부터 받은 데이터로 추가 행들을 채울 수 있습니다. -->
            </thead>
        </table>

       	<div class="text_area">
       		asdfasdfadfasdfasdf
       		asdfasdfasdfasdfasdfasdfa
       		asdfasdfasdfasdfvasdfasdf
       	</div>
		<div>
	       	<input type="submit" value="등록하기" class="btn btn-primary btn-lg btn-block col-md-3">
			<input type="reset" value="다시작성" class="btn btn-primary btn-lg btn-block col-md-3">
			<input type="button" value="돌아가기" class="btn btn-primary btn-lg btn-block col-md-3" onclick="window.close()">
		</div>	
	</div>
</div>

       	
    
    
    </div>
    
    
    
	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>
</body>
</html>
