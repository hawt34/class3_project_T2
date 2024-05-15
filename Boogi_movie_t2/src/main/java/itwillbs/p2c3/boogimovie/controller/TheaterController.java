package itwillbs.p2c3.boogimovie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import itwillbs.p2c3.boogimovie.service.EventService;
import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MypageService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.EventVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MyTheaterVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.TheaterFacilityVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private EventService eventService;
	
	
	
	
	
	@GetMapping("theater")
	public String theater(Model model, TheaterVO theater, MemberVO member, HttpSession session, EventVO event) {
		// 로그인한 경우
		String sId = (String)session.getAttribute("sId");
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+sId);
		if(sId != null) {
			member.setMember_id(sId);
			member = mypageService.getMyTheater(member);
			model.addAttribute("member", member);
		}
		
		// 극장 카테고리 공지사항 리스트 조회
		List<NoticeVO> noticeList = service.getNoticeList();
		// 극장 전체 리스트 조회
		List<TheaterVO> theaterList = service.getTheater();
		// 극장 이벤트 조회
		List<EventVO> eventList = eventService.getEventList();
		
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("eventList", eventList);
				
		return "theater/theater_main";
	}       
	 
	@GetMapping("theater_detail")
	public String theaterDetail(TheaterVO theater, TheaterFacilityVO facility, NoticeVO notice, MemberVO member, Model model, HttpSession session) {
		
		// 로그인한 경우
		String sId = (String)session.getAttribute("sId");
		if(sId != null) {
			member.setMember_id(sId);
			member = mypageService.getMyTheater(member);
			model.addAttribute("member", member);
		}
		
		List<TheaterVO> theaterList = service.getTheater();
		theater = service.getTheater(theater);
		List<TheaterFacilityVO> facilityList = service.getFacility(facility);
		List<NoticeVO> theaterNoticeList = service.getTheaterNoticeList(notice);
		
		model.addAttribute("theater", theater);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("theaterNoticeList", theaterNoticeList);
		
		
		
		return "theater/theater_detail";
	}
	
//	@PostMapping("")
//	public String 
//	
	
	
	
	
}


