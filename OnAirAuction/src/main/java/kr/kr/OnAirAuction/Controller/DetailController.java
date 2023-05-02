package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.BidService;
import kr.kr.OnAirAuction.Service.DetailService;
import kr.kr.OnAirAuction.Service.ProductService;
import kr.kr.OnAirAuction.VO.BidVO;
import kr.kr.OnAirAuction.VO.ImmediateVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Controller
public class DetailController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	BidService bidService;
	
	@Autowired
  DetailService detailService;
	
	@RequestMapping(value = "/general/list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, Criteria cri) {
		ArrayList<ProductVO> list = productService.getProductList(cri);
		int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/general/list");
		return mv;
	}
    
	// /general/detail/{pr_code}
	@RequestMapping(value = "/general/detail", method=RequestMethod.GET)
	public ModelAndView detail(ModelAndView mv) {
		// 수정 필요 pr_code 넣어야 함 
		// ProductVO product = productService.getProduct(pr_code);
		// mv.addObject("product", product);
		mv.setViewName("/general/detail");
		return mv;
	}
	
	// 입찰하기 - 즉시구매희망가(GET)
	@RequestMapping(value = "/general/imme", method = RequestMethod.GET)
	public ModelAndView immediateInsert(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		mv.setViewName("/general/imme");
		return mv;
	}
	// 입찰하기 - 즉시구매희망가(POST)
	@RequestMapping(value = "/general/imme", method = RequestMethod.POST)
	public ModelAndView immediateInsertPost(ModelAndView mv, BidVO bid, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(bidService.insertImmediate(user, bid)) {
			System.out.println("죽시 구매희망가 입찰하기 성공!");
		}else {
			System.out.println("죽시 구매희망가 입찰하기 실패!");
		}
		mv.setViewName("redirect:/general/detail");
		return mv;
	}
	
	// 입찰하기 - 경매(GET)
	@RequestMapping(value = "/general/bid", method = RequestMethod.GET)
	public ModelAndView bidInsert(ModelAndView mv, BidVO bid, HttpSession session) {
		
		mv.setViewName("general/bid");
		return mv;
	}
		
	// 입찰하기 - 경매(POST)
	@RequestMapping(value = "/general/bid", method = RequestMethod.POST)
	public ModelAndView bidInsertPost(ModelAndView mv, BidVO bid, HttpSession session) {
		
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
	
	// 경매기록보기(GET)
	@RequestMapping(value = "/general/bidlist", method = RequestMethod.GET)
	public ModelAndView bidlist(ModelAndView mv, Criteria cri) {
		// 0 아닌거 같음 수정 필요
		ArrayList<BidVO> list = bidService.getBidlist(cri, 0);
		int totalCount = bidService.getBidlistTotalCount(cri);
		int displayPageNum = 5;
		PageMaker pm = new PageMaker(totalCount, displayPageNum, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/general/bidlist");
		return mv;
	}
//	// 경매기록보기(POST)
//	@RequestMapping(value = "/detail/bidlist", method = RequestMethod.POST)
//	public ModelAndView bidlistPost(ModelAndView mv, BidlistVO bidlist) {
//		mv.setViewName("redirect:/detail");
//		return mv;
//	}
	// 마감연장(GET)
	@RequestMapping(value = "/general/deadline", method = RequestMethod.GET)
	public ModelAndView deadlineUpdate(ModelAndView mv, Integer ac_num) {
		mv.setViewName("/general/deadline");
		return mv;
	}
	// 마감연장(POST)
	@RequestMapping(value = "/general/deadline", method = RequestMethod.POST)
	public ModelAndView deadlineUpdatePost(ModelAndView mv, ImmediateVO immediate) {
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
	// 상품 찜
	@ResponseBody
	@RequestMapping(value = "/like/product/{pl_state}/{pl_pr_code}", method=RequestMethod.GET)
	public Map<String, Object> likeProduct(HttpSession session,
			@PathVariable("pl_state")int pl_state,  // 찜의 유무 값 확인
			@PathVariable("pl_pr_code")int pl_pr_code) {  // 상품코드 확인
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 회원 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// res=1: 찜, res=0: 찜취소
		int res = productService.updateLike(user, pl_state, pl_pr_code);
		productService.updateProductByLike(pl_pr_code);
		map.put("rest", res);
		return map;
	}
	
	// 스토어 찜
	@RequestMapping(value = "/like/store", method=RequestMethod.GET)
	public ModelAndView likeStore(ModelAndView mv) {
		 
		mv.setViewName("/like/store");
		return mv;
	}
	
}
