package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;


@Controller
public class MovieController {
	@Autowired
	private MovieInfoService service;
	
	@GetMapping("movie")
	public String movie(Model model , HttpSession session,MemberVO member) {
		System.out.println("현재 아이디" + member.getMember_id());
		List<MovieVO> movieInfo = service.getMovieList();
		model.addAttribute("movieInfo", movieInfo);
		String member_id = (String) session.getAttribute("sId");
		//System.out.println("현재로그인한 " +member_id);
		model.addAttribute("member_id", member_id);
		//System.out.println(movieInfo);
		return "movie/movie";
	}
	
	

}
