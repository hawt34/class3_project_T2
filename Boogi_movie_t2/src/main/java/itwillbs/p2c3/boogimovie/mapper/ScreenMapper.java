package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;

@Mapper
public interface ScreenMapper {
	
	// 전체 상영관 리스트 조회 
	List<ScreenInfoVO> selectScreenInfoList();
	
	// 상영관 정보 조회 
	ScreenInfoVO selectScreeninfo(ScreenInfoVO screenInfo);

	// 상영관 정보 수정
	int updateScreeninfo(ScreenInfoVO screenInfo);
	
	// 새 상영관 등록
	int insertScreeninfo(ScreenInfoVO screenInfo);
	
	
	
	
}
