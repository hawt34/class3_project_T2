package itwillbs.p2c3.boogimovie.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.EventService;
import itwillbs.p2c3.boogimovie.vo.EventTypeVO;
import itwillbs.p2c3.boogimovie.vo.EventVO;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	// 이벤트 메인 페이지
		@GetMapping("event")
		public String eventMain(Model model) {
			List<EventVO> eventList = eventService.getEventList();
			List<EventTypeVO> eventTypeList = eventService.getEventTypeList();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			for(EventVO event : eventList) {
		        event.setEvent_start(dateFormat.format(event.getEvent_start_date()));
		        event.setEvent_end(dateFormat.format(event.getEvent_end_date()));
		    }
			
			model.addAttribute("eventList", eventList);
			model.addAttribute("eventTypeList", eventTypeList);
			return "event/event_main";
		}
		
		@ResponseBody
		@GetMapping("eventType")
		public List<EventVO> eventType(@RequestParam String eventType) {
			System.out.println("eventType: " + eventType);
			List<EventVO> eventList = eventService.getEventList();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			List<EventVO> movieEventList = new ArrayList<EventVO>();
			List<EventVO> theaterEventList = new ArrayList<EventVO>();
			List<EventVO> discountEventList = new ArrayList<EventVO>();
			
			for(EventVO event : eventList) {
				String formattedStartDate = dateFormat.format(event.getEvent_start_date());
				String formattedEndDate = dateFormat.format(event.getEvent_end_date());
		        event.setEvent_start(formattedStartDate);
		        event.setEvent_end(formattedEndDate);
		        
				if(event.getEvent_type_num() == 1) {
					movieEventList.add(event);
				} else if(event.getEvent_type_num() == 2) {
					theaterEventList.add(event);
				} else if(event.getEvent_type_num() == 3) {
					discountEventList.add(event);
				}
			}
			
			if(eventType.equals("0")) {
				System.out.println("eventList로 간다 : " + eventList);
				return eventList;
			} else if(eventType.equals("1")) {
				System.out.println("movieEventList로 간다 : " +movieEventList);
				return movieEventList;
			} else if(eventType.equals("2")) {
				System.out.println("theaterEventList로 간다 : " + theaterEventList);
				return theaterEventList;
			} else {
				System.out.println("discountEventList로 간다 : " + discountEventList);
				return discountEventList;
			}
		}
		
	
	// 썸네일 클릭시 
		@GetMapping("eventDetail")
		public String eventDetail(EventVO event, Model model) {
			event = eventService.getEvent(event.getEvent_num());
			model.addAttribute("event", event);
			
			return "event/event_detail";
		}
}
