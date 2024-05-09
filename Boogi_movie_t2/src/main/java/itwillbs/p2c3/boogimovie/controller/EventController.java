package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import itwillbs.p2c3.boogimovie.service.EventService;
import itwillbs.p2c3.boogimovie.vo.EventVO;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	// 이벤트 메인 페이지
		@GetMapping("event")
		public String eventMain(Model model) {
			List<EventVO> eventList = eventService.getEventList();
			model.addAttribute("eventList", eventList);
			
			return "event/event_main";
		}
	
	// 썸네일 클릭시 
		@GetMapping("eventDetail")
		public String eventDetail(EventVO event, Model model) {
			event = eventService.getEvent(event.getEvent_num());
			model.addAttribute("event", event);
			
			return "event/event_detail";
		}
}
