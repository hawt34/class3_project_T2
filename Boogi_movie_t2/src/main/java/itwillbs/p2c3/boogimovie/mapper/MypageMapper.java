package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Mapper
public interface MypageMapper {
	MemberVO selectMember (String id);
	MemberVO selectMainMember(String id);
	

}
