package itwillbs.p2c3.boogimovie.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.InfoModifyService;
import itwillbs.p2c3.boogimovie.service.OtoService;
import itwillbs.p2c3.boogimovie.vo.OTOVO;

@Controller
public class MypageController {
	
	@Autowired
	private InfoModifyService infoModifyService;
	
	@Autowired
	private OtoService otoService;
	
	
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
	
	//csc 관련 List
	@RequestMapping(value = "myp_oto_breakdown", method = {RequestMethod.POST, RequestMethod.GET})
	public String mypOtoBreakdown(Model model, @RequestParam(defaultValue = "1")int pageNum) {
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
	
	
}
