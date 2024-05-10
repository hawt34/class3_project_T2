package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.EventService;
import itwillbs.p2c3.boogimovie.service.FaqService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.ScreenService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.service.TicketingService;
import itwillbs.p2c3.boogimovie.vo.EventVO;
import itwillbs.p2c3.boogimovie.vo.FAQVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.PageInfo;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;
import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

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
	@GetMapping("admin_faq")
	public String adminFAQ() {
		return "admin/admin_csc/admin_faq";
	}
	@GetMapping("admin_faq_delete")
	public String adminFAQdelete() {
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
		int insertCount = faqService.insertFaq(faq);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "faq 등록 실패");
			return "error/fail";
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
		String noticeDate = notice.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		int maxNotice = service.getMaxNotice(notice);
		
		model.addAttribute("maxNotice", maxNotice);
		model.addAttribute("noticeDate", noticeDate);
		model.addAttribute("notice", notice);
		return "admin/admin_csc/admin_notice_detail";
	}
	
	//----------------------------------------------------------
	//일대일 문의 controller
	@GetMapping("admin_oto")
	public String adminOto(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit);
		
		int listCount = otoService.getOtoListCount(); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("otoList", otoList);
		return "admin/admin_csc/admin_oto";
	}
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
	
	// 관리자 회원 페이지

	// 2) 리뷰 페이지
	@GetMapping("admin_review")
	public String adminReview(Model model) {
		List<ReviewVO> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
		return "admin/admin_member/admin_review";
	}
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
	// 관리자 영화 페이지
	@GetMapping("admin_moviePlan")
	public String adminMoviePlan() {
		return "admin/admin_movie/admin_moviePlan";
	}
	@PostMapping("admin_moviePlan_reg")
	public String adminMoviePlanReg() {
		return "redirect:/admin_moviePlan";
	}
	@GetMapping("admin_moviePlan_delete")
	public String adminMoviePlanDelete() {
		return "redirect:/admin_moviePlan";
	}
	@GetMapping("admin_moviePlan_form")
	public String adminMoviePlanForm() {
		return "admin/admin_movie/admin_moviePlan_form";
	}
	@PostMapping("admin_moviePlan_pro")
	public String adminMoviePlanPro() {
		return "redirect:/admin_moviePlan";
	}
	
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
	// 관리자 이벤트 
	@GetMapping("admin_event")
	public String adminEvent(Model model) {
		List<EventVO> eventList = eventService.getEventList();
		model.addAttribute(eventList);
		return "admin/admin_event/admin_event";
	}
	@GetMapping("admin_event_form")
	public String adminEventForm() {
		
		return "admin/admin_event/admin_event_form";
	}
	@GetMapping("admin_event_modify")
	public String adminEventModify() {
		
		return "admin/admin_event/admin_event_modify";
	}
	@PostMapping("admin_event_pro")
	public String adminEventPro() {
		return "redirect:/admin_event";
	}
	@GetMapping("admin_event_delete")
	public String adminEventDelete() {
		return "redirect:/admin_event";
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
	public String adminStore() {
		return "admin/admin_store/admin_store";
	}
	@GetMapping("admin_store_form")
	public String adminStoreForm() {
		return "admin/admin_store/admin_store_form";
	}
	@PostMapping("admin_store_pro")
	public String adminStorePro() {
		return "redirect:/admin_store";
	}
	@GetMapping("admin_store_delete")
	public String adminStoreDelete() {
		System.out.println("storedelete");
		return "redirect:/admin_store";
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
	
	
	@GetMapping("admin_theater_delete")
	public String adminTheaterDelete(TheaterVO theater) {
		
//		int deleteCount 
		
		return "redirect:/admin_theater";
	}
	
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
	public String adminBoothForm(TheaterVO theater, ScreenInfoVO screenInfo, Model model) {
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
	public String adminBoothPro(ScreenInfoVO screenInfo, Model model) {
		
		String theater_name = screenInfo.getTheater_name();
		screenInfo.setTheater_num(theaterService.getTheaterName(theater_name));
		
		int updateCount = screenService.modifyScreenInfo(screenInfo);
		
		if(updateCount < 1) {
			model.addAttribute("msg", "상영관 정보 수정 실패!");
			return "error/fail";
		}
		
		return "redirect:/admin_booth";
	}
	
	
	@GetMapping("admin_booth_delete")
	public String adminBoothDelete() {
		return "redirect:/admin_booth";
	}
	
	
	
	
	
	
}
