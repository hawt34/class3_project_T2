package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import itwillbs.p2c3.boogimovie.mapper.EventMapper;
import itwillbs.p2c3.boogimovie.vo.EventTypeVO;
import itwillbs.p2c3.boogimovie.vo.EventVO;

@Service
public class EventService {

	@Autowired
	private EventMapper mapper;
	
	public List<EventVO> getEventList() {
		
		return mapper.selectEventList();
	}
	
	public EventVO getEvent(int event_num) {
		
		return mapper.selectEvent(event_num);
	}
	
	public List<EventTypeVO> getEventTypeList() {
		return mapper.getEventTypeList();
	}
}
