package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	//스토어 돈계산
	@PostMapping("storePay")
	 public String storePay(@RequestParam("category1") int category1,
             @RequestParam("snackNum") int snackNum,
             @RequestParam("category2") int category2,
             @RequestParam("snackPop") int snackPop,
             @RequestParam("category3") int category3,
             @RequestParam("snackJuice") int snackJuice,
             @RequestParam("category4") int category4,
             @RequestParam("snackCombo") int snackCombo,
             Model model) {
		model.addAttribute("category1", category1);
		model.addAttribute("snackNum", snackNum);
		model.addAttribute("category2", category2);
		model.addAttribute("snackPop", snackPop);
		model.addAttribute("category3", category3);
		model.addAttribute("snackJuice", snackJuice);
		model.addAttribute("category4", category4);
		model.addAttribute("snackCombo", snackCombo);

		System.out.println(category1 +""+ snackNum);
		return ""; 
	}
	
}
