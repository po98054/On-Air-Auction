package kr.kh.onAirAuction.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.pagination.PageMaker;
import kr.kh.onAirAuction.service.AuctionService;
import kr.kh.onAirAuction.vo.AuctionVO;
import kr.kh.onAirAuction.vo.MemberVO;
import kr.kh.onAirAuction.vo.ProductVO;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService auctionservice;
	
	//��� ���
	@RequestMapping(value="/auction/insert", method=RequestMethod.GET)
	public ModelAndView product(ModelAndView mv, Integer au_pr_code) {
		au_pr_code = au_pr_code == null ? 0 : au_pr_code;
		System.out.println(au_pr_code);
		mv.addObject("au_pr_code", au_pr_code);
		mv.setViewName("/auction/insert");	
		return mv;
	}
	
    @RequestMapping(value="/auction/insert", method=RequestMethod.POST)
	public ModelAndView insertAuctionPOST(ModelAndView mv, AuctionVO auction, HttpSession session){
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	ProductVO product = (ProductVO)session.getAttribute("pr_code");
    	auctionservice.insertAuction(auction, user, product);
    	mv.setViewName("redirect:/auction/list");
		return mv;
	}
    
    // ��� ��� ����Ʈ
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
    /*
    //��� �� ������
    @RequestMapping(value="/auction/detail/{au_num}", method=RequestMethod.GET)
    public ModelAndView  auctionDetail(ModelAndView mv, 
    		@PathVariable("au_num") int au_num) {
    	AuctionVO vo = auctionservice.getAuction(au_num);
    	mv.setViewName("/auction/detail");
    	 if(vo.getAu_ac_num() == 1 || vo.getAu_ac_num() == 3 || vo.getAu_ac_num() == 4
    			 || vo.getAu_ac_num() == 5 || vo.getAu_ac_num() == 6) {
    	        mv.setViewName("/auctioncategory/general");
    	    } else if(vo.getAu_ac_num() == 2) {
    	        mv.setViewName("/auctioncategory/onair");
    	    } 
    	return mv;
    }
    */  
    
}
