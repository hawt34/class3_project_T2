package itwillbs.project2.boogi_movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@RequestMapping("/MyPageMain")
	public String MyPageMain() {
		return "mypage/main";
	}
	
	@RequestMapping("/PayOne")
	public String PayOne() {
		return "mypage/pay/pay1";
	}
	
	@RequestMapping("/PayTwo")
	public String PayTwo() {
		return "mypage/pay/pay2";
	}
	
	@RequestMapping("/PayThree")
	public String PayThree() {
		return "mypage/pay/pay3";
	}
	
	@RequestMapping("/WithdrawTwo")
	public String WithdrawTwo() {
		return "mypage/withdraw/withdraw2";
	}
	
	@RequestMapping("/WithdrawThree")
	public String WithdrawThree() {
		return "mypage/withdraw/withdraw3";
	}
	
	
	
	
	
	
	
	
	
	
	
}
