package itwillbs.p2c3.boogimovie.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.VO.memberVO;
import itwillbs.p2c3.boogimovie.service.PreRegMemberProService;

@Controller
public class MemberController {
	
	@GetMapping("member_login")
	public String memberLogin() {
		System.out.println("MemberLogin()");
			
			
		return "member/member_login";
	}
	
	@GetMapping("member_search_id")
	public String memberIdSearch() {
		System.out.println("member_search_id()");
			
			
		return "member/member_id_search";
	}
	
	@GetMapping("member_search_pwd")
	public String memberPwdSearch() {
		System.out.println("member_search_pwd()");
		
		
		return "member/member_pwd_search";
	}
	
	@RequestMapping(value = "member_pre_reg_member", method = {RequestMethod.GET ,RequestMethod.POST})
	public String memberPreRegMember() {
		System.out.println("member_pre_reg_member()");
		
		
		return "member/member_pre_reg_member";
	}
	
	@PostMapping("member_reg_complete")
	public String memberRegComplete() {
		System.out.println("member_reg_complete()");
		
		
		return "member/member_reg_complete";
	}
	
	@PostMapping(value = "member_reg_member")
	public String memberRegMember(memberVO member, Model model, HttpServletRequest request) {
		System.out.println("member_reg_member()");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(member == null) {
			model.addAttribute("msg", "가입 여부를 확인해주세요.");
			model.addAttribute("targetURL", "member_pre_reg_member");
			return "error/fail";
		}
		
		PreRegMemberProService service = new PreRegMemberProService();
		boolean IsRegisteredMember = service.IsRegisteredMember(member);
		
		if(IsRegisteredMember) {
			model.addAttribute("msg", "이미 가입한 회원입니다.");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		
		
		
		return "member/member_reg_member";
	}
	
	@PostMapping("member_search_id_result")
	public String memberIdSearchResult() {
		System.out.println("memberIdSearchResult()");
		
		return "member/member_id_search_result";
	}
	
	@PostMapping("member_search_pwd_result")
	public String memberPwdSearchResult() {
		System.out.println("memberPwdSearchResult()");
		
		return "member/member_pwd_search_result";
	}
	
	
	
	
	
	
}
