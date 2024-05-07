package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.MypageInfoService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.OTOVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;
import lombok.var;

@Controller
public class MypageController {
	
	@Autowired
	private MypageInfoService mypageInfoService;
	
	@Autowired
	private OtoService otoService;

	@GetMapping("myp_main")
	public String mypMain(HttpSession session, Model model, MemberVO member) {
		String id = (String)session.getAttribute("sId");
		System.out.println(id);
		
//		if(id == null) { // 실패
//			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
//			model.addAttribute("targetURL", "member_login");
//			System.out.println("myp_main 실패");
//			return "error/fail";
//		} else { // 성공
//			System.out.println("myp_main 성공");
			MemberVO infoModifyMember = mypageInfoService.getMember(member);
			model.addAttribute("member", infoModifyMember);
			
			ReservationVO infoMovieResv = mypageInfoService.getMovieResv(member);
			model.addAttribute("reservation", infoMovieResv);
			
			List<TheaterVO> infoTheater = mypageInfoService.getTheater();
			model.addAttribute("theater", infoTheater);
			
			return"mypage/myp_main";
//		}
		
	}
	
//	@GetMapping("MyTheaterList")
//	public String myTheaterList(TheaterVO theater, Model model, HttpSession session) {
//		System.out.println("MyTheaterList");
//		String myTheater = session.getAttribute("theater_num");
//		return"redirect:/";
//	}
	@PostMapping("MyTheaterList")
//	public String handleFormSubmit(@RequestParam List<String> theaterIds, HttpSession session) {
	public String handleFormSubmit(@RequestParam(name = "theaterIds", required = false, defaultValue = "") List<String> theaterIds, HttpSession session, TheaterVO theater) {

	    System.out.println(" 나의 극장 : " + theaterIds);
	        return "redirect:/myp_main";
    }
	
	
	
	
	@GetMapping("myp_point")
	public String mypPoint() {
		System.out.println("myp_point");
		return "mypage/myp_point";
	}
	
	
	@RequestMapping(value = "myp_info_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypInfoModify(HttpSession session, Model model, MemberVO member) {
	    String id = (String) session.getAttribute("sId");
	    System.out.println(id);
	    if (id == null) { // 세션 아이디 존재 안할경우
	        model.addAttribute("msg", "잘못된 접근입니다!");
	        model.addAttribute("targetURL", "member_login");
	        return "error/fail";
	    } else { // 아이디 존재할 경우
//	         회원정보 수정 폼으로 이동
	    	MemberVO infoModifyMember = mypageInfoService.getMember(member);
	    	model.addAttribute("member", infoModifyMember);
	        return "mypage/myp_info_modify";
	    }
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
	public String mypWithdrawInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		System.out.println(id);
		
		if(id == null) { // 실패
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("targetURL", "member_login");
			System.out.println("myp_withdraw_info 실패");
			return "error/fail";
		} else { // 성공
			System.out.println("myp_withdraw_info 성공");
			
		}
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
	
	// CSC 관련 List
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypOtoBreakdown(Model model, @RequestParam(defaultValue = "1")int pageNum) {
//		System.out.println("myp_withdraw_finish()");
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		List<OTOVO> otoList = otoService.getOtoList(startRow, listLimit);



		model.addAttribute("otoList", otoList);
		return "mypage/myp_oto_breakdown";
	}
	

	@GetMapping("myp_oto_detail")
	public String mypOtoDetail(int OTO_num, Model model) {
		OTOVO oto = otoService.getOto(OTO_num);
		String otoDate = oto.getOTO_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String otoTheater = otoService.getTheaterName(oto.getTheater_num());

		model.addAttribute("otoTheater", otoTheater);
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_detail";
	}
	
	@GetMapping("myp_oto_modifyForm")
	public String mypOtoModifyForm(int OTO_num, Model model) {
		OTOVO oto = otoService.getOto(OTO_num);
		String otoDate = oto.getOTO_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String otoTheater = otoService.getTheaterName(oto.getTheater_num());

		model.addAttribute("otoTheater", otoTheater);
		model.addAttribute("otoDate", otoDate);
		model.addAttribute("oto", oto);
		return "mypage/myp_oto_modifyForm";
	}
	
	@PostMapping("myp_oto_modifyPro")
	public String myOtoModifyPro(int OTO_num, String OTO_content, Model model) {
		int updateCount = otoService.updateOto(OTO_num, OTO_content);
		if(updateCount == 0) {
			model.addAttribute("msg", "수정에 실패하였습니다");
			return "error/fail";
		}
		return "redirect:/myp_oto_breakdown";
	}
	
	@GetMapping("myp_oto_delete")
	public String myOtoDelete(int OTO_num, Model model) {
		int deleteOtoCount = otoService.deleteOto(OTO_num);
		if(deleteOtoCount == 0) {
			model.addAttribute("msg", "삭제 실패");
		}
		
		return "redirect:/myp_oto_breakdown";
	}
	
}
