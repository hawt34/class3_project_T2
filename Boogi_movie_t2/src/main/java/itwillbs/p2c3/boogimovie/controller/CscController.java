package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.FaqService;
import itwillbs.p2c3.boogimovie.service.NoticeService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.FAQVO;
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
	
	@Autowired
	private FaqService faqService;
	
	// csc 연결
	@GetMapping("csc_main")
	public String cscMain() {
		return "csc/csc_main";
	}
	//csc 페이지 faqList 가져오기
	@GetMapping("csc_faq")
	public String cscFAQ(@RequestParam(defaultValue = "1")int pageNum, FAQVO faq, Model model) {
		//ajax를 호출하지 않은 paging을 처리하기 위한 변수
		String noArgs = "defaultFaq";
		
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = faqService.getFaqListCount(); //총 공지사항 갯수
		int pageListLimit = 5; //뷰에 표시할 페이지갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		
		
		List<FAQVO> faqList = faqService.getFaqList(listLimit, startRow);
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("faqList", faqList);
		return "csc/csc_faq";
	}
	
	
	//=======================================
	//공지사항 List 게시판
	@GetMapping(value="csc_notice")
	public String cscNotice(Model model,
							@RequestParam(defaultValue = "1")int pageNum
							) {
		//----------------------------------------------------
		//ajax를 호출하지 않은 paging을 처리하기 위한 변수
		String noArgs = "defaultNotice";
		
		int listLimit = 10; // 페이지당 보여줄 게시물 갯수
		int startRow = (pageNum - 1) * listLimit; // 게시물의 시작점
		PageInfo pageInfo = pageInfo(pageNum, listLimit, startRow, noArgs);	
		List<NoticeVO> noticeList = noticeService.getNoticeList(listLimit, startRow);
		//LocalDateTIme format
		for(NoticeVO noticed : noticeList) {
			noticed.setNotice_fdt(noticed.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		}
		
		
		
		
		model.addAttribute("pageList", pageInfo);
		model.addAttribute("noticeList", noticeList);
		return "csc/csc_notice";
	}
	@ResponseBody
	@GetMapping(value="csc_notice.json")
	public List<NoticeVO> noticeCategory(Model model,
										 @RequestParam(defaultValue = "1")int pageNum,
										 @RequestParam(required = false)String theaterName) {
		//----------------------------------------------------
		int listLimit = 10; // 페이지당 보여줄 게시물 갯수
		int startRow = (pageNum - 1) * listLimit; // 게시물의 시작점
		List<NoticeVO> noticeList = null;
		if(theaterName.equals("전체")) {
			noticeList = noticeService.getNoticeList(listLimit, startRow);
		} else {
			noticeList = noticeService.getNoticeCagList(listLimit, startRow, theaterName);
			System.out.println("카테고리노티스:" + noticeList);
		}
		
		PageInfo pageInfo = pageInfo(pageNum, listLimit, startRow, theaterName);	
		//LocalDateTIme format
		for(NoticeVO noticed : noticeList) {
			noticed.setNotice_fdt(noticed.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		}
		model.addAttribute("pageList", pageInfo);
//		model.addAttribute("noticeList", noticeList);
		return noticeList;
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
		
		// 극장 번호 가져오기
		int theater_num = otoService.getTheaterNum(theater_name);
		
		
		if(id == null) {
			model.addAttribute("msg", "로그인 후 이용");
			model.addAttribute("targetURL", "./");
		}
		
		//1대1 문의 db 등록
		int insertCount = otoService.insertOto(oto, theater_num, id);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "1대1 문의 실패");
			return "error/fail";
		}
		
		return "redirect:/myp_oto_breakdown";
	}
	
	//paging 처리
	public PageInfo pageInfo(int listLimit, int startRow, int pageNum, String category) {
		//전체1 notice 게시판 번호
		int listCount = 0;
		int pageListLimit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if(category.equals("defaultNotice")) {
			listCount = adminService.getNoticeListCount(); //총 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		}
		if(category.equals("defaultFaq")) {
			listCount = faqService.getFaqListCount(); //총 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		}
		
		if(category.equals("전체1")) {
			listCount = adminService.getNoticeListCount(); //총 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		}
		if(category.equals("해운대점") || category.equals("센텀점")
		   || category.equals("서면점") || category.equals("남포점")
		   || category.equals("부산대점") || category.equals("사직점")
		   || category.equals("영도점") || category.equals("덕천점")
		   || category.equals("정관점") || category.equals("사상점")) {
			listCount = noticeService.getNoticeListCountCag(category); //극장명 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		}
		
		if(category.equals("전체2")) {
			listCount = noticeService.getNoticeListCountCag(category); //극장명 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		} 
		
		if(category.equals("예매/결제") || category.equals("영화관이용")
		   || category.equals("쿠폰") || category.equals("스토어")
		   || category.equals("홈페이지/모바일")) {
			listCount = noticeService.getNoticeListCountCag(category); //극장명 공지사항 갯수
			pageListLimit = 5; //뷰에 표시할 페이지갯수
			maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
			startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
			endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
			
			if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
				endPage = maxPage;
			}
			return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		}
		return null;
		
		
	}//pageInfo 끝
	
	
}
