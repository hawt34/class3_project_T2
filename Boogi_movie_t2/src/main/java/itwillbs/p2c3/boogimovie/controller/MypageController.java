package itwillbs.p2c3.boogimovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.MypageMainService;
import itwillbs.p2c3.boogimovie.service.MypageService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MypageMainService mypageMainService;
	
	
	@GetMapping("myp_main")
	public String mypMain(HttpSession session, Model model, MemberVO member) {
		String id = (String)session.getAttribute("sId");
		System.out.println(id);
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("targetURL", "member_login");
			System.out.println("myp_main controller");
			return "error/fail";
		} else { // 성공
			System.out.println("myp_main controller");
			MemberVO infoMainMember = mypageService.getMainMember(id);
			model.addAttribute("member", infoMainMember);
			
			return"mypage/myp_main";
		}
		
		
	}
	
	@GetMapping("myp_point")
	public String mypPoint() {
		System.out.println("myp_point");
		return "mypage/myp_point";
	}
	
	@RequestMapping(value = "myp_info_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypInfoModify(HttpSession session, Model model, MemberVO member) {
//	    String id = (String) session.getAttribute("sId");
//	    System.out.println(id);
//	    if (id == null) { // 세션 아이디 존재 안할경우
//	        model.addAttribute("msg", "잘못된 접근입니다!");
//	        model.addAttribute("targetURL", "member_login");
//	        return "error/fail";
//	    } else { // 아이디 존재할 경우
//	         회원정보 수정 폼으로 이동
//	    	MemberVO infoModifyMember = infoModifyService.getMember(id);
//	    	MemberVO infoModifyMember = mypageService.getMember(id);
//	    	model.addAttribute("member", infoModifyMember);
	        return "mypage/myp_info_modify";
//	    }
	}
	
	
	
	@GetMapping("myp_coupon")
	public String mypCoupon() {
//		System.out.println("myp_coupon()");
		return "mypage/myp_coupon";
	}

	@GetMapping("myp_reservation")
	public String mypReservation() {
//		System.out.println("myp_reservation()");
		return "mypage/myp_reservation";
	}

	@GetMapping("myp_cancel")
	public String mypCancel() {
//		System.out.println("myp_cancel()");
		return "mypage/myp_cancel";
	}
	
	@GetMapping("myp_withdraw_info")
	public String mypWithdrawInfo() {
//		System.out.println("myp_withdraw_info()");
		return "mypage/myp_withdraw_info";
	}
	
	@GetMapping("myp_withdraw_passwd")
	public String mypWithdrawPasswd() {
//		System.out.println("myp_withdraw_passwd()");
		return "mypage/myp_withdraw_passwd";
	}
	
	@GetMapping("myp_withdraw_finish")
	public String mypWithdrawFinish() {
		System.out.println("myp_withdraw_finish()");
		return "mypage/myp_withdraw_finish";
	}
	
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypOtoBreakdown() {
//		System.out.println("myp_withdraw_finish()");
		return "mypage/myp_oto_breakdown";
	}
		
	@GetMapping("myp_oto_modifyForm")
	public String mypOtoModifyForm() {
		return "mypage/myp_oto_modifyForm";
	}
	
	@PostMapping("myp_oto_modifyPro")
	public String myOtoModifyPro() {
		return "redirect:/myp_oto_breakdown";
	}
	
	
}
