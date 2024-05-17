package itwillbs.p2c3.boogimovie.controller;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.EventService;
import itwillbs.p2c3.boogimovie.service.FaqService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.ScreenService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.service.TicketingService;
import itwillbs.p2c3.boogimovie.vo.EventVO;
import itwillbs.p2c3.boogimovie.vo.FAQVO;
import itwillbs.p2c3.boogimovie.vo.ItemInfoVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.PageInfo;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;
import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;
import retrofit2.http.GET;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	private OtoService otoService;
	
	@Autowired
	TheaterService theaterService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	TicketingService ticService;
	
	@Autowired
	ScreenService screenService;
	
	@Autowired
	private FaqService faqService;
	
	// admin 메인 연결
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main/admin_main";
	}
	
	//--------------------------------------------------------------------
	// 관리자 고객센터
	// faq List view에 포워딩
	@GetMapping("admin_faq")
	public String adminFAQ(@RequestParam(defaultValue = "1")int pageNum, Model model, @RequestParam(required = false)String faqCategory) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		
		int listCount = faqService.getFaqListCount(faqCategory); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		System.out.println("maxPage: " + maxPage);
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<FAQVO> faqList = faqService.getFaqList(listLimit, startRow, faqCategory);
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("faqList", faqList);
		return "admin/admin_csc/admin_faq";
	}
	
	//faq 삭제
	@GetMapping("admin_faq_delete")
	public String adminFAQdelete(FAQVO faq, Model model) {
		int deleteCount = faqService.deleteFaq(faq);
		
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "error/fail";
		}
		return "redirect:/admin_faq";
	}
	
	//faq form 이동
	@GetMapping("admin_faq_form")
	public String adminFAQform() {
		return "admin/admin_csc/admin_faq_form";
	}
	
	//faq 등록(pro) 
	@PostMapping("admin_faq_pro")
	public String adminFAQpro(FAQVO faq, Model model) {
		if(faq.getFaq_category().equals("")) {
			model.addAttribute("msg", "유형을 선택해 주세요");
			return "error/fail";
		}
		
		int insertCount = faqService.insertFaq(faq);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "faq 등록 실패");
			return "error/fail";
		}
		
		return "redirect:/admin_faq";
	}
	
	//faq modify form 이동
	@GetMapping("admin_faq_modify")
	public String adminFAQModify(FAQVO faq, Model model) {
		faq = faqService.getFaq(faq);
		
		model.addAttribute("faq", faq);
		return "admin/admin_csc/admin_faq_modify";
	}
	
	//faq update
	@PostMapping("admin_faq_modify")
	public String adminFAQModifyPro(FAQVO faq, Model model) {
		int updateCount = faqService.updateFaq(faq);
		
		if(updateCount == 0) {
			model.addAttribute("msg", "수정을 실패하였습니다");
		}
		return "redirect:/admin_faq";
	}
	
	//-------------------------------------
	//공지사항 관리 controller
	//listLimit으로 목록 10개 가져오기
	@GetMapping("admin_notice")
	public String adminNotice(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		
		int listCount = service.getNoticeListCount(); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		System.out.println("maxPage: " + maxPage);
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit);
		
		//LocalDateTIme format
		for(NoticeVO notice : noticeList) {
			notice.setNotice_fdt(notice.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		}
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageList", pageList);
		
		return "admin/admin_csc/admin_notice";
	}
	@GetMapping("admin_notice_form")
	public String adminNoticeForm() {
		
		return "admin/admin_csc/admin_notice_form";
	}
	
	@PostMapping("admin_notice_pro")
	public String adminNoticePro(NoticeVO notice, Model model, String theater_name) {
		int theater_num = theaterService.getTheaterName(theater_name);
		
		
		int noticeCount = service.InsertNotice(notice,theater_num);
		if(noticeCount == 0) {
			model.addAttribute("msg", "입력 실패!");
		
			return "error/fail";
		}
		
		return "redirect:admin_notice";
	}
	
	//notice_modify 연결
	@GetMapping("admin_notice_modify")
	public String adminNoticeModify(NoticeVO notice, Model model) {
		notice = service.getNotice(notice);
		System.out.println(notice);
		
		model.addAttribute("notice", notice);
		return "admin/admin_csc/admin_notice_modify";
	}
	
	@GetMapping("admin_notice_delete")
	public String adminNoticeDelete(int notice_num, Model model) {
		int deleteCount = service.deleteNotice(notice_num);
		if(deleteCount == 0) {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "error/fail";
		}
		return "redirect:/admin_notice";
	}
	
	@GetMapping("admin_notice_detail")
	public String adminNoticeDetail(NoticeVO notice, Model model) {
		notice = service.getNotice(notice);
		notice.setNotice_fdt(notice.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))); 
		int maxNotice = service.getMaxNotice(notice);
		int minNotice = service.getMinNotice(notice);
		
		model.addAttribute("minNotice", minNotice);
		model.addAttribute("maxNotice", maxNotice);
		model.addAttribute("notice", notice);
		return "admin/admin_csc/admin_notice_detail";
	}
	
	//----------------------------------------------------------
	//일대일 문의 controller
	@GetMapping("admin_oto")
	public String adminOto(@RequestParam(defaultValue = "1")int pageNum,
						   Model model,
						   String faqCategory,
						   String theaterName) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		System.out.println("$$@#@#" + theaterName);
		System.out.println("$$@#@#" + faqCategory);
		
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit, faqCategory, theaterName);
		
<<<<<<< HEAD
//		int listCount = otoService.getOtoListCount(faqCategory, theaterName); //총 공지사항 갯수
//		int pageListLimit = 5; //뷰에 표시할 페이지갯수
//		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
//		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
//		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
//		
//		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
//			endPage = maxPage;
//		}
=======
		model.addAttribute("faqCategory", faqCategory);
		if(faqCategory != null && !faqCategory.equals("")) {model.addAttribute("faqCategory", faqCategory);} 
		if(theaterName != null && !theaterName.equals("")) {model.addAttribute("theaterName", theaterName);} 
			
		
		
//		int listCount = otoService.getOtoListCount(faqCategory, theaterName); //총 공지사항 갯수
//		int pageListLimit = 5; //뷰에 표시할 페이지갯수
//		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
//		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
//		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
//		
//		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
//			endPage = maxPage;
//		}
//		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		PageInfo pageList = pageInfoCategory(pageNum, listLimit, startRow, faqCategory, theaterName); //faq 페이지네이션
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("otoList", otoList);
		return "admin/admin_csc/admin_oto";
	}
	// 페이징
	public PageInfo pageInfoCategory(int pageNum, int listLimit, int startRow,  String faqCategory, String theaterName) {
		
		int listCount = otoService.getOtoListCount(faqCategory, theaterName); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
//		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
<<<<<<< HEAD
		PageInfo pageList = pageInfoCategory(pageNum, listLimit, startRow, faqCategory, theaterName); //faq 페이지네이션
=======
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
		
<<<<<<< HEAD
		model.addAttribute("pageList", pageList);
		model.addAttribute("otoList", otoList);
		return "admin/admin_csc/admin_oto";
	}
	// 페이징
	public PageInfo pageInfoCategory(int pageNum, int listLimit, int startRow,  String faqCategory, String theaterName) {
		
		int listCount = otoService.getOtoListCount(faqCategory, theaterName); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
	}
=======
		return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
	}
	
	
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
	
	//1대1 문의 답변하기
	@GetMapping("admin_oto_detail")
	public String adminOtoDetail(Model model, int oto_num) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "admin/admin_csc/admin_oto_detail";
	}
	@PostMapping("admin_oto_detail")
	public String adminOtoDetailPro(OTOReplyVO reply, Model model) {
		System.out.println(reply);
		int insertCount = service.replyRegist(reply, reply.getOto_num());
		if(insertCount == 0) {
			model.addAttribute("msg", "일대일문의 답변 실패");
			return "error/fail";
		}
		int updateCount = otoService.updateOtoResponse(reply.getOto_num());
		if(updateCount == 0) {
			model.addAttribute("msg", "답변 변경 실패");
		}
		
		return "redirect:/admin_oto";
	}
	//관리자 고객센터 controller 끝 =========================================================

	// 관리자 회원 페이지

	// 2) 리뷰 페이지
	@GetMapping("admin_review")
	public String adminReview(Model model) {
		List<ReviewVO> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
		return "admin/admin_member/admin_review";
	}
	
	// 리뷰 삭제
	@GetMapping("admin_review_delete")
	public String adminReviewDelete(String review_num, Model model) {
		int deleteCount = service.deleteReview(review_num);
		if(deleteCount > 0) {
			return "redirect:/admin_review";
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다");
			return "error/fail";
		}
	}
	
	// 3) 회원페이지
	@GetMapping("admin_member")
	public String adminMember(Model model) {
		List<Map<String, String>> memberList = service.getmemberList();
		model.addAttribute("memberList", memberList);
		
		return "admin/admin_member/admin_member";
	}
	
	// 회원정보 상세
	@GetMapping("admin_member_editForm")
	public String adminMemberEditForm(MemberVO member , Model model) {
		System.out.println(member.getMember_id());
		member = service.SelectMember(member.getMember_id());
		model.addAttribute("member", member);
		
		return "admin/admin_member/admin_member_editForm";
	}
	
	// 회원 삭제
	@GetMapping("admin_member_withdraw")
	public String adminMemberWithdraw(MemberVO member, Model model) {
		int updateCount = service.deleteMember(member.getMember_id());
		
		if(updateCount > 0) {
			return "redirect:/admin_member";
		} else {
			model.addAttribute("msg", "회원삭제에 실패하였습니다");
			return "error/fail";
		}
	}
	
	//--------------------------------------------------------------------
	// 관리자 상영관리 페이지
	@GetMapping("admin_moviePlan")
	public String adminMoviePlan(Model model) {
		List<Map<String, String>> movieList = service.getmovieList();
		List<Map<String, String>> theaterNameList = service.getTheaterList();
		List<Map<String, String>> moviePlanList = service.selectMoviePlanList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("moviePlanList", moviePlanList);
		model.addAttribute("theaterNameList", theaterNameList);
		
		return "admin/admin_movie/admin_moviePlan";
	}
	
	@PostMapping("admin_moviePlan_reg")
	public String adminMoviePlanReg(ScreenSessionVO screenSession, Model model) {
//		System.out.println(screenSession);
		
		int insertCount = service.insertMoviePlan(screenSession);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "상영일정이 등록되었습니다");
			model.addAttribute("targetURL", "admin_moviePlan");
			return "error/fail";
		} else {
			model.addAttribute("msg", "일정등록에 실패하였습니다");
			return "error/fail";
		}
		
	}
	
	@GetMapping("admin_moviePlan_delete")
	public String adminMoviePlanDelete(ScreenSessionVO screenSession, Model model) {
		int deleteCount = service.deleteMoviePlan(screenSession.getScs_num());
		if(deleteCount > 0) {
			return "redirect:/admin_moviePlan";
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다");
			return "error/fail";
		}
	}
	
	@GetMapping("admin_moviePlan_form")
	public String adminMoviePlanForm() {
		return "admin/admin_movie/admin_moviePlan_form";
	}
	
	@PostMapping("admin_moviePlan_pro")
	public String adminMoviePlanPro() {
		return "redirect:/admin_moviePlan";
	}
	
	// 상영관리 AJAX
	
	@GetMapping("getScreens")
	@ResponseBody
	public List<ScreenInfoVO> getScreens(@RequestParam("theater_num") String theater_num) {
		List<ScreenInfoVO> screen_info = service.getScreensByTheater(theater_num);
		System.out.println(screen_info);
		return screen_info;
	}
	
	@GetMapping("movieEndTime")
	@ResponseBody
	public ResponseEntity<String> movieEndTime(@RequestParam String hourSelect, @RequestParam String movieSelect) {
		MovieVO movie = service.SelectMovie(Integer.parseInt(movieSelect));
		String runtime = movie.getMovie_runtime();
		
     	String[] parts = hourSelect.split(":"); // 시간을 시와 분으로 분할
	    int hours = Integer.parseInt(parts[0], 10); // 시간 부분을 정수로 변환
	    int mins = Integer.parseInt(parts[1], 10); // 분 부분을 정수로 변환

	    mins += Integer.parseInt(runtime); // 분에 분을 더함
	    hours += Math.floor(mins / 60); // 60분을 초과한 부분을 시간에 추가
	    mins = mins % 60; // 분을 60으로 나눈 나머지를 계산하여 분에 할당

	    // 24시간 형식으로 시간 조정
	    hours = (hours + 24) % 24;

	    // 시간과 분을 2자리로 포맷팅
	    var hoursFormatted = String.format("%02d", hours);
	    var minsFormatted = String.format("%02d", mins);

	    String endTime = "";
	    endTime = hoursFormatted + ':' + minsFormatted;
	    System.out.println(endTime);
		
		return ResponseEntity.ok().body(endTime);
	}
	
	@GetMapping("moviePlan_time")
	@ResponseBody
	public List<Map<String, String>> moviePlanTime(@RequestParam int theaterSelect, @RequestParam int screenSelect, @RequestParam Date scs_date) {
		List<Map<String, String>> movieTimeList = service.getMovieTimeList(theaterSelect, screenSelect, scs_date);
		System.out.println("movieTimeList: " + movieTimeList);
		for(Map<String, String> movieTime: movieTimeList) {
			System.out.println(movieTime);
		}
		return movieTimeList;
	}
	
	//--------------------------------------------------------------------
	// 영화 리스트 조회 
	@GetMapping("admin_movie")
	public String adminMovie(Model model) {
		List<Map<String, String>> movieList = service.getmovieList();
		model.addAttribute("movieList", movieList);
		
		return "admin/admin_movie/admin_movie";
	}
	
	// 영화 삭제
	@GetMapping("admin_movie_delete")
	public String adminMovieDelete(@RequestParam String movie_num, Model model) {
		System.out.println("moviedelete");
		int deleteCount = service.deleteMovie(movie_num);
		
		if(deleteCount > 0) {
			return "redirect:admin_movie";
		} else {
			model.addAttribute("msg", "영화삭제 실패");
			return "redirect:/error/fail";
		}
	}
	
	// 영화 등록 폼
	@GetMapping("admin_movie_reg_form")
	public String adminMovieRegForm() {
		return "admin/admin_movie/admin_movie_reg_form";
	}
	
	// 영화 등록 프로
	@PostMapping("admin_movie_reg_pro")
	public String adminMovieGetPro(@ModelAttribute MovieVO movie, Model model) {
		// db에 영화가 있는지 판별
		MovieVO dbMovie = service.getMovie(movie.getMovie_name()); 
		if(dbMovie != null) {
			model.addAttribute("msg", "이미 등록된 영화입니다!");
			return "error/fail";
		}
		// db에 영화 삽입		
		int insertCount = service.InsertMovie(movie);
		if(insertCount > 0) {
			return "redirect:admin_movie";
		} else {
			model.addAttribute("msg", "영화등록 실패");
			return "error/fail";
		}
		
	}
	
	// 영화 수정 폼
	@GetMapping("admin_movie_edit_form")
	public String adminMovieEditForm(MovieVO movie, Model model) {
//		System.out.println("movie_num: " + movie.getMovie_num());
		movie = service.SelectMovie(movie.getMovie_num());
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie/admin_movie_edit_form";
	}
	
	// 영화 수정 프로
	@PostMapping("admin_movie_edit_pro")
	public String adminMovieEditPro(@ModelAttribute MovieVO movie, Model model) {
		int updateCount = service.UpdateMovie(movie);
		System.out.println(movie);
		
		if(updateCount > 0) {
			return "redirect:admin_movie";			
		} else {
			model.addAttribute("msg", "영화수정 실패");
			return "error/fail";
		}
	}
	
	
	//--------------------------------------------------------------------
	// 날짜 변환기
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
	
	
	// 관리자 이벤트 
	@GetMapping("admin_event")
	public String adminEvent(Model model) {
		List<EventVO> eventList = eventService.getEventList();
		model.addAttribute("eventList",eventList);
		return "admin/admin_event/admin_event";
	}
	// 이벤트 등록 폼
	@GetMapping("admin_event_form")
	public String adminEventForm() {
		return "admin/admin_event/admin_event_form";
	}
	
	// 이벤트 등록 프로
	@PostMapping("admin_event_pro")
	public String adminEventPro(EventVO event, Model model) {
		int insertCount = service.InsertEvent(event);
		
		if(insertCount > 0) {
			return "redirect:/admin_event";
		} else {
			return "error/fail";
		}
	}
	// 이벤트 등록 수정 폼
	@GetMapping("admin_event_modify")
	public String adminEventModify(EventVO event, Model model) {
		event = eventService.getEvent(event.getEvent_num());
		
		if(event == null) {
			model.addAttribute("msg", "이벤트를 불러오는데 실패하였습니다");
			return "error/fail";
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			event.setEvent_start(dateFormat.format(event.getEvent_start_date()));
			event.setEvent_end(dateFormat.format(event.getEvent_end_date()));
			model.addAttribute("event", event);
			return "admin/admin_event/admin_event_modify";
		}
	}
	// 이벤트 등록 수정 프로
	@PostMapping("admin_event_modify_pro")
	public String adminEventModifyPro(EventVO event, Model model) {
		int updateCount = service.updateEvent(event);
		if(updateCount > 0) {
			return "redirect:/admin_event";
		} else {
			model.addAttribute("msg", "이벤트 수정에 실패하였습니다");
			return "error/fail";
		}
	}
	// 이벤트 삭제
	@GetMapping("admin_event_delete")
	public String adminEventDelete(EventVO event, Model model) {
		System.out.println(event);
		int deleteCount = service.deleteEvent(event);
		if(deleteCount > 0) {
			return "redirect:/admin_event";
		} else {
			model.addAttribute("msg", "이벤트 수정에 실패했습니다");
			return "error/fail";
		}
	}

	//--------------------------------------------------------------------
	// 관리자 결제 페이지
	@GetMapping("admin_pay")
	public String adminPay() {
		return "admin/admin_pay/admin_pay";
	}
	@GetMapping("admin_pay_cancel")
	public String adminPayCancel() {
		return "redirect:/admin_pay";
	}
	
	//	예매관리 페이지
	@GetMapping("admin_reserve")
	public String adminReserve(Model model) {
		List<Map<String, String>> reserveList = service.getReserveList();
		System.out.println(reserveList);
		model.addAttribute("reserveList", reserveList);
		return "admin/admin_member/admin_reserve";
	}
	
	// 예매 상세 페이지
	@GetMapping("admin_reserve_detail")
	public String adminReserveDetail(@RequestParam int reservation_num, Model model) {
		Map<String, String> reserveDetail = service.selectReserveDetail(reservation_num);
		model.addAttribute("reserveDetail", reserveDetail);
		return "admin/admin_member/admin_reserve_detail";
	}
	
	//--------------------------------------------------------------------
	// 관리자 스토어 페이지
	@GetMapping("admin_store")
	public String adminStore(Model model) {

		//전체리스트를 담는 걸 하나 만듬.
		
		List<ItemInfoVO> itemFull = service.getItmeListFull();
		model.addAttribute("itemFull", itemFull);
		//전체리스트 담는 거 확인완료
		return "admin/admin_store/admin_store";
	}
	// 아이템 수정폼으로 일단 와서
	@GetMapping("admin_store_modify")
	public String adminStoreModify(@RequestParam String item_info_name, ItemInfoVO item, Model model) {
		//System.out.println("여기는 스토어 아이템수정 " + item_info_name);
		item = service.getItem(item_info_name);
		//System.out.println("여기는 스토어 아이템수정 "+ item);
		model.addAttribute("updateItem", item);
		
		return "admin/admin_store/admin_store_modify";
	}
	// 여기서 아이템 업데이트 폼을 다시 리다이렉트
	
	@PostMapping("admin_store_modifyPro")
	public String adminStoreForm(ItemInfoVO updateItem, Model model) {
		//System.out.println("진짜 스낵수정폼 수정" + updateItem); 데이터 확인완료 주석처리
		int updateCount = service.updateItem(updateItem);
		if(updateCount > 0) {
			return "redirect:/admin_store";
		} else {
			model.addAttribute("msg", "스토어 아이템 수정에 실패하였습니다");
			return "error/fail";
		}
	}
	@GetMapping("admin_store_form")
	public String adminStoreInsert() {
		
		return "admin/admin_store/admin_store_form";
	}
	
	
	
	@PostMapping("admin_store_pro")
	public String adminStorePro(ItemInfoVO insertItem,Model model) {
		//System.out.println("여기는 스토어프로 인설트 아이템 확인" + insertItem); 데이터 확인완료
		ItemInfoVO dbItem =  service.getItem(insertItem.getItem_info_name());
		
		if(dbItem != null) {
			model.addAttribute("msg", "이미 등록된 스토어 아이템입니다!");
			return "error/fail";
		}
		
		int insertCount = service.insertItem(insertItem);
		if(insertCount > 0) {
			return "redirect:/admin_store";
		} else {
			model.addAttribute("msg", "스토어아이템 등록 실패");
			return "error/fail";
		}
		
	}
	
	
	@GetMapping("admin_store_delete")
	public String adminStoreDelete(@RequestParam String item_info_name, Model model) {
		System.out.println("storedelete");
		
		
		int deleteCount = service.deleteItem(item_info_name);
		if(deleteCount > 0) {
			return "redirect:/admin_store";
		} else {
			model.addAttribute("msg", "스토어 아이템 삭제에 실패했습니다");
			return "error/fail";
		}
		
			
	}
	
	//--------------------------------------------------------------------
	// 관리자 극장 페이지 메인
	@GetMapping("admin_theater")
	public String adminTheater(TheaterVO theater, Model model, ScreenInfoVO screen_info) {
		
		// 극장 리스트 조회
		List<TheaterVO> theaterList = theaterService.getTheater();
		
		model.addAttribute("theaterList", theaterList);
		
		return "admin/admin_theater/admin_theater";
	}
	
	// 극장 관리 > 극장 수정 폼으로
	@GetMapping("admin_theater_modify")
	public String adminTheaterModifyForm(TheaterVO theater, Model model) {
		// 수정할 극장 조회
		theater = theaterService.getTheater(theater);
		
		model.addAttribute("theater", theater);
		
		return "admin/admin_theater/admin_theater_modify_form";
	}
	
	// 극장 관리 > 극장 수정 등록 비즈니스
	@PostMapping("admin_theater_modify")
	public String adminTheaterModifyPro(TheaterVO theater, Model model) {
		
		int updateCount = theaterService.modifyTheater(theater);
		
		
		if(updateCount < 1) {
			model.addAttribute("msg", "극장 정보 수정 실패!");
			return "error/fail";
		} 
		return "redirect:/admin_theater";
	}
	
	// 극장 관리 > 새 극장 등록 폼
	@GetMapping("admin_theater_form")
	public String adminTheaterForm() {
		return "admin/admin_theater/admin_theater_form";
	}
	
	// 극장 관리 > 새 극장 등록 비즈니스
	@PostMapping("admin_theater_pro")
	public String adminTheaterPro(TheaterVO theater, Model model) {
		
		int insertCount = theaterService.registTheater(theater);
		
		if(insertCount < 1) {
			model.addAttribute("msg", "극장 정보 등록 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_theater";
	}
	
	// 극장 관리 > 극장 삭제
	@GetMapping("admin_theater_delete")
	public String adminTheaterDelete(TheaterVO theater, Model model) {
		
		int deleteCount = theaterService.deleteTheater(theater);
		
		if(deleteCount < 1) {
			model.addAttribute("msg", "극장 삭제 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_theater";
	}
	
	// 상영관 관리 > 상영관 리스트
	@GetMapping("admin_booth")
	public String adminBooth(TheaterVO theater, Model model, ScreenInfoVO screenInfo) {
		
		// 극장 리스트 조회
		List<TheaterVO> theaterList = theaterService.getTheater();
		
		// 상영관 리스트 조회
		List<ScreenInfoVO> screenInfoList = screenService.getScreenInfo();
		
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("screenInfoList", screenInfoList);
		
		
		return "admin/admin_theater/admin_booth";
	}
	
	// 상영관 관리 > 상영관 수정 폼으로
	@GetMapping("admin_booth_modify")
	public String adminBoothModifyForm(TheaterVO theater, ScreenInfoVO screenInfo, Model model) {
		// 극장 리스트 조회
		List<TheaterVO> theaterList = theaterService.getTheater();
		
		// 수정할 상영관 조회
		screenInfo = screenService.getScreenInfo(screenInfo);
		
		model.addAttribute("screenInfo", screenInfo);
		model.addAttribute("theaterList", theaterList);
		
		return "admin/admin_theater/admin_booth_modify_form";
	}
	
	// 상영관 관리 > 상영관 수정 비즈니스 
	@PostMapping("admin_booth_modify")
	public String adminBoothModifyPro(ScreenInfoVO screenInfo, Model model) {
		
		String theater_name = screenInfo.getTheater_name();
		screenInfo.setTheater_num(theaterService.getTheaterName(theater_name));
		
		int updateCount = screenService.modifyScreenInfo(screenInfo);
		
		if(updateCount < 1) {
			model.addAttribute("msg", "상영관 정보 수정 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_booth";
	}
	
	
	// 상영관 관리 > 새 상영관 등록 폼으로
	@GetMapping("admin_booth_form")
	public String adminBoothForm(TheaterVO theater, Model model) {
		// 극장 리스트 조회
		List<TheaterVO> theaterList = theaterService.getTheater();
		model.addAttribute("theaterList", theaterList);
		
		return "admin/admin_theater/admin_booth_form";
	}
	
	// 상영관 관리 > 새 상영관 등록 비즈니스
	@PostMapping("admin_booth_pro")
	public String adminBoothPro(ScreenInfoVO screenInfo, Model model) {
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+screenInfo);
		String theater_name = screenInfo.getTheater_name();
		screenInfo.setTheater_num(theaterService.getTheaterName(theater_name));
		
		int insertCount = screenService.registTheater(screenInfo);
		
		if(insertCount < 1) {
			model.addAttribute("msg",  "상영관 정보 등록 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_booth";
	}
	
	// 상영관 관리 > 상영관 삭제
	@GetMapping("admin_booth_delete")
	public String adminBoothDelete(ScreenInfoVO screenInfo, Model model) {
		
		int deleteCount = screenService.deleteScreenInfo(screenInfo);
		
		if(deleteCount < 1) {
			model.addAttribute("msg", "상영관 삭제 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_booth";
	}
	
	
	
	
	
	
}
