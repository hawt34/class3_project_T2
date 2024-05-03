package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;

@Controller
public class CscController {
	
	@Autowired
	private NoticeService service;
	
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
		public String cscNotice(Model model) {
			List<NoticeVO> noticeList = service.getNoticeList();
			System.out.println(noticeList);
			
			model.addAttribute("noticeList", noticeList);
			return "csc/csc_notice";
		}
		@GetMapping("csc_oto")
		public String cscOto() {
			return "csc/csc_oto";
		}
	
	
	
}
