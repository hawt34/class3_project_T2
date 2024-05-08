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
import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.PageInfo;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	OtoService otoService;
	
	@Autowired
	TheaterService theaterService;
	
	
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
	//-------------------------------------
	//공지사항 관리 controller
	//listLimit으로 목록 10개 가져오기
	@GetMapping("admin_notice")
	public String adminNotice(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		
		int NoticeCount = service.getNoticeListCount(); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = NoticeCount / listLimit + (NoticeCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		PageInfo pageList = new PageInfo(NoticeCount, pageListLimit, maxPage, startPage, endPage);
		
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageList", pageList);
		
		return "admin/admin_csc/admin_notice";
	}
	@GetMapping("admin_noticeForm")
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
	
	@GetMapping("admin_notice_delete")
	public String adminNoticeDelete(int notice_num, Model model) {
		int deleteCount = service.deleteNotice(notice_num);
		if(deleteCount == 0) {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "error/fail";
		}
		return "redirect:/admin_notice";
	}
	
	//---------------------------
	//일대일 문의 controller
	@GetMapping("admin_oto")
	public String adminOto(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		int listLimit = 10;
		int startRow = (pageNum  - 1) * listLimit;
		
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit);
		
		
		
		model.addAttribute("otoList", otoList);
		return "admin/admin_csc/admin_oto";
	}
	@GetMapping("admin_oto_detail")
	public String adminOtoDetail(Model model, int oto_num) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String otoTheater = otoService.getTheaterName(oto.getTheater_num());
		
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("otoTheater", otoTheater);
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
	
	//-----------------------------------------------
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
	public String adminMember(Model model) {
		List<Map<String, String>> memberList = service.getmemberList();
		model.addAttribute("memberList", memberList);
		
		return "admin/admin_member/admin_member";
	}
	
	@GetMapping("admin_member_editForm")
	public String adminMemberEditForm(MemberVO member , Model model) {
		System.out.println(member.getMember_id());
		member = service.SelectMember(member.getMember_id());
		model.addAttribute("member", member);
		
		return "admin/admin_member/admin_member_editForm";
	}
	
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
	public String adminMovie(Model model) {
		List<Map<String, String>> movieList = service.getmovieList();
		model.addAttribute("movieList", movieList);
		
		return "admin/admin_movie/admin_movie";
	}
	
	@GetMapping("admin_movie_delete")
	public String adminMovieDelete() {
		System.out.println("moviedelete");
		return "redirect:/admin_movie";
	}
	@GetMapping("admin_movie_reg_form")
	public String adminMovieRegForm(MovieVO movie, Model model) {
		model.addAttribute("movie", movie);
		return "admin/admin_movie/admin_movie_reg_form";
	}
	
	@GetMapping("admin_movie_edit_form")
	public String adminMovieEditForm(MovieVO movie, Model model) {
		System.out.println("movie_num: " + movie.getMovie_num());
		movie = service.SelectMovie(movie.getMovie_num());
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie/admin_movie_edit_form";
	}
	
	@PostMapping("admin_movie_edit_pro")
	public String adminMovieEditPro(@ModelAttribute MovieVO movie) {
//		System.out.println(movie);
		service.UpdateMovie(movie);
		
		return "redirect:admin_movie";
	}
	
	@PostMapping("admin_movie_reg_pro")
	public String adminMovieGetPro(@ModelAttribute MovieVO movie) {
//		System.out.println(movie);
		service.InsertMovie(movie);
		
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
