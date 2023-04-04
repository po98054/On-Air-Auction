package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.Pagination.PageMaker;

import kr.kr.OnAirAuction.Service.MyPageService;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

@Controller
@RestController
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	// 구매자 -> 경매 참가 내역 (일반/실시간 경매)
	
	@RequestMapping(value = "/MyPage/participateAuctionList")
	public ModelAndView ParticipateAuctionList(ModelAndView mv, Criteria criteria) {
		
		ArrayList<ParticipateAuctionVO> list = myPageService.getPartAuctList(criteria);
		
		int totalCount = myPageService.getPartAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/participateAuctionList");
		
		return mv;
		
	}
	
	// 구매자 -> 경매 개최 내역
	
	@RequestMapping(value = "/MyPage/heldAuctionList")
	public ModelAndView HeldAcutionList(ModelAndView mv, Criteria criteria) {
		
		ArrayList<HeldAuctionVO> list = myPageService.getHeldAuctList(criteria);
		
		int totalCount = myPageService.getHeldAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		System.out.println(list);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/heldAuctionList");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/AuctionCancle/insert", method = RequestMethod.POST)
	public Map<String, Object> AuctionCancleInsert(@RequestBody AuctionCancleVO auctionCancle, HeldAuctionVO held){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = myPageService.insertAuctionCancle(auctionCancle);

		map.put("result", res);
		
		System.out.println(res);
		
		return map;
		
	}
	
}