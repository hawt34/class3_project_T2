package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Mapper
public interface PaymentMapper {

	MemberVO getMember(MemberVO member);

	int usePoint(MemberVO member);

}
