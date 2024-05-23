package itwillbs.p2c3.boogimovie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MypageService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.EventVO;
import itwillbs.p2c3.boogimovie.vo.FeeAgeVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
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
	
	
	
	
	
	
	@GetMapping("theater")
	public String theater(Model model, TheaterVO theater, MemberVO member, HttpSession session, EventVO event) {
		// 로그인한 경우
		String sId = (String)session.getAttribute("sId");
		
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
		List<EventVO> eventList = service.getTheaterEventList();
		
		
		JsonArray jsonList = new JsonArray();
		
		for(TheaterVO theater1  : theaterList) {
			JsonObject json = new JsonObject();
			json.addProperty("theater_name", theater1.getTheater_name());
			json.addProperty("map_x", theater1.getTheater_map_x());
			json.addProperty("map_y", theater1.getTheater_map_y());
			jsonList.add(json);
			System.out.println(json);
		}
		
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("eventList", eventList);
		model.addAttribute("mapTheater", jsonList.toString());
		
		
				
		return "theater/theater_main";
	}       
	 
	@GetMapping("theater_detail")
	public String theaterDetail(TheaterVO theater, TheaterFacilityVO facility, NoticeVO notice, MemberVO member, Model model, HttpSession session) {
		
		// 로그인한 경우
		String sId = (String)session.getAttribute("sId");
		if(sId != null) {
			member.setMember_id(sId);
			member = mypageService.getDbMember(member);
			model.addAttribute("member", member);
		}
		
		List<TheaterVO> theaterList = service.getTheater();
		theater = service.getTheater(theater);
		List<TheaterFacilityVO> facilityList = service.getFacility(facility);
		List<NoticeVO> theaterNoticeList = service.getTheaterNoticeList(notice);
		List<FeeAgeVO> feeList = service.getFeeList();
		
		Map<String, Integer> feeMap = new HashMap<String, Integer>();
		for(FeeAgeVO fee : feeList) {
			int price = 15000;
			String keyword = "";
			keyword += fee.getFee_dimension_keyword();
			price *= fee.getFee_dimension_discount() / 100.0;
			keyword += fee.getFee_day_keyword();
			price *= fee.getFee_day_discount() / 100.0;
			keyword += fee.getFee_time_keyword();
			price *= fee.getFee_time_discount() / 100.0;
			keyword += fee.getFee_age_keyword();
			price *= fee.getFee_age_discount() / 100.0;
			// 반내림 계산
            price = (int) (Math.floor(price / 500.0) * 500);
			feeMap.put(keyword, price);
			
		}
		
		model.addAttribute("theater", theater);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("theaterNoticeList", theaterNoticeList);
		JSONObject json = new JSONObject(feeMap);
        model.addAttribute("feeMap", json.toString());
		
		
		return "theater/theater_detail";
	}
	
	
	
	@GetMapping("theater_test")
	public String theaterTest() {
		return "theater/theater_test";
	}
	
	
	
	
}


