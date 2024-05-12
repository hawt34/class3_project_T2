<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_notice.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
</script>
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<style>
	th[colspan="4"] {
		text-align: center;
		font-size: 1.2em;
	}
</style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
<!-- main -->
<div class="container">
<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
	<div class="row">
		<!--사이드바 영역  -->
		<div class="col-2">
			<jsp:include page="csc_sidebar.jsp"></jsp:include>	
		</div>
		<!-- content 영역 - 게시판 형식의 공지/뉴스 -->
		<div class="col-10">
			<div id="csc_mainTitle">
				<h1>공지사항</h1>
			</div>
			<hr>
			<div class="row">
			
				<div class="col-1 mt-3">
					<span>전체 ${pageList.listCount }건</span>
				</div>
				
				<div class="col-11">
					<div class="csc_local" data-theater="전체1">전체</div>
					<div class="csc_local" data-theater="해운대점">해운대점</div>
					<div class="csc_local" data-theater="센텀점">센텀점</div>
					<div class="csc_local" data-theater="서면점">서면점</div>
					<div class="csc_local" data-theater="남포점">남포점</div>
					<div class="csc_local" data-theater="부산대점">부산대점</div>
					<div class="csc_local" data-theater="사직점">사직점</div>
					<div class="csc_local" data-theater="영도점">영도점</div>
					<div class="csc_local" data-theater="덕천점">덕천점</div>
					<div class="csc_local" data-theater="정관점">정관점</div>
					<div class="csc_local" data-theater="사상점">사상점</div>
					
					<div class="csc_search">
						<!--공지 찾는 검색창  -->
						<form method="post" action="">
							<input type="text" placeholder="검색어를 입력해주세요"> 
								<i class="bi bi-search searchIcon"></i>
							<div class="csc_searcher">
								<input type="submit" value="검색">
							</div>
						</form>
					</div>
					
				</div>
			</div>
			<hr>
			<!-- 게시판 -->
			<div class="row">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>공지구분</th>
							<th>극장</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody class="noticeTheaterList">
						<c:choose>
							<c:when test="${empty noticeList }">
								<tr>
									<th colspan="4">게시물이 없습니다</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${noticeList }">
									<tr>
										<td>${notice.notice_num }</td>
										<td>${notice.notice_category}</td>
										<td>${notice.theater_name }</td>
										<td onclick="location.href='csc_notice_detail?notice_num=${notice.notice_num}'">${notice.notice_subject }</td>
										<td>${notice.notice_fdt }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 페이지네이션-페이징 -->
			<hr>
			
			<div class="notice_pageArea">
				<nav aria-label="Page navigation example" >
					<ul class="pagination">
						<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" >
							<a class="page-link" href="csc_notice?pageNum=${pageNum - 1}" aria-label="Previous" >
							<span aria-hidden="true" >&laquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="${pageList.startPage }" end="${pageList.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i }">
									<li class="page-item active"><a class="page-link" >${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="csc_notice?pageNum=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
							<a class="page-link" href="csc_notice?pageNum=${pageNum + 1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			


		</div>
	</div>
</div>
<!-- footer -->
<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
<script type="text/javascript">
$(function() {
	$(".csc_local").click(function() {
		const theaterName = $(this).data("theater");
// 		console.log(theaterName);
		//=====================================================
		//paging처리를 위한 함수 정의
		function createPagination(pageList, pageNum) {
		 // 페이지 이동 함수
		    function goToPage(pageNum) {
		        location.href = "csc_notice?pageNum=" + pageNum;
		    }
	
		    let pageLinks = [];
	
		    // 이전 페이지 링크
		    var previousPageLink = $("<li>", { class: "page-item" });
		    if (pageNum === 1) {
		        previousPageLink.addClass("disabled");
		    }
		    previousPageLink.append(
		        $("<a>", {
		            class: "page-link",
		            href: "csc_notice?pageNum=" + (pageNum - 1)
		        }).append(
		            $("<span>").text("«")
		        )
		    );
		    pageLinks.push(previousPageLink);
	
		    // 페이지 번호 링크들
		    for (var i = pageList.startPage; i <= pageList.endPage; i++) {
		        var pageLink = $("<li>", { class: "page-item" });
		        if (i === pageNum) {
		            pageLink.addClass("active");
		        }
		        pageLink.append(
		            $("<a>", {
		                class: "page-link",
		                text: i,
		                click: function() {
		                    goToPage(i); // 클릭된 페이지 번호로 이동
		                }
		            })
		        );
		        pageLinks.push(pageLink);
		    }
	
		    // 다음 페이지 링크
		    var nextPageLink = $("<li>", { class: "page-item" });
		    if (pageNum === pageList.maxPage) {
		        nextPageLink.addClass("disabled");
		    }
		    nextPageLink.append(
		        $("<a>", {
		            class: "page-link",
		            href: "csc_notice?pageNum=" + (pageNum + 1)
		        }).append(
		            $("<span>").text("»")
		        )
		    );
		    pageLinks.push(nextPageLink);
	
		    // 페이지 네비게이션 요소에 추가
		    $(".pagination").empty().append(pageLinks);
		}
			
			
			
				
// 		});
		
		
		
		//====================================================
		 $.ajax({
            url: "csc_notice.json",
            method: "GET", // 예시로 POST 메서드를 사용하였습니다. 필요에 따라 변경 가능합니다.
            
            data: {
                theaterName: theaterName
            },
            dataType: "json",
            success: function(response) {
//          	console.log(response.pageList);
				let noticeList = response.noticeList;
				
				let tbody = $(".noticeTheaterList");
				tbody.empty();
				
				
				
				$.each(noticeList, function(index, notice) {
					let tr = $("<tr>");
					
					tr.append("<td>" + notice.notice_num + "</td>");
		            tr.append("<td>" + notice.notice_category + "</td>");
		            tr.append("<td>" + notice.theater_name + "</td>");
		            tr.append("<td onclick='location.href=\"csc_notice_detail?notice_num=" + notice.notice_num + "\"'>" + notice.notice_subject + "</td>");
            		tr.append("<td>" + notice.notice_fdt + "</td>");

		            tbody.append(tr);
				});
				
				let pageList = response.pageList;
				let pageNum = response.pageNum; // 현재 페이지 번호를 가져옴
		        createPagination(pageList, pageNum);
				
            },
            error: function() {
                alert("요청을 보내는 중에 오류가 발생하였습니다.");
            }
        });
		
	});
});

</script>
</body>
</html>