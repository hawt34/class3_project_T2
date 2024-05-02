package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import itwillbs.p2c3.boogimovie.vo.NoticeVO;

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
	@GetMapping("admin_FAQ_delete")
	public String adminFAQdelete() {
		return "redirect:/admin_FAQ";
	}
	@GetMapping("admin_FAQ_form")
	public String adminFAQform() {
		return "admin/admin_csc/admin_FAQ_form";
	}
	@PostMapping("admin_FAQ_pro")
	public String adminFAQpro() {
		return "redirect:/admin_FAQ";
	}
	
	@GetMapping("admin_notice")
	public String adminNotice() {
		return "admin/admin_csc/admin_notice";
	}
	@GetMapping("admin_notice_form")
	public String adminNoticeForm() {
		return "admin/admin_csc/admin_notice_form";
	}
	@PostMapping("admin_notice_pro")
	public String adminNoticePro(NoticeVO notice) {
		 
		
		return "redirect:admin_notice";
	}
	@GetMapping("admin_notice_delete")
	public String adminNoticeDelete() {
		return "redirect:/admin_notice";
	}
	@GetMapping("admin_oneOnone")
	public String adminOnOne() {
		return "admin/admin_csc/admin_oneOnone";
	}
	@GetMapping("admin_oneOneone_detail")
	public String adminOneOneDetail() {
		return "admin/admin_csc/admin_oneOneone_detail";
	}
	@PostMapping("admin_oneOneone_detail_Pro")
	public String adminOneOneDetailPro() {
		return "redirect:/admin_oneOnone";
	}
	
	// 관리자 회원 페이지
	@GetMapping("admin_reserve")
	public String adminReserve() {
		return "admin/admin_member/admin_reserve";
	}
	@GetMapping("admin_reserve_detail")
	public String adminReserveDetail() {
		return "admin/admin_member/admin_reserve_detail";
	}
	@GetMapping("admin_review")
	public String adminReview() {
		return "admin/admin_member/admin_review";
	}
	@GetMapping("admin_review_delete")
	public String adminReviewDelete() {
		return "redirect:/admin_review";
	}
	@GetMapping("admin_member")
	public String adminMember() {
		return "admin/admin_member/admin_member";
	}
	@GetMapping("admin_member_editForm")
	public String adminMemberEditForm() {
		return "admin/admin_member/admin_member_editForm";
	}
	@PostMapping("admin_member_editPro")
	public String adminMemberEditPro() {
		return "redirect:/admin_member";
	}
	
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
	@GetMapping("admin_movie")
	public String adminMovie() {
		return "admin/admin_movie/admin_movie";
	}
	@GetMapping("admin_movie_delete")
	public String adminMovieDelete() {
		System.out.println("moviedelete");
		return "redirect:/admin_movie";
	}
	@GetMapping("admin_movie_form")
	public String adminMovieForm() {
		return "admin/admin_movie/admin_movie_form";
	}
	@PostMapping("admin_movie_pro")
	public String adminMoviePro() {
		return "redirect:admin_movie";
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
	@PostMapping("admin_event_pro")
	public String adminEventPro() {
		return "redirect:/admin_event";
	}
	@GetMapping("admin_event_delete")
	public String adminEventDelete() {
		return "redirect:/admin_event";
	}

	
	// 관리자 결제 페이지
	@GetMapping("admin_pay")
	public String adminPay() {
		return "admin/admin_pay/admin_pay";
	}
	@GetMapping("admin_pay_cancel")
	public String adminPayCancel() {
		return "redirect:/admin_pay";
	}
	
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
	
	// 관리자 극장 페이지
	@GetMapping("admin_theater")
	public String adminTheater() {
		return "admin/admin_theater/admin_theater";
	}
	@GetMapping("admin_theater_delete")
	public String adminTheaterDelete() {
		return "redirect:/admin_theater";
	}
	@GetMapping("admin_theater_form")
	public String adminTheaterForm() {
		return "admin/admin_theater/admin_theater_form";
	}
	@PostMapping("admin_theater_pro")
	public String adminTheaterPro() {
		return "redirect:/admin_theater";
	}
	@GetMapping("admin_booth_form")
	public String adminBoothForm() {
		return "admin/admin_theater/admin_booth_form";
	}
	@PostMapping("admin_booth_pro")
	public String adminBoothPro() {
		return "redirect:/admin_booth";
	}
	@GetMapping("admin_booth_delete")
	public String adminBoothDelete() {
		return "redirect:/admin_booth";
	}
	@GetMapping("admin_booth")
	public String adminBooth() {
		return "admin/admin_theater/admin_booth";
	}
	
	
	
	
}
