package kr.kh.onAirAuction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onAirAuction.service.ChargeService;
import kr.kh.onAirAuction.vo.ChargeVO;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargeService chargeservice;
	
	@ResponseBody
	@RequestMapping(value = "/charge/point", method = RequestMethod.POST)
	public String chargePoint(@RequestParam("ch_amount") int ch_amount,
			@RequestParam("ch_method") String ch_method) {
		ChargeVO chargeVO = new ChargeVO();
	    chargeVO.setCh_amount(ch_amount);
	    chargeVO.setCh_method(ch_method);
	    chargeservice.insertCharge(chargeVO);
	    return "redirect:/select/point";
	}
	
	@ResponseBody
	@RequestMapping(value = "/select/point", method = RequestMethod.GET)
	public String chargePoint(@RequestParam("ch_amount") int ch_amount) {
		ChargeVO chargeVO = new ChargeVO();
	    chargeVO.setCh_amount(ch_amount);
	    chargeservice.selectCharge(chargeVO);
	    return "redirect:/main/home";
	}
	
}
