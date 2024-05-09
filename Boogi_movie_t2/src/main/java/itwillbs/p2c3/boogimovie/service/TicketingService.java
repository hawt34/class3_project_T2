package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TicketingMapper;
import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;

@Service
public class TicketingService {
	
	@Autowired
	private TicketingMapper mapper;

//	public List<ScreenInfoVO> getScreenInfo() {
//		return mapper.selectScreenInfo();
//	}
	

}
