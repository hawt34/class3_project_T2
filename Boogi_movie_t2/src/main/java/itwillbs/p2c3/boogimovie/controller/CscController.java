package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.PageInfo;

@Controller
public class CscController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private OtoService otoService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private AdminService adminService;
	
	// csc 연결
		@GetMapping("csc_main")
		public String cscMain() {
			return "csc/csc_main";
		}
		@GetMapping("csc_faq")
		public String cscFAQ() {
			
			
			return "csc/csc_faq";
		}
		//공지사항 List 게시판
		@GetMapping("csc_notice")
		public String cscNotice(Model model, @RequestParam(defaultValue = "1")int pageNum) {
			//----------------------------------------------------
			int listLimit = 10; // 페이지당 보여줄 게시물 갯수
			
			int startRow = (pageNum - 1) * listLimit; // 게시물의 시작점
			int noticeCount = adminService.getNoticeListCount(); //총 공지사항 갯수
			int pageListLimit = 5; //뷰에 표시할 페이지갯수
			int maxPage = noticeCount / listLimit + (noticeCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			PageInfo pageList = new PageInfo(noticeCount, pageListLimit, maxPage, startPage, endPage);	
			
			List<NoticeVO> noticeList = noticeService.getNoticeList(listLimit, startRow);
			
			
			model.addAttribute("pageList", pageList);
			model.addAttribute("noticeList", noticeList);
			return "csc/csc_notice";
		}
		//공지사항 확인 - detail.jsp
		@GetMapping("csc_notice_detail")
		public String cscNoiceDetail(int notice_num, Model model) {
			NoticeVO notice = noticeService.getNotice(notice_num);
			
			model.addAttribute("notice", notice);
			
			return "csc/csc_notice_detail";
		}
		
		@GetMapping("csc_oto")
		public String cscOto(HttpSession session, Model model) {
			if(session.getAttribute("sId") == null) {
				model.addAttribute("msg", "로그인 후 이용바랍니다");
				return "error/fail";
			}
			return "csc/csc_oto";
		}
		
		//1대1 문의 작성 db저장
		@PostMapping("csc_oto")
		public String cscOtoPro(OTOVO oto, String theater_name, HttpSession session, Model model) {
			String id = (String)session.getAttribute("sId");
			System.out.println("아이디" + id);
			
			int theater_num = theaterService.getTheaterName(theater_name);
			System.out.println("극장번호: " + theater_num);
			
			
			if(id == null) {
				model.addAttribute("msg", "로그인 후 이용");
				model.addAttribute("targetURL", "./");
			}
			
			int insertCount = otoService.insertOto(oto, theater_num, id);
			
			if(insertCount == 0) {
				model.addAttribute("msg", "1대1 문의 실패");
				return "error/fail";
			}
			
			return "redirect:/myp_oto_breakdown";
		}
	
	
}
