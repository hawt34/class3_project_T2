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
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.service.TicketingService;
import itwillbs.p2c3.boogimovie.vo.CartVO;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.PayVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;
import itwillbs.p2c3.boogimovie.vo.TicketInfoVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;
import retrofit2.http.POST;

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
	
	@Autowired
	private TicketingService ticketService;
	
	
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
	public String paymentReserve(MemberVO member, HttpSession session, Model model, ScreenSessionVO scs, MovieVO movie,
			String selected_seats, String person_info, String total_fee, String scs_date2, TheaterVO theater) {
		
		// 세션 확인
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 후 다시 시도해주세요.");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%$---------------scs : " + scs);
		System.out.println("%%%%%%%%%%%%%%%%%%%%$---------------movie : " + movie);
		
		member.setMember_id(id);
		member = memberService.isCorrectUser(member);
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
		movie = movieService.getMovieInfo(movie);
		ScreenSessionVO dbscs = service.getScreenSession(scs.getScs_num());
		dbscs.setTheater_name(scs.getTheater_name());
		dbscs.setMovie_name(movie.getMovie_name());
		dbscs.setMovie_poster(movie.getMovie_poster());
		
		System.out.println("&&&&&&&&&&&&&&&&&&&&&---------------movie : " + movie);
		System.out.println("&&&&&&&&&&&&&&&&&&&&&---------------dbscs : " + dbscs);
		
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
		model.addAttribute("scs", dbscs);
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
		
		
		return !(member.getMember_point() < use_point)+""; 
		
	} // memberPoint()
	
	
	// ================================================================================
	
	@ResponseBody
	@PostMapping("payVerify{imp_uid}")
	public boolean payVerify(@PathVariable(value = "imp_uid") String imp_uid, String use_point, String coupon_num, MemberVO member, String amount, 
			String formattedDate, MovieVO movie, String theater_name, String screen_cinema_num, ScreenSessionVO scs, String person_info, PayVO pay, 
			String selected_seats, TicketVO ticket) throws IamportResponseException, IOException{
		
		System.out.println("%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$---------------scs : " + scs);
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
			pay.setScs_num(scs.getScs_num());
			System.out.println(scs.getScs_num());
			pay.setTicket_pay_status("결제");
			pay.setTicket_pay_type(payment.getPgProvider());
			
			service.savePayInfo(pay); // pay 테이블에 결제 정보 저장
			
//			ticket.setTicket_pay_num(pay.getTicket_pay_num());
//			service.saveTicketInfo(ticket); // ticket 테이블에 티켓 정보 저장
			
			return true; 
			
		} else if(payment.getStatus().equals("failed")) {
			System.out.println("payVerify - failed ");
			return false; 
			
			
		}
		return false; 
		
		
	} // payVerify()
	
	// ================================================================================
	
	@GetMapping("success_reserve{merchant_uid}")
	public String successReserve(@PathVariable("merchant_uid") String merchant_uid, Model model, PayVO pay, ScreenSessionVO scs, MovieVO movie,
			String theater_name, String screen_cinema_num, String person_info, String formattedDate, String selected_seats) {
		
		pay = service.getPayInfo(merchant_uid);
		System.out.println("%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$---------------pay : " + pay);
		
		model.addAttribute("pay", pay);
		
		
		return "payment/payment_success_reserve";
		
	} // successReserve()
	
	
	
	// ================================================================================
	
	
	@PostMapping("payment_store")
	public String paymentStore() {
		
		
		return "payment/payment_store";
	}
	
	// ===================================================================================
	// 뷰 확인 용
	@GetMapping("payment_store")
	public String paymentStore2(MemberVO member, Model model, HttpSession session, CartVO cart) {
		
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 후 다시 시도해주세요.");
			model.addAttribute("targetURL", "member_login");
			
			return "error/fail";
		}
		
		member.setMember_id(id);
		member = memberService.isCorrectUser(member);
		List<CouponVO> couponList = couponService.getMemberCoupon(member);
//		List<CartVO> cartList = couponService.getStoreCart(cart);
		
		model.addAttribute("member", member);
		model.addAttribute("couponList", couponList);
//		model.addAttribute("cartList", cartList);
		
		
		
		
		return "payment/payment_store";
	}
	
	
	// 뷰 확인 용
	@GetMapping("success_store")
	public String successStore() {
		
		
		return "payment/payment_success_store";
	}
	
	
}
