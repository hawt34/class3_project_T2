package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.ScreenMapper;
import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;

@Service
public class ScreenService {
	
	@Autowired
	private ScreenMapper mapper;
	
	
	
	// 전체 상영관 리스트 조회 
	public List<ScreenInfoVO> getScreenInfo() {
		return mapper.selectScreenInfoList();
	}


	// 상영관 정보 조회 
	public ScreenInfoVO getScreenInfo(ScreenInfoVO screenInfo) {
		return mapper.selectScreeninfo(screenInfo);
	}


	public int modifyScreenInfo(ScreenInfoVO screenInfo) {
		return mapper.updateScreeninfo(screenInfo);
	}
	
	
	
	
	

}
