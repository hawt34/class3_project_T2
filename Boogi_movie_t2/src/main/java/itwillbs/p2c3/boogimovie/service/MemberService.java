package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MemberMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	public boolean isCorrectUser(MemberVO inputMember) {
		boolean isCorrectMember = false;
		MemberVO outputMember = mapper.isCorrectMember(inputMember);
//		MemberVO outputMember = mapper.getMemberInfo(inputMember);
		System.out.println(outputMember);
		System.out.println(isCorrectMember);
		
		if(outputMember != null) {
			isCorrectMember = true;
		}
		
		
		
		return isCorrectMember;
		 
	}
	
	public MemberVO memberIdSearch(MemberVO inputMember) {
		MemberVO outputMember = mapper.preRegMember(inputMember);
//		MemberVO outputMember = mapper.getMemberInfo(inputMember);
		if(outputMember == null) {
			outputMember = new MemberVO();
		}
		
		return outputMember;
	}
	
	public boolean IsRegisteredMember(MemberVO inputMember) {
		MemberVO outputMember = mapper.preRegMember(inputMember);
//		MemberVO outputMember = mapper.getMemberInfo(inputMember);
		boolean isRegistedMember = false;
		System.out.println("outputMember : " + outputMember);
		System.out.println("service " + inputMember);
		
		if(outputMember != null) {
			isRegistedMember = true;
		}
		
		
		return isRegistedMember;
	}
	
	public int regMember(MemberVO member) {
		System.out.println("service들어옴");
		
		
		
		
		return mapper.insertMember(member); 
	}
	
//	public MemberVO memberPwdSearch(MemberVO inputMember) {
//		System.out.println("memberPwdSearch()");
//		
//		return mapper.getMemberInfo(inputMember);
//	}
	
//	public boolean memberPwdUpdate() {
//		
//	}
	
	
	public String movieGenreSearch(String sId) {
		
		return mapper.memberMovieGenreSearch(sId);
	}
	
	
	public MemberVO selectTheatersMyTheater(String sId) {
		
		return mapper.selectTheatersMyTheater(sId);
	}
}
