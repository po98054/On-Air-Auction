package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Service.ChargeService;
import kr.kr.OnAirAuction.VO.ChargeVO;

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
	@RequestMapping(value = "/charge/insert", method = RequestMethod.POST)
	public String chargePoint(@RequestParam("ch_amount") int ch_amount,
			@RequestParam("ch_method") String ch_method,
			@RequestParam("ch_charge_date") Date ch_charge_date) {
		ChargeVO chargeVO = new ChargeVO();
	    chargeVO.setCh_amount(ch_amount);
	    chargeVO.setCh_method(ch_method);
	    chargeVO.setCh_charge_date(ch_charge_date);
	    chargeservice.insertCharge(chargeVO);
	    return "redirect:/charge/point";
	}
	
	@RequestMapping(value = "/charge/point", method=RequestMethod.GET)
	public ModelAndView selectPoint(ModelAndView mv, ChargeVO charge) {
		ArrayList<ChargeVO> list = chargeservice.getPoint(charge);
		mv.addObject("list",list);
		mv.setViewName("/charge/point");
		return mv;
	}

	
}
