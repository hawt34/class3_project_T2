package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;

import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Controller
public class PaymentController {
	
	private IamportClient api;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	public PaymentController() {
		this.api = new IamportClient("3531856454755108", "ue5UeHzRddcp4PozEatgw9W9SD1To4172hH0vQZebn5ZqW95F8WDgrZ3mD7EIyhoKuaEIHZ1HiYMz1TJ");
	} // constructor
	
	@GetMapping("payment")
	public String payment(MemberVO member, Model model, HttpSession session) {
		System.out.println("payment");
		
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 후 다시 시도해주세요.");
			model.addAttribute("targetURL", "member_login");
			
			return "error/fail";
		}
		
		member.setMember_id(id);
		member = memberService.isCorrectUser(member);
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
		
		model.addAttribute("member", member);
		model.addAttribute("couponList", couponList);
		
		return "payment/payment_reservation";
	}
	
	@PostMapping("payment")
	public String payment2(ScreenSessionVO scs, String selected_seats, String person_info, String total_fee) {
		
		return "payment/payment_reservation";
	}
	
	@GetMapping("pay_test")
	public String paymentTest() {
		return "payment/pay_test";
	}
	
	
//	@ResponseBody
//	@GetMapping("memberPoint")
//	public MemberVO memberPoint(){
//		MemberVO member = movieService.getMovieListAbc();
//		return member; 
//	}
	
	@ResponseBody
	@GetMapping("memberCoupon")
	public List<CouponVO> memberCoupon(MemberVO member, Model model){
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
		model.addAttribute("couponList", couponList);
		
		return couponList; 
	}
	
}
