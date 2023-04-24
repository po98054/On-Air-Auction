package kr.kh.onAirAuction.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.pagination.PageMaker;
import kr.kh.onAirAuction.service.AuctionService;
import kr.kh.onAirAuction.vo.AuctionTypeVO;
import kr.kh.onAirAuction.vo.AuctionVO;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService auctionservice;
	//경매 등록
    @RequestMapping(value="/auction", method=RequestMethod.POST)
	public String insertAuction(AuctionVO auction){
    	auctionservice.insertAuction(auction);
		return "redirect:/auction/list";
	}
    
    // 상품 리스트
    @RequestMapping(value="/auction/list", method=RequestMethod.GET)
    public ModelAndView auctionList(ModelAndView mv, Criteria cri, AuctionTypeVO ac_name) {
    	ArrayList<AuctionVO> list = auctionservice.getAuctionList(cri);
		int totalCount = auctionservice.getBoardTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list",list);
		mv.addObject("pm", pm);
		mv.setViewName("/auction/list");
		return mv;
	}
}
