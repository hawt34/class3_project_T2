package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MemberMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
@Service
public class LoginProService {
	@Autowired
	private MemberMapper mapper;
	
	public boolean isCorrectUser(MemberVO inputMember) {
		boolean isCorrectMember = false;
		MemberVO outputMember = mapper.isCorrectMember(inputMember);
		System.out.println(outputMember);
		System.out.println(isCorrectMember);
		
		if(outputMember != null) {
			isCorrectMember = true;
		}
		
		
		
		return isCorrectMember;
		 
	}
}
