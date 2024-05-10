package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import itwillbs.p2c3.boogimovie.service.ItemInfoService;
import itwillbs.p2c3.boogimovie.vo.ItemInfoVO;


@Controller
public class StoreController {
	@Autowired
	private ItemInfoService service;
	@GetMapping("boogi_store")
	public String store(Model model, ItemInfoVO item) {
		List<ItemInfoVO> itemInfoSnack = service.getItemListSnack();
		model.addAttribute("itemInfoSnack", itemInfoSnack);
		//System.out.println("스낵들아 가즈아" +itemInfoSnack); 카테고리 스낵들 확인완료
		
		List<ItemInfoVO> itemInfoCombo = service.getItemListCombo();
		model.addAttribute("itemInfoCombo", itemInfoCombo);
		//System.out.println("콤보들아 가즈아" + itemInfoCombo); 카테고리 콤보들 확인완료
		
		List<ItemInfoVO> itemInfoPop = service.getItemListPop();
		model.addAttribute("itemInfoPop", itemInfoPop);
		//System.out.println("팝콘들아 가즈아" + itemInfoPop); 카테고리 팝콘들 확인
		
		List<ItemInfoVO> itemInfoJuice = service.getItemListJuice();
		model.addAttribute("itemInfoJuice", itemInfoJuice);
		//System.out.println("음료들아 가즈아" + itemInfoJuice); 카테고리 음료들 확인완료
		
		
		
		return "store/boogi_store";
	}
}
