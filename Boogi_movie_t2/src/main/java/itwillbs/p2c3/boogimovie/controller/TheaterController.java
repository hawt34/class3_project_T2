package itwillbs.p2c3.boogimovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;

import itwillbs.p2c3.boogimovie.service.TheaterService;
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
	public String theaterDetail(TheaterVO theater, Model model, @RequestParam(defaultValue = "") String name) {
		System.out.println("theaterDetail");
		
		System.out.println("name : " + name);
		
		theater.setTheater_id(name);
		
		theater = service.getTheater(theater);
		
		model.addAttribute("x", Double.parseDouble(theater.getTheater_map_x()));
		model.addAttribute("y", Double.parseDouble(theater.getTheater_map_y()));
		
		model.addAttribute("theater", theater);
		
//		System.out.println(theater);
		
		return "theater/theater_detail";
	}
}
