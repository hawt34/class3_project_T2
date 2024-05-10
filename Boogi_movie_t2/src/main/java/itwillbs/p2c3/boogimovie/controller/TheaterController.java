package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.TheaterFacilityVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService service;
	
	
	@GetMapping("theater")
	public String theater(Model model) {
		
		List<NoticeVO> noticeList = service.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		System.out.println(noticeList);
		
		
		return "theater/theater_main";
	}       
	 
	@GetMapping("theater_detail")
	public String theaterDetail(TheaterVO theater, TheaterFacilityVO facility, NoticeVO notice, Model model) {
		
		System.out.println("theater_num : " + theater.getTheater_num());
			
		theater = service.getTheater(theater);
		List<TheaterFacilityVO> facilityList = service.getFacility(facility);
		List<NoticeVO> theaterNoticeList = service.getTheaterNoticeList(notice);
		
		
		model.addAttribute("theater", theater);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("theaterNoticeList", theaterNoticeList);
		
		
		return "theater/theater_detail";
	}
}


