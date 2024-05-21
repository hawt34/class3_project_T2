package itwillbs.p2c3.boogimovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.MailService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.vo.MailAuthInfoVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private MailService mail_service;
	
	
	
	@ResponseBody
	@PostMapping("cerTel")
	public String celTel() {
		
		
		return "false";
	}
	
	@PostMapping("member_pwd_update")
	public String memberPwdUpdate(MemberVO member, Model model) {
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
		MemberVO outputMember = service.isCorrectUser(member);
		
		if(pwdEncoder.matches(member.getMember_pwd(), outputMember.getMember_pwd())) {
			model.addAttribute("msg", "입력한 패스워드가 이전 패스워드와 같습니다");
			return "error/fail";
		}
		
		boolean isUpdateSuccess = service.updateMemberPwd(member);
		
		if(!isUpdateSuccess) {
			model.addAttribute("msg", "비밀번호 변경 실패");
			return "error/fail";
		}
		
		model.addAttribute("msg", "비밀번호 변경 완료");
		model.addAttribute("targetURL", "./");
		
		return "error/fail";
		
	}
	@GetMapping("Member_email_auth")
	public String MemberEmailAuth(MailAuthInfoVO auth_info, Model model, HttpSession session) {
		MailAuthInfoVO db_auth_info = service.selectAuthInfo(auth_info);
		if(db_auth_info == null) {
			model.addAttribute("msg", "인증정보조회실패");
			return "error/fail";
		}
		
		session.setAttribute("auth_info", db_auth_info);
		
		return "redirect:/member_pwd_modify";
	}
		
		
	@GetMapping("member_pwd_modify")
	public String memberPwdModify(HttpSession session, Model model) {
		MailAuthInfoVO auth_info = (MailAuthInfoVO)session.getAttribute("auth_info");
		session.invalidate();
		boolean isDeleteSuccess = service.deleteAuthInfo(auth_info);
		if(!isDeleteSuccess) {
			model.addAttribute("msg", "인증 정보 삭제 실패");
			return "error/fail";
		}
		model.addAttribute("member_id", auth_info.getMember_id());
		
		return "member/member_pwd_search_result";
	}
	
	
	@PostMapping("member_search_pwd_pro")
	public String memberSearchPwdPro(MemberVO member, Model model, HttpSession session) {
		MemberVO outputMember = service.memberPwdSearch(member);
		//일치회원확인
		if(outputMember == null) {
			model.addAttribute("msg", "일치하는 회원이 없습니다");
			return "error/fail";
		}
		//메일보내기
		MailAuthInfoVO auth_info = mail_service.sendAuthMail(outputMember);
		
		if(auth_info == null) {
			model.addAttribute("msg", "인증메일 발송 실패");
			return "error/fail";
		}
			
		int send_count = service.insertAuthInfo(auth_info);
		if(send_count > 0) {
			
		}
		
		model.addAttribute("msg", "메일을 확인해주세요");
		model.addAttribute("targetURL", "./");
		
		return "error/fail";
	}
	
	
	
	
	
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
		//비밀번호 인코딩
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwd = member.getMember_pwd();
		member.setMember_pwd(pwdEncoder.encode(pwd));
		String addr = member.getPost_code() + "/" + member.getAddress1() + "/" + member.getAddress2();
		member.setMember_addr(addr);
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
		
		return "member/member_pwd_search_result";
	}
	
	@PostMapping("member_login_pro")
	public String memberLoginPro(MemberVO inputMember, HttpSession session, Model model) {
		
		MemberVO outputMember =  service.isCorrectUser(inputMember);
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		if(outputMember == null) {
			model.addAttribute("msg", "로그인 실패!");
			return "error/fail";
		}
		
		
		if(!pwdEncoder.matches(inputMember.getMember_pwd(), outputMember.getMember_pwd())) {
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
	public String memberSearchIdResultPro(MemberVO inputMember,HttpSession session, Model model) {
		MemberVO outputMember = service.memberIdSearch(inputMember);
		if(outputMember == null) {
			model.addAttribute("msg", "조회결과가 없습니다");
			return "error/fail";
		}
		
		session.setAttribute("member", outputMember);
		
		return "redirect:/member_search_id_result";
	}
	
	

	
	@PostMapping("Mytheater")
	public String myTheaterRegist() {
		
		return "redirect:/theater";
		
	}
	
	
	@GetMapping("TestAuth")
	public String testAuth() {
		return "member/member_phone_auth";
	}
	
	
}
