package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TicketingMapper;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Service
public class TicketingService {
	
	@Autowired
	private TicketingMapper mapper;

	public ScreenSessionVO finalListSelect(ScreenSessionVO scs) {
		return mapper.fianlListSelect(scs);
	}
}	
