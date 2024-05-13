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
	 public String storePay(@RequestParam("category1_snack") int category1_snack,  @RequestParam("snackNum") int snackNum,
             				@RequestParam("category2_pop") int category2_pop,  @RequestParam("snackPop") int snackPop,
             				@RequestParam("category3_juice") int category3_juice,  @RequestParam("snackJuice") int snackJuice,
             				@RequestParam("category4_combo") int category4_combo,  @RequestParam("snackCombo") int snackCombo,   Model model) {
		model.addAttribute("snack", category1_snack);
		model.addAttribute("snackNum", snackNum);
		model.addAttribute("pop", category2_pop);
		model.addAttribute("snackPop", snackPop);
		model.addAttribute("juice", category3_juice);
		model.addAttribute("snackJuice", snackJuice);
		model.addAttribute("combo", category4_combo);
		model.addAttribute("snackCombo", snackCombo);

		//System.out.println(category1_snack +""+ snackNum);데이터 확인완료
		//System.out.println(category2_pop +""+ snackPop);
		//나중에 결제페이지 연결하면 됨.
		return "store/storePay"; 
	}
	
	
	@GetMapping("payment_store")
	public String paymentStore() {
		
		return "payment/payment_store";
	}
	
	
}
