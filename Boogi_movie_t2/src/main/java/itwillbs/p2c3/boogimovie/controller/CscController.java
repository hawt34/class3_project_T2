package itwillbs.p2c3.boogimovie.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String cscFaq(@RequestParam(defaultValue = "1")int pageNum, FAQVO faq, @RequestParam(required = false)String faqCategory) {
//		//ajax를 호출하지 않은 paging을 처리하기 위한 변수
//		int listLimit = 7;
//		int startRow = (pageNum - 1) * listLimit;
////		int listCount = faqService.getFaqListCount(faqCategory); //총 공지사항 갯수
////		int pageListLimit = 5; //뷰에 표시할 페이지갯수
////		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
////		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
////		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
////		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
////			endPage = maxPage;
////		}
////		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		
//		List<FAQVO> faqList = faqService.getFaqList(listLimit, startRow, faqCategory);
//		model.addAttribute("pageList", pageList);
//		model.addAttribute("faqList", faqList);
		return "csc/csc_faq";
	}
	
	@ResponseBody
	@GetMapping("csc_faq.json")
	public List<FAQVO> cscFaqJson(@RequestParam String parsedPageNum,
								  @RequestParam String faqCategory,
								  FAQVO faq) {
		System.out.println("@KWKL@@@" + faqCategory);
		int pageNum = Integer.parseInt(parsedPageNum);
		System.out.println("PAGENUM!!" +  pageNum);
		int listLimit = 7;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = faqService.getFaqListCount(faqCategory); //총 공지사항 갯수
//		int pageListLimit = 5; //뷰에 표시할 페이지갯수
//		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
//		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
//		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
//		
//		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
//			endPage = maxPage;
//		}
//		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		
		
		List<FAQVO> faqList = faqService.getFaqList(listLimit, startRow, faqCategory);
		
		return faqList;
	}
	
	
	//=======================================
	//공지사항 servlet
	@GetMapping(value="csc_notice")
	public String cscNotice(@RequestParam(defaultValue = "1")int pageNum) {
		return "csc/csc_notice";
	}
	
	//공지사항 List 게시판 - ajax를 이용한 비동기 처리
	@ResponseBody
	@GetMapping(value="csc_notice.json")
	public Map<String, Object> noticeCategory(@RequestParam(defaultValue = "1")String pageNumArg,
											  @RequestParam String theaterName,
											  @RequestParam String pageName) {
		System.out.println("COLSLWKM" + pageNumArg);
		System.out.println("COLSLWKM" + theaterName);
		System.out.println("COLSLWKM" + pageName);
		//----------------------------------------------------
		
		int pageNum = Integer.parseInt(pageNumArg);
		
		int listLimit = 10; // 페이지당 보여줄 게시물 갯수
		int startRow = (pageNum - 1) * listLimit; // 게시물의 시작점
		List<NoticeVO> noticeList = noticeService.getNoticeList(listLimit, startRow, theaterName);
		//LocalDateTIme format
		for(NoticeVO noticed : noticeList) {
			noticed.setNotice_fdt(noticed.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		}
		
		PageInfo pageInfo = pageInfo(pageNum, listLimit, startRow, theaterName, pageName);	
		//두개의 객체전달을 위한 HashMap()
		Map<String, Object> noticeObj = new HashMap<String, Object>();
		noticeObj.put("noticeList", noticeList);
		noticeObj.put("pageList", pageInfo);
		noticeObj.put("pageNum", pageNum);
		return noticeObj;
	}
	//공지사항 확인 - detail.jsp
	@GetMapping("csc_notice_detail")
	public String cscNoiceDetail(int notice_num, Model model) {
		NoticeVO notice = noticeService.getNotice(notice_num);
		notice.setNotice_fdt(notice.getNotice_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		int maxNotice = adminService.getMaxNotice(notice);
		int minNotice = adminService.getMinNotice(notice);
		
		
		model.addAttribute("minNotice", minNotice);
		model.addAttribute("maxNotice", maxNotice);
		model.addAttribute("notice", notice);
		return "csc/csc_notice_detail";
	}
	
	//--------------------------------------------------------------------
	//1대1 문의 관련
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
	public String cscOtoPro(OTOVO oto, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		System.out.println(oto);
		// 극장 번호 가져오기
		int theater_num = otoService.getTheaterNum(oto.getTheater_name());
		
		//로그인 필요 확인
		if(id == null) {
			model.addAttribute("msg", "로그인 후 이용");
			model.addAttribute("targetURL", "./");
		}
		//파일저장 경로 생성
		String uploadDir = "resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("saveDir: " + saveDir);
		String subDir = "";
		
		//경로상에 날짜별로 디렉토리 생성
		LocalDate today = LocalDate.now();
		String datePattern = "yyyy" + "/" + "MM" + "/" + "dd";
		//날짜 포멧 yyyy\MM\dd
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
		subDir = today.format(dtf);
		saveDir += "/" + subDir;
		
		try {
			Path path = Paths.get(saveDir);
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		MultipartFile mFile1 = oto.getFile1(); 
		MultipartFile mFile2 = oto.getFile2();
		
		String uuid = UUID.randomUUID().toString();
		//null대신 ""(널 스트링)값 저장
		oto.setOto_file1("");
		oto.setOto_file2("");
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		String fileName2 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		if(!mFile1.getOriginalFilename().equals("")) {
			oto.setOto_file1(subDir + "/" + fileName1);
		}
		
		if(!mFile2.getOriginalFilename().equals("")) {
			oto.setOto_file2(subDir + "/" + fileName2);
		}
		
		System.out.println("oto_file1 : " + oto.getOto_file1());
		System.out.println("oto_file2 : " + oto.getOto_file2());
		
		//1대1 문의 db 등록
		int insertCount = otoService.insertOto(oto, theater_num, id);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "1대1 문의 실패");
			return "error/fail";
		}
		try {
			if(!mFile1.getOriginalFilename().equals("")) {
				mFile1.transferTo(new File(saveDir, fileName1));
			}
			
			if(!mFile2.getOriginalFilename().equals("")) {
				mFile2.transferTo(new File(saveDir, fileName2));
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/myp_oto_breakdown";
	}
	
	//------------------------------------------------------------------
	//paging 처리
	public PageInfo pageInfo(@RequestParam(defaultValue = "1")int pageNum, int listLimit, int startRow, String category, String pageName) {
		//전체1 notice 게시판 번호
		int listCount = 0;
		int pageListLimit = 5;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if(pageName.equals("notice")) {
			switch (category) {
				case "" : listCount = adminService.getNoticeListCount(); break; 
				default : listCount = noticeService.getNoticeListCountCag(category); break; 
			}
		} else if(pageName.equals("faq")) {
//			switch (category) {
//				case "" : listCount = faqService.getFaqListCount(); break; 
//				default : listCount = faqService.getfaqListCountCag(category); break; 
//			}
			
		}
//		pageListLimit = 5; //뷰에 표시할 페이지갯수
		maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		
	}//pageInfo 끝
	
	
}
