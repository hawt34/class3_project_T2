package itwillbs.p2c3.boogimovie.controller;

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
import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	// admin 메인 연결
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main/admin_main";
	}
	
	//--------------------------------------------------------------------
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
	public String adminNoticePro(NoticeVO notice, Model model, String theater_name) {
		int noticeCount = service.InsertNotice(notice,theater_name);
		System.out.println(theater_name);
		if(noticeCount == 0) {
			model.addAttribute("msg", "입력 실패!");
		
		return "error/fail";
		}
		
		
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
	
	//--------------------------------------------------------------------
	// 관리자 회원 페이지

	// 2) 리뷰 페이지
	@GetMapping("admin_review")
	public String adminReview(Model model) {
		List<ReviewVO> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
//		System.out.println(reviewList);
		return "admin/admin_member/admin_review";
	}
	@GetMapping("admin_review_delete")
	public String adminReviewDelete(String review_id, Model model) {
		int deleteCount = service.deleteReview(review_id);
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
			model.addAttribute("msg", "영화등록 실패");
			return "redirect:/error/fail";
		}
		
	}
	
	// 영화 등록 폼
	@GetMapping("admin_movie_reg_form")
	public String adminMovieRegForm(MovieVO movie, Model model) {
		model.addAttribute("movie", movie);
		return "admin/admin_movie/admin_movie_reg_form";
	}
	
	// 영화 등록 프로
	@PostMapping("admin_movie_reg_pro")
	public String adminMovieGetPro(@ModelAttribute MovieVO movie, Model model) {
		int insertCount = service.InsertMovie(movie);
		
		if(insertCount > 0) {
			return "redirect:admin_movie";
		} else {
			model.addAttribute("msg", "영화등록 실패");
			return "redirect:/error/fail";
		}
		
	}
	
	// 영화 수정 폼
	@GetMapping("admin_movie_edit_form")
	public String adminMovieEditForm(MovieVO movie, Model model) {
		System.out.println("movie_num: " + movie.getMovie_num());
		movie = service.SelectMovie(movie.getMovie_num());
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie/admin_movie_edit_form";
	}
	
	// 영화 수정 프로
	@PostMapping("admin_movie_edit_pro")
	public String adminMovieEditPro(@ModelAttribute MovieVO movie, Model model) {
		int updateCount = service.UpdateMovie(movie);
		
		if(updateCount > 0) {
			return "redirect:admin_movie";			
		} else {
			model.addAttribute("msg", "영화수정 실패");
			return "redirect:/error/fail";
		}
		
		
	}
	
	
	//--------------------------------------------------------------------
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
