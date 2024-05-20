package itwillbs.p2c3.boogimovie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.ItemInfoService;
import itwillbs.p2c3.boogimovie.vo.CartItemVO;
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
	//스토어 장바구니 ajax관련해서 처리할꺼임. 한글이 자꾸 깨져서 온갖 삽질 다함. 
	private Map<String, CartItemVO> cart = new HashMap<>();
	@PostMapping(value = "add_to_cart",  produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    @ResponseBody
    public ResponseEntity<?> addToCart(@RequestParam String itemName, @RequestParam int itemPrice) {
		for (CartItemVO item : cart.values()) {
	        if (item.getItemName().equals(itemName)) {
	        	Map<String, String> response = new HashMap<>();
	            response.put("msg" ,"이미 장바구니에 담은 품목입니다.");
	            
	            return ResponseEntity.status(HttpStatus.CONFLICT).body(response);
	        }
	    }
	    
	    CartItemVO cartItem = new CartItemVO(itemName, itemPrice);
	    cart.put(itemName, cartItem);
	    
	    return ResponseEntity.ok().body(cartItem);
	}	
	
	
    //@PostMapping("remove_from_cart")
	@PostMapping(value = "remove_from_cart", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
	@ResponseBody
    public ResponseEntity<?> removeFromCart(@RequestParam String itemName) {
        // 장바구니에서 상품 제거
        cart.remove(itemName);
        Map<String, String> response = new HashMap<>();
        response.put("message", "장바구니에서 상품이 제거되었습니다.");
        
        return ResponseEntity.ok().body(response);
	}
    
    
	
}
