package itwillbs.p2c3.boogimovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.InfoModifyService;

@Controller
public class MypageController {
	
	@Autowired
	private InfoModifyService infoModifyService;
	
	
	@GetMapping("myp_main")
	public String mypMain() {
//		System.out.println("myp_main");
		return "mypage/myp_main";
	}
	
	@GetMapping("myp_point")
	public String mypPoint() {
		System.out.println("myp_point");
		return "mypage/myp_point";
	}
	
	@RequestMapping(value = "myp_info_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypInfoModify() {
//		System.out.println("myp_info_modify()");
		return "mypage/myp_info_modify";
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
