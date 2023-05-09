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
import kr.kr.OnAirAuction.Service.GeneralService;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.StoreVO;

@Controller
public class GeneralController {
	
	@Autowired
    GeneralService generalService;
	
	// 일반 경매 상품 리스트
	@RequestMapping(value = "/general/list", method=RequestMethod.GET)
	public ModelAndView GeneraList(ModelAndView mv, Criteria cri) {
		ArrayList<ProductVO> list = generalService.getGeneralList(cri);
		int totalCount = generalService.getGeneralTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/general/list");
		return mv;
	}
    
	// /general/detail/{pr_code}
	// 일반 경매 상품 상세페이지
	@RequestMapping(value = "/general/detail/{pr_code}", method=RequestMethod.GET)
	public ModelAndView GeneralDetail(ModelAndView mv,
			@PathVariable("pr_code")int pr_code, 
			HttpSession session){
		// 서비스에게 상품 코드를 주면서 일반경매 상품정보를 가져오라고 요청
		ProductVO product = generalService.getGeneralProduct(pr_code);
		// 서비스에게 상품 카테고리 번호를 주면서 해당하는 카테고리를 가져오라고 요청
//		Product_categoryVO prodCategory = generalService.getProdCategory(pr_code);
		// 회원정보를 가져옴(찜한 내용 확인용)
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 서비스에게 회원 정보, 상품 정보를 주면서 좋아요 정보를 가져오라고 요청
		ProductLikeVO pLikeVo = generalService.getLikeProduct(user, pr_code);
		// 서비스에게 상품코드를 주면서 경매 정보를 가져오라고 요청
		AuctionVO auction = generalService.getAuction(pr_code);
		// 서비스에게 상품코드를 주면서 스토어 정보를 가져오라고 요청
		StoreVO store = generalService.getStore(pr_code);
		
		// 가져온 상품을 화면에 전달
		mv.addObject("product", product);
		// 가져온 카테고리를 화면에 전달
//		mv.addObject("prodCategory", prodCategory);
		// 가져온 좋아요 정보를 화면에 전송
		mv.addObject("like", pLikeVo);
		// 가져온 경매 정보를 화면에 전송
		mv.addObject("auction", auction);
		// 가져온 스토어 정보를 화면에 전송
		mv.addObject("store", store);
		
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
	/*@RequestMapping(value = "/general/imme", method = RequestMethod.POST)
	public ModelAndView immediateInsertPost(ModelAndView mv, AuctionVO bid, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(bidService.insertImmediate(user, bid)) {
			System.out.println("죽시 구매희망가 입찰하기 성공!");
		}else {
			System.out.println("죽시 구매희망가 입찰하기 실패!");
		}
		mv.setViewName("redirect:/general/detail");
		return mv;
	}*/
	
	// 입찰하기 - 경매(GET)
	@RequestMapping(value = "/general/bid", method = RequestMethod.GET)
	public ModelAndView bidInsert(ModelAndView mv, AuctionVO bid, HttpSession session) {
		
		mv.setViewName("general/bid");
		return mv;
	}
		
	// 입찰하기 - 경매(POST)
	@RequestMapping(value = "/general/bid", method = RequestMethod.POST)
	public ModelAndView bidInsertPost(ModelAndView mv, AuctionVO bid, HttpSession session) {
		
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
	// 경매기록보기(GET)
	/*@RequestMapping(value = "/general/bidlist", method = RequestMethod.GET)
	public ModelAndView bidlist(ModelAndView mv, Criteria cri) {
		// 0 아닌거 같음 수정 필요
		ArrayList<AuctionVO> list = bidService.getBidlist(cri, 0);
		int totalCount = bidService.getBidlistTotalCount(cri);
		int displayPageNum = 5;
		PageMaker pm = new PageMaker(totalCount, displayPageNum, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/general/bidlist");
		return mv;
	}*/
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
	public ModelAndView deadlineUpdatePost(ModelAndView mv, AuctionVO immediate) {
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
	// 상품 찜
	/*@ResponseBody
	@RequestMapping(value = "/like/product/{pl_pr_code}/{pl_state}", method=RequestMethod.GET)
	public Map<String, Object> likeProduct(HttpSession session,
			@PathVariable("pl_pr_code")int pl_pr_code,  // 상품코드 확인
			@PathVariable("pl_state")int pl_state) { // 찜의 유무 값 확인
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 회원 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// res=1: 찜, res=0: 찜취소
		int res = generalService.updateLikeProduct(pl_pr_code, pl_state, user);
		map.put("state", res);
		map.put("res", res);
		return map;
	}*/
	
	// 판매자 찜
	/*@RequestMapping(value = "/like/seller/{sl_seller_id}/{sl_me_id}", method=RequestMethod.GET)
	public Map<String, Object> likeSeller(HttpSession session,
			@PathVariable("sl_seller_id")String sl_seller_id,  // 판매자 아이디 확인
			@PathVariable("sl_state")int sl_state) { // 찜의 유무 값 확인
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 회원 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// res=1: 찜, res=0: 찜취소
		int res = generalService.updateLikeSeller(sl_seller_id, sl_state, user);
		map.put("state", res);
		map.put("res", res);
		return map;
	}*/
	
}
