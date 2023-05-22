package kr.kh.onairauction.controller;



import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session.SessionEventListener;

import kr.kh.onairauction.service.AuctionService;
import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.AuctionVO;
import kr.kh.onairauction.vo.BoardListVO;
import kr.kh.onairauction.vo.ChattingVO;
import kr.kh.onairauction.vo.DeliveryVO;
import kr.kh.onairauction.vo.FileVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.MessageVO;
import kr.kh.onairauction.vo.AuctionOrderVO;
import kr.kh.onairauction.vo.ProductLikeVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.SellerLikeVO;
import kr.kh.onairauction.vo.VirtualAccountVO;

@RestController
@Controller
public class AirAuctionController {
	@Autowired
	AuctionService auctionService;
	
	
	@RequestMapping(value = "/onairauction/detail/{au_num}", method=RequestMethod.GET)// /{au_num}
	public ModelAndView home(ModelAndView mv, HttpSession session, @PathVariable("au_num")int au_num) {
		mv.setViewName("/auction/home");
		//
		MemberVO sessionUser = auctionService.getUser("taehwan");//나중에 지울 코드
		session.setAttribute("user", sessionUser);//나중에 지울 코드
		
		// 1. 경매번호로 경매불러오고 세션에 저장해주고, 세션에 저장되어있는 유저아이디를 불러와준다.
		AuctionVO auction = auctionService.getAuction(au_num);
		session.setAttribute("auction", auction);
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 2. 받아온 auction객체의 속성을 통해서 판매자와 상품정보를 서버와 세션에 저장해준다.
		int productCode = auction.getAu_pr_code();
		String sellerId = auction.getAu_me_id();
		ProductVO auctionProduct = auctionService.selectProduct(productCode);
		MemberVO auctionSeller = auctionService.selectSeller(sellerId);
		session.setAttribute("auctionProduct", auctionProduct);
		session.setAttribute("auctionSeller", auctionSeller);
		int price = auctionProduct.getPr_start_price();
		int auctionNum = auction.getAu_num();
		// 3. 현재페이지에서 사용하기 위한 요소들을 찾아서  mv.addObject해준다.
		ArrayList<ReportCategoryVO> reportCategory = auctionService.selectReportCategory();
		ArrayList<AuctionRecordVO> auctionRecordList = auctionService.selectAuctionRecord(auction.getAu_start_date(), price, sellerId, auctionNum);
		ArrayList<BoardListVO> boardList = auctionService.selectBoardList(user.getMe_id());
		FileVO file = auctionService.selectFile(productCode);
		mv.addObject("files", file);
		mv.addObject("boardList", boardList);
		mv.addObject("reportCategory", reportCategory);
		mv.addObject("auctionRecordList", auctionRecordList);
		int lastAuctionRecordIndex = auctionRecordList.size()-1;
		AuctionRecordVO lastAuctionRecord = auctionRecordList.get(lastAuctionRecordIndex);
		mv.addObject("lastAuctionRecord", lastAuctionRecord);
		SellerLikeVO sellerLikeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
		if(sellerLikeState == null && user != null) {
			auctionService.insertSellerLike(user.getMe_id(), auctionSeller.getMe_id(), 0);
			sellerLikeState = auctionService.selectSellerLike(user.getMe_id(), auctionSeller.getMe_id());
			int state = sellerLikeState.getSl_state();
			mv.addObject("sellerLikeState",state);
		}else if(sellerLikeState != null && user != null) {
			int state = sellerLikeState.getSl_state();
			mv.addObject("sellerLikeState",state);
		}
		ProductLikeVO productLikeState = auctionService.selectProductLike(auctionProduct.getPr_code(), user.getMe_id());
		if(productLikeState == null && user != null) {
			auctionService.insertProductLike(auctionProduct.getPr_code(), user.getMe_id(), 0);
			productLikeState = auctionService.selectProductLike(auctionProduct.getPr_code(), user.getMe_id());
			int state = productLikeState.getPl_state();
			mv.addObject("productLikeState",state);
		}else if(productLikeState != null && user != null) {
			int state = productLikeState.getPl_state();
			mv.addObject("productLikeState",state);
		}
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
		String now = date.format(nowTime);
		mv.addObject("nowTime", now);
		mv.addObject("endTime", "첫 입찰" + auction.getAu_limit_bid_time() +"초 후에 종료됩니다.");
		if (!lastAuctionRecord.getAr_me_id().equals(auctionSeller.getMe_id())) {
			String end = auctionService.endTime(lastAuctionRecord, auction);
			mv.addObject("endTime", end + "에 종료됩니다.");
		}
		ChattingVO channel = auctionService.selectChatting(au_num);
		String userId = user.getMe_id();
		int chattingChannel = channel.getCh_num();
		session.setAttribute("chattingChannel", chattingChannel);
		session.setAttribute("userId", userId);
		return mv;
		//DB에 저장되어 있는 데이터 - 구매자, 판매자, 상품, 경매, 경매카테고리, 신고카테고리, 가상계좌
		
	}
	
	@RequestMapping(value = "/report", method=RequestMethod.POST)
	public ModelAndView report(ModelAndView mv, ReportVO report, HttpSession session) {
		boolean register = auctionService.insertReport(report);
		AuctionVO a = (AuctionVO)session.getAttribute("auction");
		mv.setViewName("redirect:/onairauction/detail/"+a.getAu_num());
		return mv;
	}
	@RequestMapping(value = "/message", method=RequestMethod.POST)
	public ModelAndView message(ModelAndView mv, MessageVO message, HttpSession session) {
		boolean register = auctionService.insertMessage(message);
		AuctionVO a = (AuctionVO)session.getAttribute("auction");
		mv.setViewName("redirect:/onairauction/detail/"+a.getAu_num());
		return mv;
	}
	@RequestMapping(value = "/delivery", method=RequestMethod.POST)
	public ModelAndView delivery(ModelAndView mv, int bl_num, HttpSession session) {
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		AuctionOrderVO order = auctionService.insertOrder(auction);
		auctionService.insertDelivery(order.getAo_num(), bl_num);
		mv.setViewName("redirect:/onairauction/detail/"+auction.getAu_num());
		return mv;
	}

	@RequestMapping(value = "/auctionBid", method=RequestMethod.POST) //1. 입찰종료 되었을 때, 입찰막기 추가해야함 //2. 새로운입찰이 들어왔을 때, 판매종료시간 리셋해야함
	public Map<String, Object> auctionBid(@RequestBody Map<String, String> formData, HttpSession session){
		String value1 = formData.get("value1");
		double price = Double.parseDouble(value1);
		String value2 = formData.get("value2");
		int end = Integer.parseInt(value2);
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		VirtualAccountVO userAccount = auctionService.selectAccount(id);
		String levelName = user.getMe_ml_name();
		MembershipLevelVO level = auctionService.selectMebership(levelName);
		int expense = level.getMl_expense();
		AuctionVO auction = (AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		Date auctionOpenTime = auction.au_start_date;
		Date serverTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy. MM. dd. HH:mm:ss");
		String now = date.format(serverTime);
		String lol = now.replaceAll("[^0-9]", "");
		lol = lol.substring(8);
		int intNowTime = Integer.parseInt(lol);
		int intEndTime = end;
		boolean bidPossible = auctionService.timeChange(auctionOpenTime, serverTime);
		if(auction.getAu_final_date() == null) {
			boolean auctionEnd = auctionService.finishAuction(intNowTime, intEndTime, auction);
			//boolean bidPossible2 = auctionOpenTime.before(serverTime);//OpenTime이 serverTime 이전이면 true
			//경매시작시간이 되기전에 입찰하기 안되게 코드짜기 
			if(bidPossible && auctionEnd==false) {
				boolean res = auctionService.insertBid(price, expense, userAccount, user, auctionNum);
				map.put("res", res);
				AuctionRecordVO lastRecord = auctionService.lastAuctionRecord(auctionNum);
				String bidder =lastRecord.getAr_me_id();
				double nextPrice = lastRecord.getAr_next_bid_price(price);
				String lastTime = auctionService.endTime(lastRecord, auction);
				String intEnd = lastTime.replaceAll("[^0-9]", "");
				map.put("bidder", bidder);
				map.put("intEnd", intEnd);
				map.put("nextPrice", nextPrice);
			}
			map.put("bidPossible", bidPossible);
			map.put("auctionEnd", auctionEnd);
			System.out.println(map);
		}
		if(auction.getAu_final_date() != null) {
			map.put("already", true);
		}
		return map;
		
	}
	
	@RequestMapping(value = "/userStore/{id}", method=RequestMethod.GET)
	public ModelAndView Store(ModelAndView mv, @PathVariable("id")String id, HttpSession session) { // @PathVariable("store_num")int store_num
		MemberVO a = (MemberVO)session.getAttribute("auctionSeller");
		mv.setViewName("/auction/store");
		return mv;
	}
	@RequestMapping(value = "/sellerLike", method=RequestMethod.POST)
	public Map<String, Object> sellerLike(@RequestBody int sellerLikeState, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		MemberVO seller = (MemberVO)session.getAttribute("auctionSeller");
		String sellerId = seller.getMe_id();
		map = auctionService.sellerLike(sellerLikeState, userId, sellerId);
		return map;
	}
	@RequestMapping(value = "/productLike", method=RequestMethod.POST)
	public Map<String, Object> productLike(@RequestBody int productLikeState, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		ProductVO product = (ProductVO)session.getAttribute("auctionProduct");
		int productCode = product.getPr_code();
		map = auctionService.productLike(productCode, userId, productLikeState);
		return map;
	}
	
}