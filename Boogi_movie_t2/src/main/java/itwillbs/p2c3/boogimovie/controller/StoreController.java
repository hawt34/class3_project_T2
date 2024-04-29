package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class StoreController {
	@GetMapping("boogi_store")
	public String store() {
		
		return "store/boogi_store";
	}
}
