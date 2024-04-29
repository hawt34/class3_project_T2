package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	// admin 메인 연결
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main/admin_main";
	}
	// 관리자 고객센터
	@GetMapping("admin_FAQ")
	public String adminFAQ() {
		return "admin/admin_csc/admin_FAQ";
	}
	@GetMapping("admin_FAQ_form")
	public String adminFAQform() {
		return "admin/admin_csc/admin_FAQ_form";
	}
	@GetMapping("admin_FAQ_modify_form")
	public String adminFAQmodifyForm() {
		return "admin/admin_csc/admin_FAQ_modify_form";
	}
	@GetMapping("admin_notice")
	public String adminNotice() {
		return "admin/admin_csc/admin_notice";
	}
	@GetMapping("admin_notice_form")
	public String adminNoticeForm() {
		return "admin/admin_csc/admin_notice_form";
	}
	@GetMapping("admin_notice_detail")
	public String adminNoticeDetail() {
		return "admin/admin_csc/admin_notice_detail";
	}
	@GetMapping("admin_oneOneone")
	public String adminOneOne() {
		return "admin/admin_csc/admin_oneOneone";
	}
	@GetMapping("admin_oneOneone_detail")
	public String adminOneOneDetail() {
		return "admin/admin_csc/admin_oneOneone_detail";
	}
	
	
	
	// 관리자 회원 페이지
	@GetMapping("admin_reserve")
	public String adminReserve() {
		return "admin/admin_member/admin_reserve";
	}
	@GetMapping("admin_review")
	public String adminReview() {
		return "admin/admin_member/admin_review";
	}
	@GetMapping("admin_member")
	public String adminMember() {
		return "admin/admin_member/admin_member";
	}
	
	// 관리자 영화 페이지
	@GetMapping("admin_moviePlan")
	public String adminMoviePlan() {
		return "admin/admin_movie/admin_moviePlan";
	}
	@GetMapping("admin_movie")
	public String adminMovie() {
		return "admin/admin_movie/admin_movie";
	}
	@GetMapping("admin_movie_form")
	public String adminMovieForm() {
		return "admin/admin_movie/admin_movie_form";
	}
	
	// 관리자 이벤트 
	@GetMapping("admin_event")
	public String adminEvent() {
		return "admin/admin_event/admin_event";
	}
	@GetMapping("admin_event_form")
	public String adminEventForm() {
		return "admin/admin_event/admin_event_form";
	}
	@GetMapping("admin_event_detail")
	public String adminEventDetail() {
		return "admin/admin_event/admin_event_detail";
	}
	
}
