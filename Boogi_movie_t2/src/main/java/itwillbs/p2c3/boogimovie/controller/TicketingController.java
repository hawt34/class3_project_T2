package itwillbs.p2c3.boogimovie.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.service.TicketingService;
import itwillbs.p2c3.boogimovie.vo.FeeAgeVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.MyTheaterVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TicketingController {
	
	@Autowired
	private MovieInfoService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private TicketingService ticketingService;
	
	
	
	
	@GetMapping("tic_ticketing")
	public String ticketing(HttpSession session, Model model) {
		System.out.println("tic_ticketing()");
		
//		--로그인판별--
		
//		if(session.getAttribute("sId") == null) {
//			model.addAttribute("msg", "로그인 후 이용해주세요");
//			model.addAttribute("targetURL", "member_login");
//			return "error/fail";
//		}
		
		List<MovieVO> movieList = movieService.getMovieList();
		List<TheaterVO> theaterList = theaterService.getTheatersOrderbyName();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theaterList", theaterList);
		
		return "ticketing/tic_ticketing";
	}
	
	
	@PostMapping("tic_choose_seat")
	public String choose_seat(String final_list_data, Model model) {
		//data 쪼개서 저장
		String movie_name  = final_list_data.split("/")[1];
		String start_time = final_list_data.split("/")[2];
		String end_time = final_list_data.split("/")[3];
		String theater_name = final_list_data.split("/")[4];
		String selected_day = final_list_data.split("/")[5];
		// 포스터 가져오기
		MovieVO movie = new MovieVO();
		movie.setMovie_name(movie_name);
		MovieVO dbMovie = movieService.getMovieInfo(movie);
		String movie_poster = dbMovie.getMovie_poster();
		// 날짜와 시간 형식 지정 및 합치기
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedStartDateTime = selected_day + " " + start_time + ":00";
		String formattedEndDateTime = selected_day + " " + end_time + ":00";
		Timestamp start_date = null;
		Timestamp end_date = null;
		// 날짜 파싱 및 Timestamp 객체 생성
		try {
		    java.util.Date parsedStartDate = dateFormat.parse(formattedStartDateTime);
		    java.util.Date parsedEndDate = dateFormat.parse(formattedEndDateTime);
		    start_date = new Timestamp(parsedStartDate.getTime());
		    end_date = new Timestamp(parsedEndDate.getTime());

		    System.out.println(start_date);
		    System.out.println(end_date);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		//theater_num 가지고오기
        int theater_num = theaterService.getTheaterName(theater_name);
        //movie_num 가지고오기
        int movie_num = dbMovie.getMovie_num();
		//screen_sessionVO 에 넣기	
		ScreenSessionVO scs = new ScreenSessionVO();
		scs.setMovie_num(movie_num);
		scs.setTheater_num(theater_num);
		scs.setScs_start_date(start_date);
		scs.setScs_end_date(end_date);
		System.out.println(scs.getScs_start_date());
		System.out.println(scs.getScs_end_date());
		//db에서 값 가져오기
		ScreenSessionVO dbScs = ticketingService.chooseSeatSelect(scs);
		//뷰에 가져갈 값 저장하기
		dbScs.setMovie_poster(movie_poster);
		dbScs.setMovie_name(movie_name);
		dbScs.setTheater_name(theater_name);
		//seats 2차원 배열 만들기
		List<String> seats = new ArrayList<>();
		char endRow = dbScs.getScreen_seat_col().charAt(0);
		int endCol = Integer.parseInt(dbScs.getScreen_seat_row());
		
		
	    for (char row = 'A'; row <= endRow; row++) {
	        for (int num = 1; num <= endCol; num++) {
	            seats.add("" + row + num);
	        }
	    }
        //복도 공백
        int first_road = 3;
        int second_road = 12;
		//시간으로 조조,심야 걸러내기
        String fee_time_keyword = "GT";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime time = LocalTime.parse(start_time, formatter);

        LocalTime morningLimit = LocalTime.of(10, 0);
        LocalTime nightLimit = LocalTime.of(23, 0);
        
        if (time.isBefore(morningLimit)) {
        	fee_time_keyword = "MT";
        } else if(time.isAfter(nightLimit)){
        	fee_time_keyword = "NT";
        }
        
        //주말 공휴일 걸러내기
        String fee_day_keyword = "WD";
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(selected_day, formatter2);
        DayOfWeek day = date.getDayOfWeek();
        boolean isWeekend = (day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY);
        
        if (isWeekend) {
        	fee_day_keyword = "HD";
        }
        //2D , 3D 걸러내기
        String fee_dimension_keyword = dbScs.getScreen_dimension();
        
        //걸러낸값으로 select 해오기
        Map<String, String> params = new HashMap<String, String>();
        params.put("fee_day_keyword", fee_day_keyword);
        params.put("fee_time_keyword", fee_time_keyword);
        params.put("fee_dimension_keyword", fee_dimension_keyword);
        System.out.println(params);
        Map<String, Object> fee_info = ticketingService.feeCalc(params);
        
        
		//model에 저장
		model.addAttribute("scs", dbScs);
		model.addAttribute("seats", seats);
        model.addAttribute("firstRoad", first_road);
        model.addAttribute("secondRoad", second_road);
        model.addAttribute("endRow", endRow);
        model.addAttribute("endCol", endCol);
        model.addAttribute("fee_time_discount", fee_info.get("fee_time_discount"));
        model.addAttribute("fee_day_discount", fee_info.get("fee_day_discount"));
        model.addAttribute("fee_dimension_discount", fee_info.get("fee_dimension_discount"));
        
        
		return "ticketing/tic_choose_seat";
	}
	
	@ResponseBody
	@GetMapping(value = "api/movieAbc", produces = "application/json")
	public List<MovieVO> movieAbc(){
		List<MovieVO> movies = movieService.getMovieListAbc();
		return movies; 
	}
	
	@ResponseBody
	@GetMapping(value = "api/movieLike", produces = "application/json")
	public List<MovieVO> movieLike(){
		List<MovieVO> movies = movieService.getMovieListLike();
		return movies; 
	}
	
	@ResponseBody
	@GetMapping(value = "api/movieLikeMovie", produces = "application/json")
	public List<MovieVO> movieLikeMovie(@RequestParam String sId){
		String memberMovieGenre = memberService.movieGenreSearch(sId);
		MovieGenreVO movieGenre = new MovieGenreVO();
		movieGenre.setGenre_name(memberMovieGenre);
		int genre_num = movieService.getMovieGenreNum(movieGenre);
		List<MovieVO> movies = movieService.getMovieListGenre(genre_num);
		
		return movies;
	}
		
	@ResponseBody
	@GetMapping(value = "api/theaterMyTheater", produces = "application/json")
	public List<MyTheaterVO> theaterMyTheater(@RequestParam String sId){
		MemberVO member = memberService.selectTheatersMyTheater(sId);
		List<MyTheaterVO> myTheaters = new ArrayList<MyTheaterVO>();
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater1()));
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater2()));
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater3()));
		
		
		return myTheaters;
	}
	
	@ResponseBody
	@GetMapping(value = "api/fee_calc", produces = "application/json")
	public int feeCalc(@RequestParam Map<String, Integer> params){
		Integer np_num = params.getOrDefault("NP", 0);
		Integer yp_num = params.getOrDefault("YP", 0);
		Integer op_num = params.getOrDefault("OP", 0);
		Integer fee_middle = params.getOrDefault("fee_middle", 0);
		
		List<FeeAgeVO> list = ticketingService.feeCalcAge();
		int np_discount = 0;
		int yp_discount = 0;
		int op_discount = 0;
		for(FeeAgeVO feeAge : list) {
			if(feeAge.getFee_age_keyword().equals("NP")) {
				np_discount = 15000 / 100 * feeAge.getFee_age_discount();
			}else if(feeAge.getFee_age_keyword().equals("YP")) {
				yp_discount = 15000 / 100 * feeAge.getFee_age_discount();
			}else if(feeAge.getFee_age_keyword().equals("OP")) {
				op_discount = 15000 / 100 * feeAge.getFee_age_discount();
			}
		}
		
		int total_fee = np_num * np_discount
					  + yp_num * yp_discount
					  + op_num * op_discount;
		
		return fee_middle + total_fee;
	}
				
		
		
		
			
			
		
		
		
	
	
	@ResponseBody
	@GetMapping(value = "api/finalList", produces = "application/json")
	public List<ScreenSessionVO> finalList(@RequestParam String selectedMovie,@RequestParam String selectedTheater,@RequestParam String selectedDay){
		//가져온 영화이름정보로 무비번호 가져오기
		MovieVO movie = new MovieVO();
		System.out.println(selectedMovie);
		movie.setMovie_name(selectedMovie);
		MovieVO dbMovie = movieService.getMovieInfo(movie);
		int movie_num = dbMovie.getMovie_num();
		
		//가져온 극장 정보로 극장번호 가져오기
		TheaterVO theater = new TheaterVO();
		theater.setTheater_name(selectedDay);
		int theater_num = theaterService.getTheaterName(selectedTheater);
		
		//종합한 정보를 vo에 담아 db접근
		ScreenSessionVO scs = new ScreenSessionVO();
		scs.setMovie_num(movie_num);
		scs.setTheater_num(theater_num);
		scs.setSelect_date(selectedDay);
		List<ScreenSessionVO> final_list = ticketingService.finalListSelect(scs);
		
		//final_list값 수정,채워넣기
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		for(ScreenSessionVO dbscs : final_list) {
			//날짜 > 시간변환
			dbscs.setScs_start_time(sdf.format(dbscs.getScs_start_date()));
			dbscs.setScs_end_time(sdf.format(dbscs.getScs_end_date()));
			//영화이름 채워넣기
			dbscs.setMovie_name(selectedMovie);
			//관 이름 채워넣기
			dbscs.setTheater_name(selectedTheater);
			//seat_row,seat_col 값 곱해서 총좌석 계산
			// screenSeatRow를 정수로 변환
	        int numRows = Integer.parseInt(dbscs.getScreen_seat_row());
	        // screenSeatCol을 정수로 변환 (A=1, B=2, ..., H=8)
	        int numCols = dbscs.getScreen_seat_col().charAt(0) - 'A' + 1;
	        dbscs.setTotal_seat(numRows * numCols);
	        
		}
		System.out.println(final_list);
		
			
			
		return final_list;
	}
	@GetMapping("payment_reservation")
	public String paymentReserve() {
		return "payment/payment_reservation";
	}
}
		
		
		
		
		
		
		
	
	
	

	
	
		
		
