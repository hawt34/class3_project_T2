package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.CouponMapper;
import itwillbs.p2c3.boogimovie.vo.CouponVO;

@Service
public class CouponService {

	@Autowired
	private CouponMapper mapper;
	
	public List<CouponVO> getCoupon() {
		System.out.println("couponservice");
		return mapper.selectCoupon();
	}
}
