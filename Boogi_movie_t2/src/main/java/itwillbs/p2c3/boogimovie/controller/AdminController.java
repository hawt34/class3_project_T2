package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {


	@GetMapping("admin_reserve")
	public String adminReserve() {
		return "admin/admin_member/admin_reserve";
	}
	@GetMapping("admin_moviePlan")
	public String adminMoviePlan() {
		return "admin/admin_movie/admin_moviePlan";
	}
	@GetMapping("admin_movie")
	public String adminMovie() {
		return "admin/admin_movie/admin_movie";
	}
	@GetMapping("admin_member")
	public String adminMember() {
		return "admin/admin_member/admin_member";
	}
	
}
