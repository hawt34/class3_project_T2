package itwillbs.p2c3.boogimovie.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;

import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.PaymentService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Controller
public class PaymentController {
	
	private IamportClient api;
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService couponService;
	
	public PaymentController() {
		this.api = new IamportClient("3531856454755108", "ue5UeHzRddcp4PozEatgw9W9SD1To4172hH0vQZebn5ZqW95F8WDgrZ3mD7EIyhoKuaEIHZ1HiYMz1TJ");
	} // constructor
	
	
	//String >> Date 변환용
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	
	
	
	@GetMapping("payment")
	public String payment(MemberVO member, Model model, HttpSession session) {
		
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
	public String payment2(ScreenSessionVO scs, String selected_seats, String person_info, String total_fee, MemberVO member, HttpSession session, Model model, String scs_date2) {
		
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
	
	@GetMapping("pay_test")
	public String paymentTest() {
		return "payment/pay_test";
	}
	
	// 포인트 적용 버튼 (입력 값 디비값과 비교)
	@ResponseBody
	@GetMapping("memberPoint")
	public String memberPoint(MemberVO member, @RequestParam int use_point, Model model){
		System.out.println("아이디 : " + member.getMember_id() + ", use_point : " + use_point);
		
		member = service.getMember(member);
		int member_point_num = Integer.parseInt(member.getMember_point());
		
		if(member_point_num < use_point) {
			
			return "false"; // 포인트 차감 불가 
		} 
		
		// 포인트 적용 디비 업데이트 
//		member_point_num -= use_point;
//		member.setMember_point(member_point_num + "");
//		System.out.println(member);
		
//		int updateCount = service.usePoint(member);
//		if(updateCount < 1) {
//			model.addAttribute("msg", "포인트 적용 오류 발생");
//			return "error/fail";
//		}
				
		
		return "true";  // 포인트 차감 가능
	}
	
	
	// ================================================================================
	@ResponseBody
	@GetMapping("memberCoupon")
	public List<CouponVO> memberCoupon(MemberVO member, Model model){
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
		model.addAttribute("couponList", couponList);
		
		return couponList; 
	}
	
}
