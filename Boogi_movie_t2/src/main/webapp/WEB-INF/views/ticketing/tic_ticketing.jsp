<%@page import="itwillbs.p2c3.boogimovie.handler.DateUtils"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 사이트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/tic_ticketing.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .selected {
        background-color: #FFD700; /* 원하는 배경색으로 변경하세요 */
    }
    
   	a {
	  text-decoration-line: none;
	}
	
	 a:link { 
		color: red; 
		text-decoration: none;
	} 
	
	a:visited { 
		color: black; 
		text-decoration: none;
	}
	
	a:hover { 
		color: blue; 
		text-decoration: underline;
	}
	
</style>
</head>

<!-- 예매 메인 -->
<body>
<!-- 현재날짜와 이번달 최대일수를 계산하여 출력 -->
<%
    LocalDate currentDate = LocalDate.now();
    String startDate = currentDate.toString();
    int maxDay = currentDate.lengthOfMonth();
    int nowDay = currentDate.getDayOfMonth();
    int inputDay = nowDay + 10;
    pageContext.setAttribute("nowDay", nowDay);
    pageContext.setAttribute("day", inputDay > maxDay ? maxDay : inputDay);
    pageContext.setAttribute("currentDate", currentDate);
    pageContext.setAttribute("maxDay", maxDay);
%>

<header>
    <jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<form action="tic_choose_seat" method="post" id="fr">
<section class="tic_main">
    <div class="tic_title">
        <h3>영화 예매</h3>
            <hr>
    </div>
    <div class="row asdf">
        <!-- 본문 시작 -->
        <div class="col-md-12">
            <div class="row tic_row">
            <!-- tic_movie영역 시작 -->
                <div class="col-md-3 tic" style="padding-left: 20px; padding-right: 20px;">
                    <div class="tic_movie">
                    <!-- 설명영역 -->
                        <div class="explain" id="movieSelected">
                            영화를 선택해주세요
                        </div>
                    <!-- select박스 -->
                    <div class="row">
                        <div class="col-md-4">
                            <input type="checkbox" id ="like_movie" name="like_movie" value="나의취향" class="col-md-3">내취향
                        </div>
                    </div>
                    <!-- 영화정보 -->
                    <div class="movielist scroll" id="movielist">
                        <c:forEach items="${movieList }" var="movie">
                            <div class="movie_atrbt">
                                <c:choose>
                                    <c:when test="${movie.movie_grade eq '전체관람가' }">
                                        <img src="${pageContext.request.contextPath}/resources/images/tic_icon_all.gif" style="width : 48px; height : 48px;">
                                    </c:when>
                                    <c:when test="${movie.movie_grade eq '12세관람가' }">
                                        <img src="${pageContext.request.contextPath}/resources/images/tic_icon_over12.gif" style="width : 48px; height : 48px;">
                                    </c:when>
                                    <c:when test="${movie.movie_grade eq '15세관람가' }">
                                        <img src="${pageContext.request.contextPath}/resources/images/tic_icon_over15.gif" style="width : 48px; height : 48px;">
                                    </c:when>
                                    <c:when test="${movie.movie_grade eq '18세관람가(청소년관람불가)' }">
                                        <img src="${pageContext.request.contextPath}/resources/images/tic_icon_over18.gif" style="width : 48px; height : 48px;">
                                    </c:when>
                                </c:choose>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span id="movie_${movie.movie_num}">
                                        <a class="movie-link" onclick="movieClick('${movie.movie_name}', '${movie.movie_num}')">
                                            ${movie.movie_name}
                                        </a>
                                    </span>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- tic_movie종료 -->
            
                <!-- tic_theater 시작 -->
                <div class="col-md-3 tic" style="padding-left: 20px; padding-right: 20px;">
                    <div class="tic_theater">
                        <!-- 설명영역 -->
                        <div class="explain" id="theaterSelected">
                            상영관을 선택해주세요
                        </div>
                        <div class="row list">
                            <!-- theater 리스트1 -->
                            <div class="col-sm-6" style="border-right: solid 3px black; text-align: left;">
                                <ul>
                                    <li><a class="theater-link" onclick="javascript:theaterType('EntireTheater', 'entire')">전체극장</a></li>
                                </ul>    
                                <ul>
                                    <li><a class="theater-link" onclick="javascript:theaterType('MyTheater','${sessionScope.sId}')">MY영화관</a></li>
                                </ul>
                            </div>
                            <!-- theater 리스트2 -->
                            <div class="col-sm-6 theaterlist scroll" id="theaterlist">
                                <c:forEach items="${theaterList }" var="theater">
                                    <ul>
                                        <li><a class="theater-link" onclick="javascript:theaterClick('${theater.theater_name}')">${theater.theater_name }</a> </li>
                                    </ul>    
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- tic_theater 종료 -->
                <!-- tic_final 시작 -->
                <div class="col-md-6 tic" style="padding-left: 20px; padding-right: 20px;">
                    <div class="tic_final">
                        <!-- 설명영역 -->
                        <div class="explain" id="daySelected">
                            ${currentDate }
                        </div>
                            <div class="finallist">
                                <div class="daylist scroll">
                                    <div>
                                        <c:forEach begin="1" end="10" var="i">
                                            <c:choose>
                                                <c:when test="${nowDay <= maxDay}">
                                                    <input type="button" onclick="javascript:dayClick('${currentDate }', ${nowDay })" value="${nowDay }일">&nbsp;
                                                    <%
                                                        nowDay++;
                                                    pageContext.setAttribute("nowDay", nowDay);
                                                    %>
                                                </c:when>
                                                <c:otherwise>
                                                    //
                                                    <%
                                                        nowDay = 1;
                                                    pageContext.setAttribute("nowDay", nowDay);
                                                    %>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="finalmovielist scroll" id="finalmovielist">
                                    <div style="height : 300px">
                                    <br>
                                        <div align="center">영화 와 상영관 을 선택해주세요</div>
                                </div>
                                </div>
                            </div>
                    </div>
                    <!-- tic_final 종료 -->
                </div>
            </div>
        </div>
    </div>
    <!-- tic_row 종료 -->
    <div class="tic_button">
        <button type="submit" class="btn btn-outline-primary">좌석 선택</button>
    </div>
</section>
</form>

<footer>
    <jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let selectedMovie = "";
    let selectedTheater = "";
    let selectedDay = "";
    let form = $("#fr");

    function final_list_selected(movie_name, start_time, end_time, theater_name, selected_day) {
        let final_list_selected_things = "/" + movie_name + "/"
            + start_time + "/"
            + end_time + "/"
            + theater_name + "/"
            + selected_day + "/";

        let hiddenInput = $('#final_list_input');
        if (hiddenInput.length === 0) {
            hiddenInput = $('<input>').attr({
                type: 'hidden',
                id: 'final_list_input',
                name: 'final_list_data'
            });
            form.append(hiddenInput);
        }

        hiddenInput.val(final_list_selected_things);

        // 선택된 final_list의 배경색 변경
        $(".final_list").removeClass("selected");
        $(this).addClass("selected");
    }

    function finalList() {
        $.ajax({
            url: "api/finalList",
            method: "GET",
            data: {
                selectedMovie: selectedMovie,
                selectedTheater: selectedTheater,
                selectedDay: selectedDay
            },
            dataType: "json",
            success: function (response) {
                var result = $("#finalmovielist");
                result.empty();

                response.forEach(function (finalList) {
                    var finalDiv = "<div class='final_list' onclick='final_list_selected(\""
                        + finalList.movie_name
                        + "\", \"" + finalList.scs_start_time
                        + "\", \"" + finalList.scs_end_time
                        + "\", \"" + finalList.theater_name
                        + "\", \"" + selectedDay + "\")'>"
                        + "<div>" + finalList.movie_name + "</div>"
                        + "<div class='row box1' style='width: 600px'>"
                        + "<div class='col-md-3'>"
                        + finalList.scs_start_time + "<br>~" + finalList.scs_end_time
                        + "</div>"
                        + "<div class='col-md-5'>"
                        + finalList.screen_dimension + " || "
                        + "총 " + finalList.total_seat + "석 ||"
                        + finalList.scs_empty_seat + "석 남음"
                        + "</div>"
                        + "<div class='col-md-3'>"
                        + finalList.theater_name + " || "
                        + finalList.screen_cinema_num + " 관"
                        + "</div>"
                        + "</div>"
                        + "</div>";

                    result.append(finalDiv);
                });

                // 새롭게 생성된 final_list 항목에 클릭 이벤트 핸들러를 추가합니다.
                $(".final_list").click(function () {
                    $(".final_list").removeClass("selected");
                    $(this).addClass("selected");
                });
            },
            error: function () {
                alert("영화 정보를 가져오는 데 실패했습니다.");
            }
        });
    }

    function theaterType(type, sId) {
        if (sId == null || sId == "") {
            alert("로그인 후 이용해주세요");
            return;
        }

        $.ajax({
            url: "api/theater" + type,
            method: "GET",
            data: {
                sId: sId
            },
            dataType: "json",
            success: function (response) {
                var result = $("#theaterlist");
                result.empty();

                if (response.length === 0) {
                    result.append("<div>My 영화관 정보가 없습니다.</div>");
                    return;
                }

                if (response.length < 4) {
                    response.forEach(function (theater) {
                        var theaterDiv = '<ul><li><a class="theater-link" onclick="theaterClick(\'' + theater.member_my_theater + '\')">' + theater.member_my_theater + '</a></li></ul>';
                        result.append(theaterDiv);
                    });
                } else {
                    response.forEach(function (theater) {
                        var staticHtml = '<ul><li><a class="theater-link" onclick="theaterClick(\'' + theater.theater_name + '\')">' + theater.theater_name + '</a></li></ul>';
                        result.append(staticHtml);
                    });
                }

                // 새롭게 생성된 theater 항목에 클릭 이벤트 핸들러를 추가합니다.
                $("#theaterlist .theater-link").click(function () {
                    $("#theaterlist .theater-link").removeClass("selected");
                    $(this).addClass("selected");
                });
            },
            error: function () {
                alert("영화 정보를 가져오는 데 실패했습니다.");
            }
        });
    }

    function movieClick(movie_name, movie_num) {
        selectedMovie = movie_name;
        var result1 = $("#movieSelected");
        result1.empty();
        result1.append(movie_name);

        // 선택된 영화의 배경색 변경
        $("#movielist .movie-link").removeClass("selected");
        $("#movie_" + movie_num + " .movie-link").addClass("selected");
    }

    function theaterClick(theater_name) {
        selectedTheater = theater_name;
        var result = $("#theaterSelected");
        result.empty();
        result.append(theater_name);

        // 선택된 상영관의 배경색 변경
        $("#theaterlist .theater-link").removeClass("selected");
        $(".theater-link:contains('" + theater_name + "')").addClass("selected");
    }

    function dayClick(date, nowDay) {
        if (!selectedMovie || !selectedTheater) {
            alert("영화와 상영관을 선택해주세요.");
            return;
        }

        var baseDate = new Date(date);
        baseDate.setDate(nowDay);
        var formattedDate = baseDate.toISOString().split('T')[0];
        selectedDay = formattedDate;
        var result = $("#daySelected");

        // 선택된 날짜의 배경색 변경
        $(".daylist input").removeClass("selected");
        $(this).addClass("selected");

        result.empty();
        result.append(formattedDate);

        finalList();
    }

    function getGradeIcon(grade) {
        var contextPath = "${pageContext.request.contextPath}";
        switch (grade) {
            case "전체관람가":
                return "<img src='" + contextPath + "/resources/images/tic_icon_all.gif' style='width: 48px; height: 48px;'>";
            case "12세관람가":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over12.gif' style='width: 48px; height: 48px;'>";
            case "15세관람가":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over15.gif' style='width: 48px; height: 48px;'>";
            case "18세관람가(청소년관람불가)":
                return "<img src='" + contextPath + "/resources/images/tic_icon_over18.gif' style='width: 48px; height: 48px;'>";
            default:
                return "";
        }
    }

    function loadMovies(orderBy, sId) {
        $.ajax({
            url: "api/movie" + orderBy,
            method: "GET",
            data: {
                sId: sId
            },
            dataType: "json",
            success: function (response) {
                var result = $("#movielist");
                result.empty();
                if (response.length === 0) {
                    result.append("<div>내 취향의 영화가 없습니다.</div>");
                    return;
                }
                response.forEach(function (movie) {
                    var movieDiv = "<div class='movie_atrbt'>"
                        + getGradeIcon(movie.movie_grade)
                        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<span id='movie_" + movie.movie_num + "'>"
                        + "<a class='movie-link' onclick='movieClick(\"" + movie.movie_name + "\", \"" + movie.movie_num + "\")'>" + movie.movie_name + "</a>"
                        + "</span>"
                        + "</div>";

                    result.append(movieDiv);
                });

                // 새롭게 생성된 영화 항목에 클릭 이벤트 핸들러를 추가합니다.
                $("#movielist .movie-link").click(function () {
                    $("#movielist .movie-link").removeClass("selected");
                    $(this).addClass("selected");
                });
            },
            error: function () {
                alert("영화 정보를 가져오는 데 실패했습니다.");
            }
        });
    }

    $(document).ready(function () {
        var sId = '<%= session.getAttribute("sId") %>';

        $("#like_movie").change(function () {
            var likeMovie = $(this).is(":checked");
            var orderBy = "LikeMovie";

            if (likeMovie) {
                loadMovies(orderBy, sId);
            } else {
                orderBy = "Abc";
                loadMovies(orderBy, sId);
            }
        });
    });
</script>
</body>
</html>
