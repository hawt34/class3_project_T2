package itwillbs.p2c3.boogimovie.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.PhoneAuthService;

@Controller
public class PhoneAuthController {
    @Autowired
    private PhoneAuthService phoneAuthService;

    @GetMapping("/phoneAuth")
    public String phoneAuthPage() {
        return "phoneAuth";
    }

    @PostMapping("/requestAuth")
    @ResponseBody
    public Map<String, Object> requestAuth(@RequestParam String phone, @RequestParam String name, @RequestParam String birth, @RequestParam int gender, @RequestParam String carrier) {
        return phoneAuthService.requestAuth(phone, name, birth, gender, carrier);
    }

    @PostMapping("/verifyAuth")
    @ResponseBody
    public Map<String, Object> verifyAuth(@RequestParam String impUid, @RequestParam String certification) {
        return phoneAuthService.verifyAuth(impUid, certification);
    }

}
