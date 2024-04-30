package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@GetMapping("myp_main")
	public String myp_main() {
		System.out.println("myp_main");
		return "mypage/myp_main";
	}
	
	@GetMapping("myp_point")
	public String myp_point() {
		System.out.println("myp_point");
		return "mypage/myp_point";
	}
	
	@GetMapping("myp_info_modify")
	public String myp_info_modify() {
		System.out.println("myp_info_modify()");
		return "mypage/myp_info_modify";
	}
	
	@GetMapping("myp_coupon")
	public String myp_coupon() {
		System.out.println("myp_coupon()");
		return "mypage/myp_coupon";
	}

	@GetMapping("myp_reservation")
	public String myp_reservation() {
		System.out.println("myp_reservation()");
		return "mypage/myp_reservation";
	}

	@GetMapping("myp_cancel")
	public String myp_cancel() {
		System.out.println("myp_cancel()");
		return "mypage/myp_cancel";
	}
	
	@GetMapping("myp_withdraw_info")
	public String myp_withdraw_info() {
		System.out.println("myp_withdraw_info()");
		return "mypage/myp_withdraw_info";
	}
	
	@GetMapping("myp_withdraw_passwd")
	public String myp_withdraw_passwd() {
		System.out.println("myp_withdraw_passwd()");
		return "mypage/myp_withdraw_passwd";
	}
	
	@GetMapping("myp_withdraw_finish")
	public String myp_withdraw_finish() {
		System.out.println("myp_withdraw_finish()");
		return "mypage/myp_withdraw_finish";
	}
	
<<<<<<< HEAD
//	@PostMapping("myp_oto_breakdown")
//	public String myp_oto_breakdown() {
=======
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String myp_oto_breakdown() {
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
//		System.out.println("myp_withdraw_finish()");
//		return "mypage/myp_oto_breakdown";
//	}
	@GetMapping("myp_oto_detail")
	public String myp_oto_detail() {
//		System.out.println("myp_withdraw_finish()");
		return "mypage/myp_oto_detail";
	}
	
	@GetMapping("myp_oto_modifyForm")
	public String myp_oto_modifyForm() {
		return "mypage/myp_oto_modifyForm";
	}
	
	
}
