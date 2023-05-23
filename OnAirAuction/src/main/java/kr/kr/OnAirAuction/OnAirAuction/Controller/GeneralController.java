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
import kr.kr.OnAirAuction.VO.ProductLikeVO;
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
		// 회원 정보
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 경매 정보
		AuctionVO auction = generalService.getAuction(au_num);
		// 상품코드를 가져옴
		int pr_code = auction.getAu_pr_code();
		// 상품 정보
		ProductVO product = generalService.getGeneralProduct(pr_code);
		// 상품 카테고리
		ProdCategoryVO prodCategory = generalService.getProdCategory(pr_code);
		// 스토어 정보
		StoreVO store = generalService.getStore(pr_code);
		// 경매 기록
		ArrayList<AuctionRecordVO> auctionRecord = generalService.getAuctionRecord(pr_code);
		// 경매 기록 리스트
		ArrayList<AuctionRecordVO> auctionRecordList = generalService.selectAuctionRecordList();
		// 최근 경매 기록
		int lastAuctionRecordIndex = auctionRecordList.size()-1;
		AuctionRecordVO lastAuctionRecord = new AuctionRecordVO();
		lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
		// 상품 파일
		ArrayList<FileVO> prodFile = generalService.getProdFileList(pr_code);
		// 상품 후기
		ArrayList<ReviewVO> review = generalService.getReview(pr_code);
		int reviewTotalCount = generalService.getReviewTotalCount(cri);
		PageMaker rePm = new PageMaker(reviewTotalCount, 5, cri);
		mv.addObject("rePm", rePm);
		
		int auctionNum = auction.getAu_num();
		mv.addObject("auctionNum", auctionNum);
		
		// 상품 문의
		ArrayList<InquiryVO> inquiry = generalService.getInquiry(pr_code);
		int inquiryTotalCount = generalService.getInquiryTotalCount(cri);
		PageMaker inPm = new PageMaker(inquiryTotalCount, 5, cri);
		mv.addObject("inPm", inPm);
		
		// 상품 좋아요
		ProductLikeVO productLikeState = generalService.selectProductLike(product.getPr_code(), user.getMe_id());
		if(productLikeState == null && user != null) {
			generalService.insertProductLike(product.getPr_code(), user.getMe_id(), 0);
			productLikeState = generalService.selectProductLike(product.getPr_code(), user.getMe_id());
			int state = productLikeState.getPl_state();
			mv.addObject("productLikeState", state);
		}else if(productLikeState != null && user != null) {
			int state = productLikeState.getPl_state();
			mv.addObject("productLikeState", state);
		}
		
		// 가져온 정보를 화면에 추가
		mv.addObject("user", user);
		mv.addObject("product", product);
		mv.addObject("prodCategory", prodCategory);
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
		
		AuctionVO auction = generalService.getAuction(1);
		session.setAttribute("auction", auction);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		session.setAttribute("user", user);
		
		String id = user.getMe_id();
		// 가상계좌
		VirtualAccountVO userAccount = generalService.getUserAccount(id);
		// 회원등급
		String membershipName = user.getMe_ml_name();
		MembershipLevelVO membership = generalService.getMembership(membershipName);
		// 등급수수료
		int expense = membership.getMl_expense();
		// 경매
		// AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		
		auction = (AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		
		boolean res = generalService.insertBid(price, user, userAccount, expense, auctionNum);
		
		map.put("res", res);
		
		AuctionRecordVO auctionRecord = new AuctionRecordVO();
		double nextPrice = auctionRecord.getAr_next_bid_price(price);
		map.put("nextPrice", nextPrice);
		
		return map;
	}
	
	// 상품 좋아요
	@RequestMapping(value = "/likeProduct", method=RequestMethod.POST)
	public Map<String, Object> likeProduct(@RequestBody int productLikeState, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		ProductVO product = (ProductVO)session.getAttribute("auctionProduct");
		int productCode = product.getPr_code();
		map = generalService.likeProduct(productCode, userId, productLikeState);
		return map;
	}
}