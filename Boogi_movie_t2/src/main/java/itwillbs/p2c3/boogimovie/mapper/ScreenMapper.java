package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;

@Mapper
public interface ScreenMapper {
	
	// 전체 상영관 리스트 조회 
	List<ScreenInfoVO> selectScreenInfo();
	
	
	
	
}
