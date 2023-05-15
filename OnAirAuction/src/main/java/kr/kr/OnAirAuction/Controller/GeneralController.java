package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.GeneralService;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.StoreVO;

@Controller
public class GeneralController {
	
	@Autowired
    GeneralService generalService;
	
	// 일반 경매 상품 리스트
	@RequestMapping(value = "/general/list", method=RequestMethod.GET)
	public ModelAndView GeneraList(ModelAndView mv, Criteria cri) {
		ArrayList<ProductVO> list = generalService.getGeneralList(cri);
		// 수정 필요
		int totalCount = generalService.getGeneralTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/general/list");
		return mv;
	}
    
	// 일반 경매 상품 상세페이지
	@RequestMapping(value = "/general/detail/{pr_code}", method=RequestMethod.GET)
	public ModelAndView GeneralDetail(ModelAndView mv,
			@PathVariable("pr_code")int pr_code, 
			HttpSession session) {
		// 서비스에게 괄호 안에 해당하는 DB컬럼 이름을 주면서 해당하는 정보를 요청 
		ProductVO product = generalService.getGeneralProduct(pr_code);
		ProdCategoryVO prodCategory = generalService.getProdCategory(pr_code);
		MemberVO user = (MemberVO)session.getAttribute("user");
		ProductLikeVO pLikeVo = generalService.getLikeProduct(user, pr_code);
		AuctionVO auction = generalService.getAuction(pr_code);
		StoreVO store = generalService.getStore(pr_code);
		
		// 가져온 정보를 화면에 추가
		mv.addObject("product", product);
		mv.addObject("prodCategory", prodCategory);
		mv.addObject("like", pLikeVo);
		mv.addObject("auction", auction);
		mv.addObject("store", store);
		
		
		
		
		
//		// 3. mv에 보여주기 위해 필요한 요소를 서버에서 찾아서 addObject해준다.
//		ArrayList<AuctionRecordVO> auctionRecordList = generalService.selectAuctionRecord();
//		AuctionRecordVO lastAuctionRecord = new AuctionRecordVO();
//		mv.addObject("auctionRecordList", auctionRecordList);
//		mv.addObject("lastAuctionRecord", lastAuctionRecord);

		mv.setViewName("/general/detail");
		return mv;
	}
	
	// 상품 찜
	@ResponseBody
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
	}
	
	// 판매자 찜
	@RequestMapping(value = "/like/seller/{sl_seller_id}/{sl_me_id}", method=RequestMethod.GET)
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
	}
	
	
	
	/* ----- 미확실 코드 ----- */
	
	// 즉시구매(GET)
	@RequestMapping(value = "/general/imme", method = RequestMethod.GET)
	public ModelAndView immediateInsert(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		mv.setViewName("/general/imme");
		return mv;
	}
	// 즉시구매(POST)
	@RequestMapping(value = "/general/imme", method = RequestMethod.POST)
	public ModelAndView immediateInsertPost(ModelAndView mv, AuctionVO bid, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(generalService.insertImmediate(user, bid)) {
			System.out.println("죽시 구매희망가 입찰하기 성공!");
		}else {
			System.out.println("죽시 구매희망가 입찰하기 실패!");
		}
		mv.setViewName("redirect:/general/detail");
		return mv;
	}

	// 입찰하기 성공하면 지워도 되는 코드
//	// 입찰하기(GET)
//	@RequestMapping(value = "/general/bid", method = RequestMethod.GET)
//	public ModelAndView bidInsert(ModelAndView mv, AuctionVO bid, HttpSession session) {
//		
//		return mv;
//	}
	
	// 원본 - 수정전
	// 입찰하기
//	@RequestMapping(value = "/general/bid", method = RequestMethod.POST)
//	public ModelAndView bidInsertPost(ModelAndView mv, AuctionVO bid, HttpSession session) {
//		
//		mv.setViewName("redirect:/detail");
//		return mv;
//	}
	
//	// ajax 관련
//	@RequestMapping(value = "/ajaxData", method = RequestMethod.GET)
//	public ModelAndView ajaxData(ModelAndView mv, HttpSession session) {
//		mv.setViewName("general/ajaxdata");
//		
//		ArrayList<AuctionRecordVO> auctionRecordList = generalService.selectAuctionRecord();
//		
//		int lastAuctionRecordIndex = auctionRecordList.size()-1;
//		AuctionRecordVO lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
//
//		mv.addObject("auctionRecordList", auctionRecordList);
//		mv.addObject("lastAuctionRecord", lastAuctionRecord);
//		
//		return mv;
//	}
	
	// 입찰하기
	@RequestMapping(value = "/general/bid", method = RequestMethod.POST)
	public Map<String, Object> generalBid(@RequestBody Double price, HttpSession session) {
		/* 순서를 생각을 해보자
		 * 입찰하려면 뭐가 필요해?
		 * select: 회원, 경매정보
		 * insert: 입찰한 회원, 경매입찰시간, 입찰가격 -> 경매기록에 insert
		 * 
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		
		AuctionRecordVO auRecord = new AuctionRecordVO();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		
		boolean res = generalService.insertBid(user, price, auRecord, auctionNum);
		System.out.println(res);

		double nextPrice = auRecord.getAr_next_bid_price(price);
		System.out.println(nextPrice);
		
		map.put("res", res);
		map.put("nextPrice", nextPrice);
		return map;
	}
	

	
	// 경매기록보기(GET)
	@RequestMapping(value = "/general/bidlist", method = RequestMethod.GET)
	public ModelAndView bidlist(ModelAndView mv, Criteria cri, int pr_code) {
		// 0 아닌거 같음 수정 필요
//		ArrayList<AuctionRecordVO> auRecord = generalService.getBidlist(cri, 0);
//
//		int totalCount = generalService.getBidlistTotalCount(cri);
//		int displayPageNum = 5;
//		PageMaker pm = new PageMaker(totalCount, displayPageNum, cri);
		
		
//		// 3. mv에 보여주기 위해 필요한 요소를 서버에서 찾아서 addObject해준다.
//		ArrayList<AuctionRecordVO> auctionRecordList = generalService.selectAuctionRecord();
//		AuctionRecordVO lastAuctionRecord = new AuctionRecordVO();
//		mv.addObject("auctionRecordList", auctionRecordList);
//		mv.addObject("lastAuctionRecord", lastAuctionRecord);
		
		// 구현중
		// 서비스에게 상품 코드를 주면서 경매기록 정보를 요청
		// 오류 발생 여러개 나온다고 함
		AuctionRecordVO auctionRecord = generalService.getAuctionRecord(pr_code);
		// 가져온 정보를 화면에 추가
		mv.addObject("auctionRecord", auctionRecord);
		
		
//		mv.addObject("auRecord", auRecord);
//		mv.addObject("pm", pm);
		mv.setViewName("/general/bidlist");
		return mv;
	}
	
	// 경매기록보기(POST)
	@RequestMapping(value = "/detail/bidlist", method = RequestMethod.POST)
	public ModelAndView bidlistPost(ModelAndView mv, AuctionRecordVO bidlist) {
		
		
		
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
	// 마감연장(GET)
	@RequestMapping(value = "/general/deadline", method = RequestMethod.GET)
	public ModelAndView deadlineUpdate(ModelAndView mv, Integer ac_num) {
		mv.setViewName("/general/deadline");
		return mv;
	}
	// 마감연장(POST)
	@RequestMapping(value = "/general/deadline", method = RequestMethod.POST)
	public ModelAndView deadlineUpdatePost(ModelAndView mv, AuctionVO auction) {
		mv.setViewName("redirect:/detail");
		return mv;
	}
	
}
