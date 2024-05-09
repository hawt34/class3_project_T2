package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MypageInfoService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.service.ReservationService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageInfoService mypageInfoService;
	
	@Autowired
	private OtoService otoService;

	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("myp_main")
	public String mypMain(Model model, MemberVO member) {
		String id = (String)session.getAttribute("sId");
//		System.out.println( "session ID 값 : " + id);
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("targetURL", "member_login");
//			System.out.println("myp_main 실패");
			return "error/fail";
		} else { // 성공
//			System.out.println("myp_main 성공");
			
			// 메인페이지 아이디 
//			member.setMember_id(id);
			
			member = mypageInfoService.getMember(id);
			model.addAttribute("member", member);
//			System.out.println("member222 : " + member);
			
			
//			ReservationVO member2 = mypageInfoService.getMovieResv(member.getMember_id());
//			model.addAttribute("reservation", member2);
			
			// 극장 리스트
			List<TheaterVO> infoTheater = mypageInfoService.getTheater();
			model.addAttribute("theater", infoTheater);
			
			// 예매내역 영화제목
			List<MovieVO> movieReservation = reservationService.getMovieReservation(id);
			model.addAttribute("movieReservation", movieReservation);
//			System.out.println("movieReservation" + movieReservation);
			
			// 예매내역 관람날짜
			List<TicketVO> dateReservation = reservationService.getDateReservation(id);
			model.addAttribute("dateReservation", dateReservation);
			System.out.println("dateReservation" + dateReservation);
			
//			List<Object> combinedList = new ArrayList<>();
//			combinedList.addAll(movieReservation);
//			combinedList.addAll(dateReservation);
//			model.addAttribute("combinedList", combinedList);
			
			return"mypage/myp_main";
		}
		
	}
	
//	@GetMapping("MyTheaterList")
//	public String myTheaterList(TheaterVO theater, Model model, HttpSession session) {
//		System.out.println("MyTheaterList");
//		String myTheater = session.getAttribute("theater_num");
//		return"redirect:/";
//	}
	// ============================= 극장 전체 리스트 =============================
	@PostMapping("MyTheaterList") // 마이페이지 My극장 모달폼 극장 전체 리스트
	public String handleFormSubmit(@RequestParam(name = "theaterIds", required = false, defaultValue = "") List<String> theaterIds, HttpSession session, TheaterVO theater) {

	    System.out.println(" 나의 극장 : " + theaterIds);
	        return "redirect:/myp_main";
    }
	
	@GetMapping("myp_point")
	public String mypPoint() {
		System.out.println("myp_point");
		return "mypage/myp_point";
	}
	
	// ============================= 정보수정 =============================

//	@RequestMapping(value = "myp_info_modify", method = {RequestMethod.GET, RequestMethod.POST})
//	public String mypInfoModify(Model model, MemberVO member) {
//	    String id = (String) session.getAttribute("sId");
//	    System.out.println(id);
//	    if (id == null) { // 세션 아이디 존재 안할경우
//	        model.addAttribute("msg", "잘못된 접근입니다!");
//	        model.addAttribute("targetURL", "member_login");
//	        return "error/fail";
//	    } else { // 아이디 존재할 경우
//	         회원정보 수정 폼으로 이동
//	    	MemberVO infoMember = mypageInfoService.getMember(id);
//	    	model.addAttribute("member", infoMember);
//	        return "mypage/myp_info_modify";
//	    }
//	}
	
	@GetMapping("myp_info_modify")
	public String mypInfoModify(MemberVO member, Model model) {
		
		System.out.println("myp_info_modify");
		// 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
		// => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("targetURL", "./MemberLogin");
			return"error/fail";
		}
		// 로그인 비즈니스 로직 처리 과정에서 사용한 MemberService - getMember() 메서드 재사용
		// => MemberVO 객체를 파라미터로 전달하지만 객체 내에는 데이터가 없으므로
		//    세션 아이디를 MemberVO 객체의 id 멤버변수 값으로 저장
		
		member.setMember_id(id);
		member = mypageInfoService.getDbMember(member);
		
		
		model.addAttribute("member", member);
		
		
        return "mypage/myp_info_modify";
		
	}
	
	@PostMapping("myp_info_modify_pro")
	public String mypInfoModifyPro(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
		System.out.println("mypInfoModifyPro");
		
//		 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
//		 => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("targetURL", "./");
			return "error/fail";
		}
		// ----------------------------------------------------
		// 만약, 변경할 패스워드가 존재할 경우 패스워드 암호화
		if(!member.getMember_pwd().equals("")) {
			member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));
		}
		// ----------------------------------------------------
		// MemberService - modifyMember() 메서드 호출하여 회원정보 수정 요청
		// => 파라미터 : MemberVO 객체   리턴타입 : int(updateCount)
		int updateCount = mypageInfoService.modifyMember(member);
		
		// 수정 결과 판별 후 성공 시 "MemberInfo" 서블릿 요청
		// 실패 시 "error/fail.jsp" 포워딩("회원정보 수정 실패!")
		if(updateCount > 0) {
			return "redirect:/myp_info_modify";
		} else {
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "error/fail";
		}
		
	}
	
	// ============================= 아이디 중복 체크 =============================
	// => 회원 가입 화면에서 새 창이 열릴 경우 id 파라미터가 없이 요청 발생(id = null)
	// => 아이디 중복 검사 화면에서 검색 버튼 클릭 시 id 파라미터가 포함되어 요청 발생
	@GetMapping("CheckDupId")
	public String checkDupId(MemberVO member, Model model) {
		System.out.println("아이디 : " + member.getMember_id());
		
		// id 파라미터가 있을 경우 (member.getId()가 null이 아닐 경우)에만 아이디 검색
		// MemberService - getMember() 메서드 재사용
		if(member.getMember_id() != null) {
			MemberVO dbMember = mypageInfoService.getDbMember(member); // 아이디에 대한 회원정보 조회
			
			// 회원정보 조회 결과 판별
			if(dbMember == null) { // 입력받은 아이디가 존재하지 않을 경우
//				model.addAttribute("checkResult", "사용 가능한 아이디 ");
				model.addAttribute("checkResult", false); // 중복이 아니므로 false 값 저장
			} else { // 입력받은 아이디가 존재할 경우 
//				model.addAttribute("checkResult", "이미 사용중인 아이디 ");
				model.addAttribute("checkResult", true); // 중복이므로 true 값 저장
			}
		}
		return"mypage/check_id";
	}
	
	
	
	
	
	
	// ============================= 쿠폰 =============================

	@GetMapping("myp_coupon")
	public String mypCoupon(MemberVO member, Model model, CouponVO coupon) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 아이디 없을 경우 로그인 페이지 이동 
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("targetURL", "./MemberLogin");
			return"error/fail";
		}
		System.out.println("coupon 컨트롤러");
		List<CouponVO> couponList = couponService.getCoupon();
		model.addAttribute("coupon", couponList);
		
		return "mypage/myp_coupon";
	}
	
	
	// ============================= 예매 =============================
	
	// 예매내역
	@GetMapping("myp_reservation")
	public String mypReservation(MemberVO member, Model model) {
//		String id = (String)session.getAttribute("sId");
		
//		if(id == null) { // 아이디 없을 경우 로그인 페이지 이동 
//			model.addAttribute("msg", "로그인이 필요한 페이지입니다!");
//			model.addAttribute("targetURL", "./MemberLogin");
//			return"error/fail";
//		}
		
//		member = mypageInfoService.getMember(id);
//		model.addAttribute("member", member);
//		System.out.println("myp_reservation()");
//		List<ReservationVO> reservationList = reservationService.getReservation(id);
//		model.addAttribute("reservation", reservationList);
//		System.out.println("reservationList" + reservationList);
//		MovieVO sadfsdf = service.sadfsadfs();
//		ReservationVO asdfasdf = service.asdfasdf();
		
		
		return "mypage/myp_reservation";
	}
	
	// 취소 영화 목록
	@GetMapping("myp_cancel")
	public String mypCancel() {
//		System.out.println("myp_cancel()");
		return "mypage/myp_cancel";
	}
	// ============================= 탈퇴 =============================
	
	
	// 탈퇴 안내 페이지 (탈퇴1)
	@GetMapping("myp_withdraw_info")
	public String mypWithdrawInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
//		System.out.println(id);
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("targetURL", "member_login");
			System.out.println("myp_withdraw_info 실패");
			return "error/fail";
		} 
		return "mypage/myp_withdraw_info";
	}
	
	// 탈퇴 비밀번호 재입력 페이지 (탈퇴2)
	@GetMapping("myp_withdraw_passwd")
	public String mypWithdrawPasswd() {
		System.out.println("myp_withdraw_passwd()");
		return "mypage/myp_withdraw_passwd";
	}
	
	// 탈퇴처리
	@PostMapping("myp_withdraw_finish_pro")
	public String mypWithdrawFinishPro(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
		// 세션 아이디 존재 여부 판별
		// 회원 정보 조회 후 아이디 일치 여부와 패스워드 일치 여부 확인
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "존재하지 않는 아이디 입니다!");
			model.addAttribute("targetURL", "./");
			return"error/fail";
		}
		
		
		// 로그인 비즈니스 로직 처리 과정에서 사용한 MemberService - getMember() 메서드 재사용
		// => MemberVO 객체를 파라미터로 전달하지만 객체 내에는 데이터가 없으므로
		//    세션 아이디를 MemberVO 객체의 id 멤버변수 값으로 저장
		member.setMember_id(id);
		MemberVO dbMember = mypageInfoService.getDbMember(member);
		
		
//		session.getAttribute("passwd");
		if(dbMember != null && passwordEncoder.matches(member.getMember_pwd(), dbMember.getMember_pwd())) {
			// memberService - withdrawMember() 메서드 호출하여 회원 탈퇴 처리 요청
			int updateCount = mypageInfoService.withdrawMember(member);
			
		// 로그인 정보 제거하기 위해 세션 초기화 후 메인페이지로 리다이렉트
			session.invalidate();
			return "redirect:/myp_withdraw_finish";
		} else { // 아이디가 존재하지 않거나 패스워드가 일치하지 않을 경우
			model.addAttribute("msg", "탈퇴 권한이 없습니다!");
			return"error/fail";
			
		}
		
		
	}
	
	@GetMapping("myp_withdraw_finish")
	public String mypWithdrawFinish() {
		System.out.println("myp_withdraw_finish()");
		
		return "mypage/myp_withdraw_finish";
	}
	
	// ============================= CSC =============================
	
	// CSC 관련 List
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypOtoBreakdown(Model model, @RequestParam(defaultValue = "1")int pageNum) {
//			System.out.println("myp_withdraw_finish()");
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit);
		


		model.addAttribute("otoList", otoList);
		return "mypage/myp_oto_breakdown";
	}
	

	@GetMapping("myp_oto_detail")
	public String mypOtoDetail(int oto_num, Model model) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String otoTheater = otoService.getTheaterName(oto.getTheater_num());
		

		model.addAttribute("otoTheater", otoTheater);
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_detail";
	}
	
	@GetMapping("myp_oto_modifyForm")
	public String mypOtoModifyForm(int oto_num, Model model) {
		OTOVO oto = otoService.getOto(oto_num);
		String otoDate = oto.getOto_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String otoTheater = otoService.getTheaterName(oto.getTheater_num());

		model.addAttribute("otoTheater", otoTheater);
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_modifyForm";
	}
	
	@PostMapping("myp_oto_modifyPro")
	public String myOtoModifyPro(int oto_num, String OTO_content, Model model) {
		int updateCount = otoService.updateOto(oto_num, OTO_content);
		if(updateCount == 0) {
			model.addAttribute("msg", "수정에 실패하였습니다");
			return "error/fail";
		}
		return "redirect:/myp_oto_breakdown";
	}
	
	@GetMapping("myp_oto_delete")
	public String myOtoDelete(int oto_num, Model model) {
		int deleteOtoCount = otoService.deleteOto(oto_num);
		if(deleteOtoCount == 0) {
			model.addAttribute("msg", "삭제 실패");
		}
		
		return "redirect:/myp_oto_breakdown";
	}

	
}
