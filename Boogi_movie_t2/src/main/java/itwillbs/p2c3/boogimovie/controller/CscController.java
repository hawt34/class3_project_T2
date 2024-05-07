package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;

@Controller
public class CscController {
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private OtoService otoService;
	
	// csc 연결
		@GetMapping("csc_main")
		public String cscMain() {
			return "csc/csc_main";
		}
		@GetMapping("csc_faq")
		public String cscFAQ() {
			
			
			return "csc/csc_faq";
		}
		@GetMapping("csc_notice")
		public String cscNotice(Model model, @RequestParam(defaultValue = "1")int pageNum) {
			//----------------------------------------------------
			int listLimit = 10; // 페이지당 보여줄 게시물 갯수
			
			int startRow = (pageNum - 1) * listLimit; // 게시물의 시작점
			
			List<NoticeVO> noticeList = service.getNoticeList(listLimit, startRow);
			
			
			
			
			
			model.addAttribute("noticeList", noticeList);
			return "csc/csc_notice";
		}
		
		@GetMapping("csc_notice_detail")
		public String cscNoiceDetail(int notice_num) {
			
			
			return "csc/csc_notice_detail";
		}
		
		@GetMapping("csc_oto")
		public String cscOto() {
			return "csc/csc_oto";
		}
		
		@PostMapping("csc_oto")
		public String cscOtoPro(OTOVO oto, String theater_name, String member_id, Model model) {
			System.out.println(oto);
			System.out.println(theater_name);
			System.out.println(member_id);
			
			if(member_id == null) {
				model.addAttribute("msg", "로그인 후 이용");
				model.addAttribute("targetURL", "./");
			}
			
			int insertCount = otoService.insertOto(oto, theater_name, member_id);
			
			if(insertCount == 0) {
				model.addAttribute("msg", "1대1 문의 실패");
				return "error/fail";
			}
			
			return "redirect:/myp_oto_breakdown";
		}
	
	
}
