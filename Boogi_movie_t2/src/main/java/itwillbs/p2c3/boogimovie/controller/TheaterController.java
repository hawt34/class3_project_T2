package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.TheaterFacilityVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService service;
	
	
	@GetMapping("theater")
	public String theater() {
		System.out.println("theater");
		
		return "theater/theater_main";
	}       
	
	@GetMapping("theater_detail")
	public String theaterDetail(TheaterVO theater, TheaterFacilityVO facility, Model model, @RequestParam(defaultValue = "1") int theater_num) {
		System.out.println("theaterDetail");
		
		System.out.println("theater_num : " + theater_num);
		
		theater.setTheater_num(theater_num);
		facility.setTheater_num(theater_num);
		
		theater = service.getTheater(theater);
		List<TheaterFacilityVO> facilityList = service.getFacility(facility);
		
		model.addAttribute("x", Double.parseDouble(theater.getTheater_map_x()));
		model.addAttribute("y", Double.parseDouble(theater.getTheater_map_y()));
		
		model.addAttribute("theater", theater);
		model.addAttribute("facilityList", facilityList);
		
		
		return "theater/theater_detail";
	}
}
