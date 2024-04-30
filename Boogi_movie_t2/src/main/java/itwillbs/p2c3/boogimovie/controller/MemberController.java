package itwillbs.p2c3.boogimovie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.LoginProService;
import itwillbs.p2c3.boogimovie.service.PreRegMemberProService;
import itwillbs.p2c3.boogimovie.service.RegMemberProService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private RegMemberProService regMemberProService;
	@Autowired
	private PreRegMemberProService preRegMeberProService;
	@Autowired
	private LoginProService loginProService;
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
	public String memberRegComplete(MemberVO member, Model model) {
		System.out.println("member_reg_complete()");
		int insertCount = regMemberProService.regMember(member);
		
		if(insertCount < 1) {
			model.addAttribute("msg", "회원가입실패");
			return "error/fail";
		}
		
		model.addAttribute("member_name", member.getName());
		
		return "member/member_reg_complete";
	}
	
	@RequestMapping(value = "member_reg_member")
	public String memberRegMember(MemberVO inputMember, Model model) {
		System.out.println("member_reg_member()");
		boolean isRegistedMember = false;
		isRegistedMember = preRegMeberProService.IsRegisteredMember(inputMember);
		System.out.println("controller" + inputMember);
		if(isRegistedMember) {
			model.addAttribute("msg" , "이미 가입한 회원입니다.");
			model.addAttribute("targetURL" , "member_login");
			return "error/fail";
		}
		
		model.addAttribute("member", inputMember);
		
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
	public String memberLoginPro(MemberVO inputMember, HttpSession session, Model model) {
		System.out.println("memberLoginPro()");
		boolean isCorrectMember = false;
		isCorrectMember =  loginProService.isCorrectUser(inputMember);
		if(!isCorrectMember) {
			model.addAttribute("msg", "로그인 실패!");
			return "error/fail";
		}
		session.setAttribute("sId", inputMember.getId());
		
		return "./";
	}
	
	
	
}
