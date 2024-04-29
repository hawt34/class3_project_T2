package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping("member_pre_reg_member")
	public String memberPreRegMember() {
		System.out.println("member_pre_reg_member()");
		
		
		return "member/member_pre_reg_member";
	}
	
	@GetMapping("member_reg_complete")
	public String memberRegComplete() {
		System.out.println("member_reg_complete()");
		
		
		return "member/member_reg_complete";
	}
	
	@GetMapping("member_reg_member")
	public String memberRegMember() {
		System.out.println("member_reg_member()");
		
		
		return "member/member_reg_member";
	}
	
	
	
	
}
