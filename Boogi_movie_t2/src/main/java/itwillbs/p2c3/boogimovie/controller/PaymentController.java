package itwillbs.p2c3.boogimovie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;

import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.PaymentService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
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
	
	@Autowired
	private MovieInfoService movieService;
	
	
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
	public String paymentPro(MemberVO member, HttpSession session, Model model, ScreenSessionVO scs, MovieVO movie,
			String selected_seats, String person_info, String total_fee, String scs_date2, String scs_start_time, String scs_end_time) {
		
		// 세션 확인
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 후 다시 시도해주세요.");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		
		member.setMember_id(id);
		member = memberService.isCorrectUser(member);
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
		movie = movieService.getMovieInfo(movie);
		
		
		// 선택 날짜 String scs_date2 > Date 변환  > "yyyy.MM.dd(E)" 형식으로 재가공
		SimpleDateFormat originalFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		Date date = null;
		try {
		        // 문자열을 Date 객체로 변환
			date = originalFormat.parse(scs_date2);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy.MM.dd(E)");
        String formattedDate  = targetFormat.format(date);
		
        
        
		model.addAttribute("member", member);
		model.addAttribute("couponList", couponList);
		model.addAttribute("movie", movie);
		model.addAttribute("scs", scs);
		model.addAttribute("formattedDate", formattedDate);
		model.addAttribute("selected_seats", selected_seats);
		model.addAttribute("person_info", person_info);
		model.addAttribute("total_fee", total_fee);
		model.addAttribute("start_time", scs_start_time);
		model.addAttribute("end_time", scs_end_time);
		
		return "payment/payment_reservation";
	}
	
	@GetMapping("pay_test")
	public String paymentTest() {
		return "payment/pay_test";
	}
	
	// 포인트 적용 버튼 (입력 값 디비값과 비교)
	@ResponseBody
	@GetMapping("memberPoint")
	public String memberPoint(MemberVO member, int use_point, Model model){
		
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
