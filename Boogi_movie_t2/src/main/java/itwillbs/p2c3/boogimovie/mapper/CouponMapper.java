package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Mapper
public interface CouponMapper {
	List<CouponVO> selectCoupon(MemberVO member);
}
