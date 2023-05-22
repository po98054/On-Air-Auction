package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.GeneralService;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.InquiryVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReviewVO;
import kr.kr.OnAirAuction.VO.StoreVO;
import kr.kr.OnAirAuction.VO.VirtualAccountVO;

@Controller
public class GeneralController {
	
	@Autowired
    GeneralService generalService;
	
	// 일반 경매 상품 리스트
	@RequestMapping(value = "/general/list", method=RequestMethod.GET)
	public ModelAndView generalList(ModelAndView mv, Criteria cri) {
		ArrayList<ProductVO> productList = generalService.getGeneralList(cri);
		int totalCount = generalService.getGeneralTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("productList", productList);
		mv.addObject("pm", pm);
		mv.setViewName("/general/list");
		return mv;
	}
    
	// 일반 경매 상품 상세페이지 
	@RequestMapping(value = "/general/detail/{au_num}", method=RequestMethod.GET)
	public ModelAndView generalDetail(ModelAndView mv,
			@PathVariable("au_num")int au_num, 
			Criteria cri,
			HttpSession session) {
		// 서비스에게 해당하는 정보를 요청 
		MemberVO user = (MemberVO)session.getAttribute("user");
		AuctionVO auction = generalService.getAuction(au_num);
		System.out.println("경매 정보 : " + auction);
		int pr_code = auction.getAu_pr_code();
		System.out.println("제품 코드 : " + pr_code);
		ProductVO product = generalService.getGeneralProduct(pr_code);
		ProdCategoryVO prodCategory = generalService.getProdCategory(pr_code);
		//AuctionVO auction = generalService.getAuction(pr_code);
		StoreVO store = generalService.getStore(pr_code);
		ArrayList<AuctionRecordVO> auctionRecord = generalService.getAuctionRecord(pr_code);
		ArrayList<AuctionRecordVO> auctionRecordList = generalService.selectAuctionRecordList();
		int lastAuctionRecordIndex = auctionRecordList.size()-1;
		AuctionRecordVO lastAuctionRecord = new AuctionRecordVO();
		lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
		ArrayList<FileVO> prodFile = generalService.getProdFileList(pr_code);
		ArrayList<ReviewVO> review = generalService.getReview(pr_code);
		ArrayList<InquiryVO> inquiry = generalService.getInquiry(pr_code);
		
		// 테스트
//		ProductLikeVO prodLike = generalService.getProdLike(user, pr_code);
//		mv.addObject("prodLike", prodLike);
		
//		InquiryCategoryVO inquCategory = generalService.getInquCategory(pr_code);
//		mv.addObject("inquCategory", inquCategory);
		
		// 가져온 정보를 화면에 추가
		mv.addObject("user", user);
		mv.addObject("product", product);
		mv.addObject("prodCategory", prodCategory);
//		mv.addObject("prodLike", prodLike);
		mv.addObject("auction", auction);
		mv.addObject("store", store);
		mv.addObject("auctionRecord", auctionRecord);
		mv.addObject("lastAuctionRecord", lastAuctionRecord);
		mv.addObject("prodFile", prodFile);
		mv.addObject("review", review);
		mv.addObject("inquiry", inquiry);
		
		mv.setViewName("/general/detail");
		return mv;
	}
	
	
	// 입찰하기
	@RequestMapping(value = "/generalBid", method=RequestMethod.POST)
	public Map<String, Object> generalBid(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String priceString = (String) requestData.get("price");
		int price = (int) Double.parseDouble(priceString);
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		// 가상계좌
		VirtualAccountVO userAccount = generalService.getUserAccount(id);
		// 회원등급
		String membershipName = user.getMe_ml_name();
		MembershipLevelVO membership = generalService.getMembership(membershipName);
		// 등급수수료
		int expense = membership.getMl_expense();
		// 경매
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		
		boolean res = generalService.insertBid(price, user, userAccount, expense, auctionNum);
		
		map.put("res", res);
		
		AuctionRecordVO auctionRecord = new AuctionRecordVO();
		double nextPrice = auctionRecord.getAr_next_bid_price(price);
		map.put("nextPrice", nextPrice);
		
		return map;
	}
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.POST)
	public ModelAndView inquiry(ModelAndView mv, InquiryVO inquiry, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		boolean inquirySubmit = generalService.insertInquiry(inquiry);
		System.out.println(inquirySubmit);
		mv.setViewName("redirect:/");
		return mv;
	}
	
//	// 찜한 상품
//	@RequestMapping(value = "/general/like/product/{pr_code}/{pl_state}", method=RequestMethod.GET)
//	public ModelAndView likeProduct(ModelAndView mv,
//			@PathVariable("pr_code")int pr_code,
//			@PathVariable("pl_state")int pl_state,
//			HttpSession session) {
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		ProductLikeVO prodLike = generalService.getProdLike(user, pl_state);
//		ProductVO product = generalService.getGeneralProduct(pr_code);
//		
//		mv.addObject("user", user);
//		mv.addObject("prodLike", prodLike);
//		mv.addObject("product", product);
//		
//		return mv;
//	}
//
//	// 상품 찜
//	@ResponseBody
//	@RequestMapping(value = "/like/product/{pl_pr_code}/{pl_state}", method=RequestMethod.GET)
//	public Map<String, Object> likeProduct(HttpSession session,
//			@PathVariable("pl_pr_code")int pl_pr_code,  // 상품코드 확인
//			@PathVariable("pl_state")int pl_state) { // 찜의 유무 값 확인
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		// 회원 정보 가져오기
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		// res=1: 찜, res=0: 찜취소
//		int res = generalService.updateLikeProduct(pl_pr_code, pl_state, user);
//		map.put("state", res);
//		map.put("res", res);
//		return map;
//	}
//	
//	// 스토어 찜
//	@RequestMapping(value = "/like/seller/{sl_seller_id}/{sl_state}", method=RequestMethod.GET)
//	public Map<String, Object> likeSeller(HttpSession session,
//			@PathVariable("sl_seller_id")String sl_seller_id,  // 판매자 아이디 확인
//			@PathVariable("sl_state")int sl_state) { // 찜의 유무 값 확인
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		// 회원 정보 가져오기
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		// res=1: 찜, res=0: 찜취소
//		int res = generalService.updateLikeSeller(sl_seller_id, sl_state, user);
//		map.put("state", res);
//		map.put("res", res);
//		return map;
//	}


}
