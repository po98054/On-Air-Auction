package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.AuctionService;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService auctionservice;
	
	//경매 등록
	@RequestMapping(value="/auction/insert", method=RequestMethod.GET)
	public ModelAndView product(ModelAndView mv, Integer au_pr_code) {
		au_pr_code = au_pr_code == null ? 0 : au_pr_code;
		System.out.println(au_pr_code);
		mv.addObject("au_pr_code", au_pr_code);
		mv.setViewName("/auction/insert");	
		return mv;
	}
	
    @RequestMapping(value="/auction/insert", method=RequestMethod.POST)
	public ModelAndView insertAuctionPOST(ModelAndView mv, AuctionVO auction){
    	auctionservice.insertAuction(auction);
    	mv.setViewName("redirect:/auction/list");
		return mv;
	}
    
    // 경매 등록 리스트
    @RequestMapping(value="/auction/list", method=RequestMethod.GET)
    public ModelAndView auctionList(ModelAndView mv, Criteria cri) {
    	ArrayList<AuctionVO> list = auctionservice.getAuctionList(cri);
		int totalCount = auctionservice.getAuctionTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list",list);
		mv.addObject("pm", pm);
		mv.setViewName("/auction/list");
		return mv;
	}
    
    //경매 상세 페이지
    @RequestMapping(value="/auction/detail/{au_num}", method=RequestMethod.GET)
    public ModelAndView  auctionDetail(ModelAndView mv, 
    		@PathVariable("au_num") int au_num) {
    	AuctionVO vo = auctionservice.getAuction(au_num);
    	mv.setViewName("/auction/detail");
    	 if(vo.getAu_ac_num() == 1) {
    	        mv.setViewName("/auctioncategory/general");
    	    } else if(vo.getAu_ac_num() == 2) {
    	        mv.setViewName("/auctioncategory/onair");
    	    }
    	 
    	return mv;
    }
        
    
}
