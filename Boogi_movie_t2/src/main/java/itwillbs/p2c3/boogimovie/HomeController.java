package itwillbs.p2c3.boogimovie;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.ReviewService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private MovieInfoService movieService;
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model , HttpSession session,MemberVO member) {
		System.out.println("현재 아이디" + member.getMember_id());
		List<MovieVO> movieInfo = movieService.getMovieList();
		model.addAttribute("movieInfo", movieInfo);
		String member_id = (String) session.getAttribute("sId");
		//System.out.println("현재로그인한 " +member_id);
		model.addAttribute("member_id", member_id);
		//System.out.println(movieInfo);
		return "movie/movie";
	}
<<<<<<< HEAD
}
=======
}

//	@GetMapping("movieFuture")// 상영예정작리스트
//	public String movieFuture(Model model) {
//		
//		List<MovieVO> movieFuture = movieService.getMovieFuture();
//		model.addAttribute("movieFuture", movieFuture);
//		//System.out.println("여기는 무비퓨처" + movieFuture);확인완료
//	    return "movie/movieFuture";
//	}

//}
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
