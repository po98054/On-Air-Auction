package kr.kh.onairauction.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import kr.kh.onairauction.service.AuctionService;
import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.AuctionVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.VirtualAccountVO;
import kr.kh.onairauction.vo2.MessageVO;

@RestController
@Controller
public class AirAuctionController {
	@Autowired
	AuctionService auctionService;
	
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpSession session) {
		mv.setViewName("/auction/home");
		
		// - 세션에 경매번호가 저장된 채로 넘어올 경우
		//경매번호로 상품찾아서 상품세션에 저장
		//AuctionVO now = (AuctionVO)session.getAttribute("auction");
		//int auctionNum = auction.getAu_pr_code();
		//String sellerId = auction.getAu_me_id();
		//ProductVO auctionProduct = auctionService.getProduct(int num);
		//MemberVO seller = auctionService.getUser(String id);
		//mv.addObject("auctionProduct", auctionProduct);
		//mv.addObject("Seller", Seller);
		// - 세션에 상품정보가 저장된 채로 넘어올 경우
		//세션에서 상품정보,로그인아이디 받아와서 세션에 저장
		//ProductVO a = (ProductVO)session.getAttribute("product");
		//MemberVO b = (MemberVO)session.getAttribute("user");
		//mv.addObject("product", a);
		//mv.addObject("user", b);
		//상품테이블의 외래키인 스토어번호로 스토어VO를 불러오고 스토어에서 판매자 아이디를 불러와 판매자 id로 세션저장
		//int c = a.getPr_st_num();
		//StoreVO store = auctionService.getStore(int c);
		//String str = store.getSt_me_id();
		//MemberVO seller = auctionService.getSeller(String str);
		//mv.addObject("seller", seller);
		//경매기록 받아오고
		//AuctionVO auction = auctionService.getAuction(int productCode, String Seller_id);
		//mv.addObject("auction", auction);
		//AuctionRecordVO record = auctionService.getAuctionRecord(int AuctionNum);
		ArrayList<kr.kh.onairauction.vo2.ReportCategoryVO> list1 = auctionService.getReportCategoryName();
		ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> list2 = auctionService.getAuctionRecordList();
		mv.addObject("list1", list1);
		int lastIndex = list2.size()-1;
		kr.kh.onairauction.vo2.AuctionRecordVO last = new kr.kh.onairauction.vo2.AuctionRecordVO();
		last = list2.get(lastIndex);
		mv.addObject("last", last);
		kr.kh.onairauction.vo2.MemberVO user = new kr.kh.onairauction.vo2.MemberVO();
		//user = (MemberVO)session.getAttribute("user");//세션에 저장된 정보를 가져옴
		user = auctionService.getUser("taehwan");
		session.setAttribute("user", user);//세션에 저장
		kr.kh.onairauction.vo2.MemberVO seller = auctionService.getUser("seller");
		kr.kh.onairauction.vo2.ProductVO product = new kr.kh.onairauction.vo2.ProductVO();
		String id = seller.getMe_id();
		kr.kh.onairauction.vo2.AuctionVO auction = auctionService.getAuction(id);
		//product = (ProductVO)session.getAttribute("product");
		product = auctionService.getProduct(1);
		session.setAttribute("seller", seller);
		session.setAttribute("product", product);
		session.setAttribute("auction", auction);
		mv.addObject("auction", auction);
		mv.addObject("seller", seller);
		mv.addObject("user",user);
		mv.addObject("product", product);
		System.out.println(user);
		System.out.println(product);
		return mv;
		//DB에 저장되어 있는 데이터 - 구매자, 판매자, 상품, 경매, 경매카테고리, 경매기록(처음 하나의 기록), 
		//신고카테고리, 
	}
	@RequestMapping(value = "/AuctionRecord", method=RequestMethod.GET)
	public ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> getAuctionRecords() {
		ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> list = auctionService.getAuctionRecordList();
		return list;
	}
	
	@RequestMapping(value = "/report", method=RequestMethod.POST)
	public ModelAndView report(ModelAndView mv, kr.kh.onairauction.vo2.ReportVO report) {
		boolean register = auctionService.register(report);
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/notebox", method=RequestMethod.POST)
	public ModelAndView notebox(ModelAndView mv, MessageVO note, HttpSession session) {
		//MemberVO user =(MemberVO)session.getAttribute("user");
		//MemberVO user = auctionService.getUser("123");
		//mv.addObject("user",user);
		boolean register= auctionService.registerNote(note);
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/ajaxdata", method = RequestMethod.GET)
	public ModelAndView ajaxdata(ModelAndView mv,HttpSession session) {
		mv.setViewName("auction/ajaxdata");
		ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> list = auctionService.getAuctionRecordList();
		int n = list.size()-1;
		kr.kh.onairauction.vo2.AuctionRecordVO lastRecord = list.get(n);
		mv.addObject("list", list);
		mv.addObject("last", lastRecord);
		return mv;
	}
	@RequestMapping(value = "/auctionBid", method=RequestMethod.POST)
	public Map<String, Object> auctionBid(@RequestBody Double price, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		kr.kh.onairauction.vo2.MemberVO user = (kr.kh.onairauction.vo2.MemberVO)session.getAttribute("user");
		String id = user.getMe_id();
		kr.kh.onairauction.vo2.VirtualAccountVO account = auctionService.selectAccount(id);
		String levelName = user.getMe_ml_name();
		kr.kh.onairauction.vo2.MembershipLevelVO level = auctionService.getMebership(levelName);
		int expense = level.getMl_expense();
		kr.kh.onairauction.vo2.AuctionVO auction = (kr.kh.onairauction.vo2.AuctionVO)session.getAttribute("auction");
		int auctionNum = auction.getAu_num();
		boolean res = auctionService.insertBid(price, expense, account, user, auctionNum);
		System.out.println(res);
		map.put("result", res);
		kr.kh.onairauction.vo2.AuctionRecordVO record = new kr.kh.onairauction.vo2.AuctionRecordVO();
		double nextPrice = record.getAr_next_bid_price(price);
		System.out.println(nextPrice);
		map.put("price", nextPrice);
		return map;
	}
	
}