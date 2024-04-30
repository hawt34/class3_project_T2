package itwillbs.p2c3.boogimovie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.PreRegMemberProService;
import itwillbs.p2c3.boogimovie.service.RegMemberProService;
import itwillbs.p2c3.boogimovie.vo.memberVO;

@Controller
public class MemberController {
	
	@Autowired
	private RegMemberProService regMemberProService;
	
	
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
	public String memberRegComplete(memberVO member, Model model, HttpServletResponse response) {
		System.out.println("member_reg_complete()");
		
		int insertCount = regMemberProService.regMember(member);
		
		
		if(insertCount < 1) {
			model.addAttribute("msg", "회원가입 실패");
			
			return "error/fail";
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입성공');");
			out.print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
		
		model.addAttribute("member", member);
		
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
	
	@PostMapping("LoginPro")
	public String memberLoginPro(memberVO member) {
		System.out.println("memberLoginPro()");
		boolean isCorrectMember = false; 
		
		
		return "/";
	}
	
	
	
}
