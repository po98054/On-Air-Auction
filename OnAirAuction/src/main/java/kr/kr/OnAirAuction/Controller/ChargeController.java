package kr.kh.onAirAuction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.pagination.PageMaker;
import kr.kh.onAirAuction.service.ChargeService;
import kr.kh.onAirAuction.vo.AuctionVO;
import kr.kh.onAirAuction.vo.ChargeVO;
import kr.kh.onAirAuction.vo.ProductVO;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargeService chargeservice;
	
	@RequestMapping(value = "/charge")
	public ModelAndView charge(ModelAndView mv) {		
		mv.setViewName("/charge/insert");	
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/charge/point", method = RequestMethod.POST)
	public String chargePoint(@RequestParam("ch_amount") int ch_amount,
			@RequestParam("ch_method") String ch_method,
			@RequestParam("ch_charge_date") String ch_charge_date) {
		ChargeVO chargeVO = new ChargeVO();
	    chargeVO.setCh_amount(ch_amount);
	    chargeVO.setCh_method(ch_method);
	    chargeVO.setCh_charge_date(ch_charge_date);
	    chargeservice.insertCharge(chargeVO);
	    return "redirect:/select/point";
	}

	@ResponseBody
	@RequestMapping(value = "/auction/getAmount", method=RequestMethod.GET)
	public String selectPoint(@RequestParam("ch_amount") int ch_amount) {
		ChargeVO vo = chargeservice.getPoint(ch_amount);
	    int amount = vo.getCh_amount();
		return String.valueOf(amount);
	}
	
}
