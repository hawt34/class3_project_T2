package itwillbs.p2c3.boogimovie.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MypageService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.PageInfo;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private OtoService otoService;

	@Autowired
	private CouponService couponService;
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private HttpSession session;
	
	//중복되는 코드 - 파일 가상 저장 path
	String uploadDir = "/resources/upload";
	
	@GetMapping("myp_main")
	public String mypMain(Model model, MemberVO member) {
		String id = (String)session.getAttribute("sId");
//		System.out.println( "session ID 값 : " + id);
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
//			System.out.println("myp_main 실패");
			return "error/fail";
		} else { // 성공
			
			// 메인페이지 아이디 
			member = mypageService.getMember(id);
			model.addAttribute("member", member);
			
			
			// My극장 극장 전체리스트
			List<TheaterVO> infoTheater = mypageService.getTheater();
			model.addAttribute("theater", infoTheater);
			
			// My극장 자주가는 영화관
			MemberVO infoMyTheater = mypageService.getMyTheater(member);
			model.addAttribute("infoMyTheater", infoMyTheater);
			
			// 예매내역
			List<Map<String , Object>> movieReservation = mypageService.getMovieReservation(member);
			model.addAttribute("movieReservation", movieReservation);
			
//			List<Object> combinedList = new ArrayList<>();
//			combinedList.addAll(movieReservation);
//			combinedList.addAll(dateReservation);
//			model.addAttribute("combinedList", combinedList);
			
			return"mypage/myp_main";
		}
		
	}

	// ============================= My극장 체크박스 =============================
	@PostMapping("MyTheaterList") // 마이페이지 My극장 모달폼 극장 전체 리스트
	public String handleFormSubmit(@RequestParam(name = "theaterIds", required = false, defaultValue = "") List<String> theaterIds, HttpSession session, TheaterVO theater) {
		
		
//	    System.out.println(" 나의 극장 : " + theaterIds);
	        return "redirect:/myp_main";
    }
	
	
//	@ResponseBody
//	@PostMapping(value = "api/myp_my_theater", produces = "application/json")
//	public ResponseEntity<String> mypMyTheater(@RequestBody List<String> checkedValues, Model model, @RequestBody String member_id, MemberVO member){
//	    System.out.println("Received checked values: ~~~!~!~~~~~~~~~~ " + checkedValues);
//	    
//	    if(checkedValues.isEmpty()) {
//	        return ResponseEntity.badRequest().body("No data received");
//	    }
//	    MemberVO dbMember = mypageService.myTheater(checkedValues, member_id, member);
//	    
//	    if(dbMember == null) {
//	    	
//	    	return ResponseEntity.badRequest().body("Failed to process data");
//	    }
//	    model.addAttribute("member", dbMember);
//	    System.out.println("memberrrrrrr : " + member);
////	    model.addAttribute("member", member);
//	    
//	    return ResponseEntity.ok("Data received successfully");
//	    
//	    
//	}
	
	@ResponseBody
	@PostMapping(value = "api/myp_my_theater", produces = "application/json")
	public String mypMyTheater(@RequestBody Map<String, Object> check, Model model, MemberVO member){
		//  List<String> checkedValues랑 String member_id를 map으로 가져옴
	    System.out.println("Member ID: " + check.get("member_id"));

	    List<String> checkedValues = (List<String>) check.get("checkedValues");
	    String member_id = (String) check.get("member_id");

	    if(checkedValues == null || checkedValues.isEmpty()) {
	    	return "false";
	    }

//	    MemberVO dbMember = mypageService.myTheater(checkedValues, member_id, member);
	    mypageService.myTheater(checkedValues, member_id, member);

//	    if(dbMember == null) {
//	        return ResponseEntity.badRequest().body("Failed to process data");
//	    }
	    
//	    model.addAttribute("member", dbMember);
//	    System.out.println("Member : " + member);

	    return "true";
	}
	

    
    @ResponseBody
    @PostMapping("updateTheater")
    public ResponseEntity<String> updateTheater(@RequestParam String theater, @RequestParam int theaterNumber) {
        try {
            String id = (String)session.getAttribute("sId");
            
            mypageService.updateTheater(id, theater, theaterNumber);
            return ResponseEntity.ok("성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트 실패");
        }
        
        
        
        
        
    }
	
	
	
	
	
	
	
	
	// ============================= 포인트 =============================
	
	@GetMapping("myp_point")
	public String mypPoint(Model model, MemberVO member) {
		System.out.println("myp_point");
		
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
			return"error/fail";
		}
		
		member.setMember_id(id);
		member = mypageService.getDbMember(member);
		
		model.addAttribute("member", member);
		
		return "mypage/myp_point";
	}
	
	// ============================= 정보수정 =============================

	@GetMapping("myp_info_modify")
	public String mypInfoModify(MemberVO member, Model model) {
		
		System.out.println("myp_info_modify");
		// 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
		// => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String id = (String)session.getAttribute("sId");
		
		
		
		
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "./");
			return"error/fail";
		}
		
		
		member.setMember_id(id);
		member = mypageService.getDbMember(member);
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwd = member.getMember_pwd();
		member.setMember_pwd(pwdEncoder.encode(pwd));
		
		model.addAttribute("member", member);
		
		
        return "mypage/myp_info_modify";
		
	}
	
	@PostMapping("myp_info_modify_pro")
	public String mypInfoModifyPro(MemberVO member, Model model) {
		System.out.println("mypInfoModifyPro");
		
//		 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
//		 => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String id = (String)session.getAttribute("sId");
		System.out.println("session Id : " + id);
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "./");
			return "error/fail";
		}

		int updateCount = mypageService.modifyMember(member);
		model.addAttribute("member", updateCount);
		if(updateCount > 0) { // 정보수정 성공 시
//			model.addAttribute("member", member);
			System.out.println("member_id : " + member.getMember_id());
			model.addAttribute("msg", "회원정보가 수정되었습니다");
			model.addAttribute("targetURL", "myp_info_modify");
			return "error/fail";
		} else { // 정보수정 실패 시
			model.addAttribute("msg", "회원정보 수정에 실패했습니다");
			model.addAttribute("targetURL", "myp_info_modify");
			return "error/fail";
		}
		
	}
	
	// ============================= 쿠폰 =============================

	@GetMapping("myp_coupon")
	public String mypCoupon(MemberVO member, Model model, CouponVO coupon) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 아이디 없을 경우 로그인 페이지 이동 
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
			return"error/fail";
		}
		
		member.setMember_id(id);
		member = mypageService.getDbMember(member);
		model.addAttribute("member", member);
		
//<<<<<<< HEAD
//		System.out.println("coupon 컨트롤러");
		// coupon_num
//		List<CouponVO> couponNum = mypageService.getCoupon(member);
//		model.addAttribute("couponNum", couponNum);
//=======
		List<CouponVO> couponList = couponService.getCoupon(member);
		model.addAttribute("list", couponList);
//>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
		
		return "mypage/myp_coupon";
	}
		
	
	
	// ============================= 예매 =============================
	
	// 예매내역
	@GetMapping("myp_reservation")
	public String mypReservation(MemberVO member, Model model, @RequestParam(defaultValue = "1")int pageNum) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 아이디 없을 경우 로그인 페이지 이동 
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
			return"error/fail";
		}
		member = mypageService.getMember(id);
		model.addAttribute("member", member);
//		System.out.println("member : " + member);
//		System.out.println("member.getMember_id" + member.getMember_id());
		// 예매정보
		List<Map<String , Object>> movieReservation = mypageService.getMovieReservation(member);
		model.addAttribute("movieReservation", movieReservation);
		
		System.out.println("pageNum : " + pageNum);
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		System.out.println("startRow : " + startRow);
		System.out.println("listLimit : " + listLimit);
		String member_id = member.getMember_id();
		
		List<Map<String, Object>> resvList = mypageService.getResvList(startRow, listLimit, member_id);
		int listCount = mypageService.getResvCount(member); // 총 예매영화 갯수
		
		System.out.println("listCount : " + listCount);
		int pageListLimit = 3; // 뷰에 표시할 페이지 갯수
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0); //카운트 한 게시물 + 1 한 페이지
		System.out.println("maxPage : " + maxPage);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1; // 첫번째 페이지 번호
		System.out.println("startPage : " + startPage);
		int endPage = startPage + pageListLimit - 1; //마지막 페이지 번호
		System.out.println("endPage : " + endPage);
		if(endPage > maxPage) { // 마지막 페이지가 최대 페이지를 넘어갈때 
			endPage = maxPage;
		}
		
		System.out.println("endPage : " + endPage);
		System.out.println("maxPage : " + maxPage);
		PageInfo pageList = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		

		if(pageNum < 1 || pageNum > maxPage){
			model.addAttribute("msg", "존재하지 않는 페이지입니다");
			model.addAttribute("targetURL", "myp_reservation");
		}
		model.addAttribute("pageList", pageList);
		model.addAttribute("resvList", resvList);
		
		return "mypage/myp_reservation";
	}
	
	// ============================= 스토어 =============================
	
	@GetMapping("myp_store")
	public String mypStore() {
		
		return "mypage/myp_store";
	}
	// ============================= 취소 =============================
	
	// 취소 영화 목록
	@GetMapping("myp_cancel")
	public String mypCancel(Model model, MemberVO member) {
//		System.out.println("myp_cancel()");
		
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 아이디 없을 경우 로그인 페이지 이동 
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
			return"error/fail";
		}
		
		member = mypageService.getMember(id);
		model.addAttribute("member", member);
		
		System.out.println("mypcontroller - myp_cancel()");
		List<Map<String, Object>> cancelList = mypageService.getCancelList(member);
		model.addAttribute("cancelList", cancelList);
		
		
		return "mypage/myp_cancel";
	}
	
	// ============================= 탈퇴 =============================
	
	
	// 탈퇴 안내 페이지 (탈퇴1)
	@GetMapping("myp_withdraw_info")
	public String mypWithdrawInfo(Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		} 
		return "mypage/myp_withdraw_info";
	}
	
	// 탈퇴 비밀번호 재입력 페이지 (탈퇴2)
	@GetMapping("myp_withdraw_passwd")
	public String mypWithdrawPasswd(Model model) {
//		System.out.println("myp_withdraw_passwd()");
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "./");
			return"error/fail";
		}
		return "mypage/myp_withdraw_passwd";
	}
	
	// 탈퇴처리
	@PostMapping("myp_withdraw_finish_pro")
	public String mypWithdrawFinishPro(@RequestParam("password")String password, MemberVO member, Model model) {
		// 세션 아이디 존재 여부 판별
		// 회원 정보 조회 후 아이디 일치 여부와 패스워드 일치 여부 확인
		String id = (String)session.getAttribute("sId");
//		System.out.println("myp_withdraw_finish_pro");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "./");
			return"error/fail";
		}
		
		member.setMember_id(id);
		MemberVO dbMember = mypageService.getDbMember(member);
		
		if(dbMember != null && password.equals(dbMember.getMember_pwd())) { // 비번이 같을 때 
			int updateCount = mypageService.withdrawMember(member);
			System.out.println(dbMember.getMember_pwd());
		// 로그인 정보 제거하기 위해 세션 초기화 후 메인페이지로 리다이렉트
			if(updateCount > 0) { // 탈퇴 성공 시
//				System.out.println("탈퇴성공");
				
				// 로그인 정보 제거하기 위해 세션 초기화 후 myp_withdraw_finish 리다이렉트
				session.invalidate();
				return "redirect:/myp_withdraw_finish";
			} else { // 실패시
//				System.out.println("탈퇴실패");
				model.addAttribute("msg", "탈퇴에 실패했습니다");
				model.addAttribute("targetURL", "myp_withdraw_info");
				return"error/fail";
			}
		} else { // 비번이 일치하지 않을 경우
//			System.out.println("비번 틀림");
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
			model.addAttribute("targetURL", "myp_withdraw_passwd");
			return"error/fail";
		}
	}
	
	// 탈퇴 후 보여지는 페이지
	@GetMapping("myp_withdraw_finish")
	public String mypWithdrawFinish(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
//		System.out.println("myp_withdraw_finish()");
		return "mypage/myp_withdraw_finish";
	}
	
	// ============================= CSC =============================
	
	// CSC 관련 List
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypOtoBreakdown(Model model,
								  @RequestParam(defaultValue = "1")int pageNum,
								  @RequestParam(required = false)String faqCategory,
								  @RequestParam(required = false)String theaterName,
								  HttpSession session) {
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "./");
			return "error/fail";
		}
		
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit, theaterName, theaterName);
		int listCount = otoService.getOtoListCount(theaterName, theaterName); //총 공지사항 갯수
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
		return "mypage/myp_oto_breakdown";
	}
	
	//1대1 문의 삭제
	@GetMapping("myp_oto_detail")
	public String mypOtoDetail(int oto_num,
							   Model model,
							   @RequestParam(defaultValue = "1")String pageNum) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		

		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_detail";
	}
	
	@GetMapping("myp_oto_modifyForm")
	public String mypOtoModifyForm(int oto_num, Model model) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		//file 배열
		String[] arrFileNames = {
			oto.getOto_file1(),	
			oto.getOto_file2()
		};
		
		model.addAttribute("fileNames", arrFileNames);
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_modifyForm";
	}
	
	//파일삭제 ajax 호출------
	@ResponseBody
	@PostMapping("otoDeleteFile")
	public String otoDeleteFile(OTOVO oto, HttpSession session) {
//		System.out.println("!!oto_num: " + oto.getOto_num());
//		System.out.println("!!oto_file: " + oto.getOto_file1());
		int removeCount = otoService.removeOtoFile(oto);
		
		if(removeCount > 0) {
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			if(!oto.getOto_file1().equals("")) {
				try {
					Path path = Paths.get(saveDir + "/" + oto.getOto_file1());
					Files.deleteIfExists(path);
					
					return "true";
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "false";
	}
	
	// 1대1 문의 수정
	@PostMapping("myp_oto_modifyPro")
	public String myOtoModifyPro(@RequestParam(defaultValue = "1")String pageNum, OTOVO oto, Model model) {
		String saveDir = session.getServletContext().getRealPath(uploadDir); //실제 경로
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String subDir = now.format(dtf);
		
		//실제 경로에 서브 디렉토리 경로 결합
		saveDir += "/" + subDir;
		
		//서버 파일 업로드 처리
		try {
			Path path = Paths.get(saveDir); //경로 관리 path 객체 생성
			Files.createDirectories(path); //업로드
		} catch (IOException e) {
			e.printStackTrace();
		} 
		//----------------------------------------------------------
		// 파일명 중복 방지 
		//실제 파일 정보가 관리되는 MultuPartFile 타입 객체 활용
		MultipartFile mFile1 = oto.getFile1();
		MultipartFile mFile2 = oto.getFile2();
		
		oto.setOto_file1("");
		oto.setOto_file2("");
		
		//업로드 파일명을 저장할 fileNameX 변수를 ""으로 초기화
		String fileName1 = "";
		String fileName2 = "";
		
		if(mFile1 != null && !mFile1.getOriginalFilename().equals("")) {
			fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
			//boarVO 객체의 board_fileX 멤버변수에 업로드 경로명 + "/" + 파일명 문자열 결합 저장
			oto.setOto_file1(subDir + "/" + fileName1);
		}
		if(mFile2 != null && !mFile2.getOriginalFilename().equals("")) {
			fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
			//boarVO 객체의 board_fileX 멤버변수에 업로드 경로명 + "/" + 파일명 문자열 결합 저장
			oto.setOto_file2(subDir + "/" + fileName2);
		}
		
		int updateCount = otoService.updateOto(oto);
		if(updateCount > 0) {
			try {
				if(!oto.getOto_file1().equals("")) {
					//multipartFile을 경로는 savDir, 이름은 fileName1(UUID + "_" + mFile.getOriginalFilename()
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				if(!oto.getOto_file2().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//글 상세정보조회 페이지 리다이렉트
			return "redirect:/myp_oto_detail?oto_num=" + oto.getOto_num() + "&pageNum=" + pageNum;
			
		} else {
			// "글 수정 실패!" 출력 및 이전페이지 돌아가기 처리
			model.addAttribute("msg", "글 수정 실패!");
			return "error/fail";
		}
	}
	//1대1 문의 삭제
	@GetMapping("myp_oto_delete")
	public String myOtoDelete(int oto_num, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 필요합니다!");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		OTOVO oto = otoService.getOto(oto_num);
		
		if(oto == null && !id.equals(oto.getMember_id())) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "error/fail";
		}
		
		int deleteOtoCount = otoService.deleteOto(oto_num);
		if(deleteOtoCount == 0) {
			model.addAttribute("msg", "삭제 실패");
		}
		//실제 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		String[] arrFileNames = {
			oto.getOto_file1(),	
			oto.getOto_file2()	
		};
		//실제 파일이 저장된 디렉토리의 파일 지우기
		for(String fileName : arrFileNames) {
			Path path = Paths.get(saveDir + "/" + fileName);
			try {
				Files.deleteIfExists(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/myp_oto_breakdown";
	}
	


	
}
