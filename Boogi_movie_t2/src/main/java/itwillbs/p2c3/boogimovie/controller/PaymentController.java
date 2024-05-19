package itwillbs.p2c3.boogimovie.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import itwillbs.p2c3.boogimovie.service.CouponService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.PaymentService;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.PayVO;
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
			String selected_seats, String person_info, String total_fee, String scs_date2) {
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%----------------------------scs" + scs);
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
		
		return "payment/payment_reservation";
		
	} // paymentPro()
	

	// ================================================================================
	
	// 포인트 적용 버튼 (입력 값 디비값과 비교)
	@ResponseBody
	@GetMapping("memberPoint")
	public String memberPoint(MemberVO member, int use_point, Model model){
		
		System.out.println("아이디 : " + member.getMember_id() + ", use_point : " + use_point);
		
		member = service.getMember(member);
		
		if(member.getMember_point() < use_point) {
			
			return "false"; // 포인트 차감 불가 
		} 
		
		return "true";  // 포인트 차감 가능
		
	} // memberPoint()
	
	
	// ================================================================================
	
	@ResponseBody
	@PostMapping("payVerify{imp_uid}")
	public boolean payVerify(@PathVariable(value = "imp_uid") String imp_uid, String use_point, String coupon_num, MemberVO member, String amount, 
			String formattedDate, MovieVO movie, String theater_name, String screen_cinema_num, ScreenSessionVO scs, String person_info, PayVO pay, 
			String selected_seats, Model model) throws IamportResponseException, IOException{
					
		
		System.out.println("imp_uid : " + imp_uid);
		System.out.println("use_point : " + use_point);
		System.out.println("coupon_num : " + coupon_num);
		System.out.println("member : " + member);
		System.out.println("amount : " + amount);

		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
		
		if(payment.getStatus().equals("paid")) {
			// 리턴받은 payment의 status가 결제완료이면 DB조작 메소드 실행
			System.out.println("payVerify - paid ");
			
			int amountInt = Integer.parseInt(amount);
			int usePointInt = Integer.parseInt(use_point);
			double savePointDouble = amountInt * 0.1;
			int savePoint = (int)(savePointDouble / 100) * 100;
			int apply_point = savePoint - usePointInt;
			 
			member = service.getMember(member);
			member.setMember_point(member.getMember_point() + apply_point);
			
			service.updateMemberPoint(member);
			couponService.useCoupon(coupon_num);
			pay.setCoupon_num(Integer.parseInt(coupon_num));
			pay.setMember_id(member.getMember_id());
			pay.setMerchant_uid(payment.getMerchantUid());
			pay.setTicket_pay_price(amountInt);
			pay.setUse_point(usePointInt);
//			pay.setScs_num(scs.getScs_num());
			pay.setScs_num(0);
			pay.setTicket_pay_status("결제");
			pay.setTicket_pay_type(payment.getPgProvider());
			
			service.savePayInfo(pay);
			
			model.addAttribute("pay", pay);
			model.addAttribute("movie", movie);
			model.addAttribute("theater_name", theater_name);
			model.addAttribute("screen_cinema_num", screen_cinema_num);
			model.addAttribute("person_info", person_info);
			model.addAttribute("formattedDate", formattedDate);
			model.addAttribute("selected_seats", selected_seats);
			
			return true; 
			
		} else if(payment.getStatus().equals("failed")) {
			System.out.println("payVerify - failed ");
			return false; 
			
			
		}
		return false; 
		
		
	} // payVerify()
	
	// ================================================================================
	
	@GetMapping("success_reserve{uid}")
	public String successReserve(@PathVariable("uid") String orderNum, Model model, PayVO pay, ScreenSessionVO scs, MovieVO movie,
			String theater_name, String screen_cinema_num, String person_info, String formattedDate, String selected_seats) {
		
		System.out.println("%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$---------------uid : " + orderNum);
		System.out.println("%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$---------------pay : " + pay);
		System.out.println("%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$---------------movie : " + movie);
		
		movie = movieService.getMovieInfo(movie);
		model.addAttribute("pay", pay);
		model.addAttribute("scs", scs);
		model.addAttribute("movie", movie);
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("screen_cinema_num", screen_cinema_num);
		model.addAttribute("person_info", person_info);
		model.addAttribute("formattedDate", formattedDate);
		model.addAttribute("selected_seats", selected_seats);
		
		
		
		
		return "payment/payment_success_reserve";
		
	} // successReserve()
	
	
	
	
	
	
}
