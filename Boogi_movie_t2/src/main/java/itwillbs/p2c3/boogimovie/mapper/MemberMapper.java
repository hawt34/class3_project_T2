package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.memberVO;

@Mapper
public interface MemberMapper {
	
	int insertMember(memberVO member);
		
	
}
