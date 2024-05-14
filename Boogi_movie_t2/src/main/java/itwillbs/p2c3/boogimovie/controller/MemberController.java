package itwillbs.p2c3.boogimovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
//	@PostMapping("member_search_pwd_pro")
//	public String memberSearchPwdPro(MemberVO member, Model model, HttpSession session) {
//		System.out.println("memberSearchPwdPro()");
//		
//		MemberVO outputMember = service.memberPwdSearch(member);
//		
//		if(outputMember.getMember_pwd().equals("")) {
//			model.addAttribute("msg", "일치하는 회원이 없습니다");
//			return "error/fail";
//		}
//		
//		session.setAttribute("member", outputMember);
//		
//		return "redirect:/member_search_pwd_result";
//	}
	
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
	public String memberPwdSearch1() {
		
		return "member/member_pwd_search";
	}
	
	@PostMapping("member_search_pwd")
	public String memberPwdSearch(MemberVO member,Model model) {
		System.out.println("member_search_pwd()");
		model.addAttribute("member_id", member.getMember_id());
		
		
		return "member/member_pwd_search";
	}
	
	@RequestMapping(value = "member_pre_reg_member", method = {RequestMethod.GET ,RequestMethod.POST})
	public String memberPreRegMember() {
		System.out.println("member_pre_reg_member()");
		
		
		return "member/member_pre_reg_member";
	}
	
	@PostMapping("member_reg_member_pro")
	public String memberRegComplete(MemberVO member, HttpSession session, Model model) {
		System.out.println("member_reg_complete()");
		int insertCount = service.regMember(member);
		
		if(insertCount < 1) {
			model.addAttribute("msg", "회원가입실패");
			return "error/fail";
		}
		
		session.setAttribute("sId", member.getMember_id());
		session.setAttribute("member", member);
		
		return "redirect:/member_reg_member_complete";
	}
	
	@RequestMapping(value = "member_reg_member")
	public String memberRegMember(MemberVO inputMember, Model model) {
		System.out.println("member_reg_member()");
		System.out.println("controller" + inputMember);
		boolean isRegistedMember = false;
		isRegistedMember = service.IsRegisteredMember(inputMember);
		
		if(isRegistedMember) {
			model.addAttribute("msg" , "이미 가입한 회원입니다.");
			model.addAttribute("targetURL" , "member_login");
			return "error/fail";
		}
		
		model.addAttribute("member", inputMember);
		
		return "member/member_reg_member";
	}
		
		
		
	
	@GetMapping("member_search_id_result")
	public String memberIdSearchResult(Model model, HttpSession session) {
		System.out.println("memberIdSearchResult()");
		MemberVO member = (MemberVO)session.getAttribute("member");
		session.removeAttribute("member");
		String replaceMemberId = 
				member.getMember_id()
				.substring(0, member.getMember_id().length() - 5) + "****" 
						+ member.getMember_id()
						.substring(member.getMember_id().length() - 1);
		model.addAttribute("replaceMemberId", replaceMemberId);
		model.addAttribute("memberId", member.getMember_id());
		
		return "member/member_id_search_result";
		
	}
	
	@GetMapping("member_search_pwd_result")
	public String memberPwdSearchResult(HttpSession session, Model model) {
		System.out.println("memberPwdSearchResult()");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_id = member.getMember_id();
		model.addAttribute("member_id", member_id);
		
		return "member/member_pwd_search_result";
	}
	
	@PostMapping("member_login_pro")
	public String memberLoginPro(MemberVO inputMember, HttpSession session, Model model) {
		System.out.println("Controller inputMember : " + inputMember);
		boolean isCorrectMember = false;
		isCorrectMember =  service.isCorrectUser(inputMember);
		if(!isCorrectMember) {
			model.addAttribute("msg", "로그인 실패!");
			return "error/fail";
		}
		
		session.setAttribute("sId", inputMember.getMember_id());
		System.out.println(session.getAttribute("sId"));
		return "redirect:/movie";
	}
	
	@GetMapping("member_logout_pro")
	public String memberLogoutPro(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃 완료");
		model.addAttribute("targetURL", "./");
		return "error/fail";
	}
	
	
	@GetMapping("member_reg_member_complete")
	public String memberRegMemberComplete(HttpSession session, Model model) {
		System.out.println("회원가입처리완료");
		MemberVO member = (MemberVO)session.getAttribute("member");
		session.removeAttribute("member");
		model.addAttribute("member_name",member.getMember_name());
			
		
		
		return "member/member_reg_complete";
	}
	
	@PostMapping("member_search_id_result_pro")
	public String memberSearchIdResultPro(MemberVO inputMember,HttpSession session) {
		MemberVO outputMember = service.memberIdSearch(inputMember);
		
		
		session.setAttribute("member", outputMember);
		
		
		
		return "redirect:/member_search_id_result";
	}
	
	
//	@PostMapping("member_pwd_update")
//	public String memberPwdInsert() {
//		
//	}
	
	
	
	
	
	
	@PostMapping("Mytheater")
	public String myTheaterRegist() {
		
		
		
		
		return "redirect:/theater";
		
	}
	
	
	
}
