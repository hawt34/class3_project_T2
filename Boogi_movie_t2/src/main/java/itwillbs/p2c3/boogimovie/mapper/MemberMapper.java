package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	int insertMember(MemberVO member);
		
	MemberVO preRegMember(MemberVO member);
	
	MemberVO isCorrectMember(MemberVO member);
	
	MemberVO memberPwdSearch(MemberVO member);
	
//	MemberVO getMemberInfo(MemberVO member);
	
}
