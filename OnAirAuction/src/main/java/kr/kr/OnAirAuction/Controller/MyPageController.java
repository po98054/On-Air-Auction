package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.Pagination.PageMaker;

import kr.kr.OnAirAuction.Service.MyPageService;

import kr.kr.OnAirAuction.Utils.MessageUtils;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryVO;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.PersonSearchVO;

import kr.kr.OnAirAuction.VO.ProductSearchVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.ReportVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

import kr.kr.OnAirAuction.VO.OrderAuctionVO;

import kr.kr.OnAirAuction.VO.OrderCancleVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionRecordVO;

import kr.kr.OnAirAuction.VO.AuctionVO;

import kr.kr.OnAirAuction.VO.OrderListVO;

@Controller
@RestController
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	// 구매자 -> 경매 참가 내역 (일반/실시간 경매)
	
	@RequestMapping(value = "/MyPage/participateAuctionList")
	public ModelAndView ParticipateAuctionList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		/*ArrayList<AuctionVO> auction = myPageService.SelectAuction();
		
		ArrayList<AuctionRecordVO> record = myPageService.SelectMaxAuctionRecord(auction);*/
		
		ArrayList<AuctionCategoryVO> AuctionCategory = myPageService.getAuctionCategory();
		
		ArrayList<ParticipateAuctionVO> list = myPageService.getPartAuctList(criteria, user);
		
		//System.out.println(auction);
		
		//System.out.println(record);
		
		System.out.println(list);
		
		int totalCount = myPageService.getPartAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		//mv.addObject("auction", auction);
		
		mv.addObject("user", user);
		
		mv.addObject("AuctionCategory", AuctionCategory);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/participateAuctionList");
		
		return mv;
		
	}
	
	// 구매자 -> 경매 개최 내역
	
	@RequestMapping(value = "/MyPage/heldAuctionList")
	public ModelAndView HeldAcutionList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<HeldAuctionVO> list = myPageService.getHeldAuctList(criteria, user);
		
		int totalCount = myPageService.getHeldAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user", user);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/heldAuctionList");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/AuctionCancle/insert", method = RequestMethod.POST)
	public Map<String, Object> AuctionCancleInsert(@RequestBody AuctionCancleVO auctionCancle){
		
		System.out.println(auctionCancle);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = myPageService.insertAuctionCancle(auctionCancle);
		
		map.put("result", res);
		
		System.out.println(res);
		
		return map;
		
	}
	
	@RequestMapping(value = "/Auction/update", method = RequestMethod.POST)
	public Map<String, Object> AuctionUpdate(@RequestBody HeldAuctionVO held){
		
		System.out.println(held);
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		boolean res = myPageService.updateHeld(held);
		
		map.put("res", res);
		
		System.out.println(res);
		
		return map;
		
	}
	
	// 구매자 주문 내역 조회
	
	@RequestMapping(value = "/MyPage/OrderAuctionList")
	public ModelAndView OrderAuctionList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<OrderAuctionVO> list = myPageService.getOrderAuctList(criteria, user);
		
		System.out.println(list);
		
		int totalCount = myPageService.getOrderAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user", user);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/OrderAuctionList");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/OrderCancle/insert", method = RequestMethod.POST)
	public Map<String, Object> OrderCancleInsert(@RequestBody OrderCancleVO OrderCancle){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = myPageService.insertOrderCancle(OrderCancle);
		
		map.put("result", res);
		
		System.out.println(res);
		
		return map;
		
	}
	
	// 환불 내역
	
	@RequestMapping(value = "/MyPage/RefundList")
	public ModelAndView RefundList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<OrderCancleVO> list = myPageService.getRefundList(criteria, user);
		
		int totalCount = myPageService.getRefundTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user", user);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/RefundList");
		
		return mv;
		
	}
	
	// 후기 등록
	
	@RequestMapping(value = "/MyPage/ReviewInsert", method = RequestMethod.GET)
	public ModelAndView ReviewInsert(ModelAndView mv, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		MemberVO user2 = myPageService.getUser(user);
		
		System.out.println(user2);
		
		mv.addObject("user", user);
		
		mv.addObject("user2", user2);
		
		mv.setViewName("/MyPage/ReviewInsert");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReviewInsert", method=RequestMethod.POST)
	
	public ModelAndView ReviewInsertPost(ModelAndView mv, ReviewVO review, MultipartFile []files) {
		
		
		if(myPageService.insertReview(review, files)) {
			
			System.out.println("게시글 등록 성공 !!");
			
		} else {
			
			System.out.println("게시글 등록 실패 !!");
			
		}
		
		mv.setViewName("/MyPage/ReviewInsert");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/OrderList", method = RequestMethod.POST)
	
	public Map<String, Object> OrderList(HttpSession session){
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<OrderListVO> order = myPageService.getOrder(user);
		
		System.out.println(order);
		
		map.put("order", order);
		
		return map;
		
	}
	
	// ajax를 통한 제품명을 누르면 화면에서 제품명 출력
	
	@RequestMapping(value = "/MyPage/OrderSelect", method = RequestMethod.POST)
	
	public Map<String, Object> OrderSelect(@RequestBody OrderListVO Order){
		
		System.out.println(Order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<OrderListVO> result = myPageService.SelectOrder(Order);
		
		System.out.println(result);
		
		map.put("result", result);
		
		return map;
		
	}
	
	// 후기 조회
	
	@RequestMapping(value = "/MyPage/ReviewList", method = RequestMethod.GET)
	
	public ModelAndView ReviewList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<ReviewVO> list = myPageService.getReviewList(criteria);
		
		int totalCount = myPageService.getHeldAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user", user);
		
		mv.addObject("list",list);
		
		mv.addObject("pm", pm);
		
		mv.setViewName("/MyPage/ReviewList");
		
		return mv;
		
	}
	
	// 후기 상세 보기
	
	@RequestMapping(value = "/MyPage/ReviewDetail/{re_num}", method=RequestMethod.GET)
	
	public ModelAndView ReviewDetail(ModelAndView mv, @PathVariable("re_num") int re_num, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ReviewVO review = myPageService.getReview(re_num);
		
		ArrayList<FileVO> files = myPageService.getFileList(re_num);
		
		System.out.println(files);
		
		mv.addObject("user", user);
		
		mv.addObject("review", review);
		
		mv.addObject("files", files);
		
		mv.setViewName("/MyPage/ReviewDetail");
		
		return mv;
		
	}
	
	// 후기 수정
	
	@RequestMapping(value = "/MyPage/ReviewUpdate/{re_num}", method = RequestMethod.GET)
	
	public ModelAndView ReviewUpdate(ModelAndView mv, @PathVariable("re_num") int re_num) {
		
		ReviewVO review = myPageService.getReview(re_num);
		
		ArrayList<FileVO> files = myPageService.getFileList(re_num);
		
		System.out.println(files);
		
		mv.addObject("review", review);
		
		mv.addObject("files", files);
		
		mv.setViewName("/MyPage/ReviewUpdate");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReviewUpdate/{re_num}", method = RequestMethod.POST)
	
	public ModelAndView ReviewUpdatePOST(ModelAndView mv, @PathVariable("re_num") int re_num, ReviewVO review, MultipartFile []files, int [] fileNums,
			
			HttpServletResponse response) {
		
		if(myPageService.updateReview(review, files, fileNums)) {
			
			MessageUtils.alertAndMovePage(response, "리뷰 수정에 성공했습니다..", "OnAirAuction", "/MyPage/ReviewUpdate/"+re_num);
			
		} else {
			
			System.out.println("리뷰 수정 실패!!!!");
			
		}
		
		return mv;
		
	}
	
	// 후기 삭제
	
	@RequestMapping(value = "/MyPage/ReviewDelete/{re_num}", method = RequestMethod.GET)
	
	public ModelAndView ReviewDelete(ModelAndView mv, @PathVariable("re_num") int re_num) {
		
		if(myPageService.deleteReview(re_num)) {
			
			System.out.println("리뷰 삭제 성공");
			
		} else {
			
			System.out.println("리뷰 삭제 실패");
			
		}
		
		mv.setViewName("redirect:/MyPage/ReviewList");
		
		return mv;
		
	}
	
	// 문의 사항 등록
	
	@RequestMapping(value = "/MyPage/InquiryInsert", method = RequestMethod.GET)
	
	public ModelAndView InquiryInsert(ModelAndView mv, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<InquiryCategoryVO> inquiryCategory = myPageService.getInquiryCategory();
		
		mv.addObject("user", user);
		
		mv.addObject("inquiryCategory", inquiryCategory);
		
		mv.setViewName("/MyPage/InquiryInsert");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/InquiryInsert", method = RequestMethod.POST)
	
	public ModelAndView InquiryInsertPost(ModelAndView mv, InquiryVO inquiry, MultipartFile []files, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(myPageService.insertInquiry(inquiry, files, user)) {
			
			System.out.println("문의 사항 등록 성공 !!");
			
		} else {
			
			System.out.println("문의 사항 등록 실패 !!");
			
		}
		
		mv.setViewName("redirect://MyPage/InquiryInsert");
		
		return mv;
		
	}
	
	// ajax를 통한 제품 조회
	
	@RequestMapping(value = "/ProductList", method = RequestMethod.POST)
	
	public Map<String, Object> ProductList(@RequestBody Criteria criteria){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProductSearchVO> product = myPageService.getProduct(criteria);
		
		map.put("product", product);
		
		return map;
		
	}
	
	// ajax를 통한 제품명을 누르면 화면에서 제품명 출력
	
	@RequestMapping(value = "/MyPage/ProductSelect", method = RequestMethod.POST)
	
	public Map<String, Object> ProductSelect(@RequestBody ProductSearchVO product){
		
		System.out.println(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProductSearchVO> result = myPageService.SelectProduct(product);
		
		System.out.println(result);
		
		map.put("result", result);
		
		return map;
		
	}
	
	// 문의 사항 수정
	
	@RequestMapping(value = "/MyPage/InquiryUpdate/{in_num}", method = RequestMethod.GET)
	
	public ModelAndView InquiryUpdate(ModelAndView mv, @PathVariable("in_num") int in_num, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(in_num);
		
		InquiryVO inquiry = myPageService.getInquiry(in_num, user);
		
		ArrayList<InquiryCategoryVO> inquiryCategory = myPageService.getInquiryCategory();
		
		ArrayList<FileVO> files = myPageService.getFileListByInquiry(in_num);
		
		System.out.println(inquiryCategory);
		
		System.out.println(files);
		
		mv.addObject("inquiry", inquiry);
		
		mv.addObject("files", files);
		
		mv.addObject("inquiryCategory", inquiryCategory);
		
		mv.setViewName("/MyPage/InquiryUpdate");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/InquiryUpdate/{in_num}", method = RequestMethod.POST)
	
	public ModelAndView InquiryUpdatePost(ModelAndView mv, @PathVariable("in_num") int in_num, InquiryVO inquiry, MultipartFile []files, int [] fileNums,
			
			HttpServletResponse response, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(in_num);
		
		System.out.println(files);
		
		System.out.println(fileNums);
		
		if(myPageService.UpdateInquiry(inquiry, files, fileNums, user)) {
			
			MessageUtils.alertAndMovePage(response, "문의 사항 수정에 성공했습니다..", "OnAirAuction", "/MyPage/InquiryUpdate/"+in_num);
			
		} else {
			
			System.out.println("문의 사항 수정 실패!!!!");
			
		}
		
		return mv;
		
	}
	
	// 문의 사항 조회
	
	@RequestMapping(value = "/MyPage/InquiryList", method = RequestMethod.GET)
	
	public ModelAndView InquiryList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<InquiryVO> list = myPageService.getInquiryList(criteria, user);
		
		int totalCount = myPageService.getInquiryTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user",user);
		
		mv.addObject("list",list);
		
		mv.addObject("pm", pm);
		
		mv.setViewName("/MyPage/InquiryList");
		
		return mv;
		
	}
	
	// 문의 사항 상세 보기
	
	@RequestMapping(value = "/MyPage/InquiryDetail/{in_num}", method=RequestMethod.GET)
	
	public ModelAndView InquiryDetail(ModelAndView mv, @PathVariable("in_num") int in_num, HttpSession session) {
		
		System.out.println(in_num);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		InquiryVO inquiry = myPageService.getInquiry(in_num, user);
		
		ArrayList<FileVO> files = myPageService.getFileListByInquiry(in_num);
		
		mv.addObject("inquiry", inquiry);
		
		mv.addObject("files", files);
		
		mv.setViewName("/MyPage/InquiryDetail");
		
		return mv;
		
	}
	
	// 문의 사항 삭제
	
	@RequestMapping(value = "/MyPage/InquiryDelete/{in_num}", method = RequestMethod.GET)
	
	public ModelAndView InquiryDelete(ModelAndView mv, @PathVariable("in_num") int in_num, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(myPageService.deleteInquiry(in_num, user)) {
			
			System.out.println("문의 사항 삭제 성공");
			
		} else {
			
			System.out.println("문의 사항 삭제 실패");
			
		}
		
		mv.setViewName("redirect:/MyPage/InquiryList");
		
		return mv;
		
	}
	
	// 문의 사항 답글 등록
	
	@RequestMapping(value = "/MyPage/ReplyInquiryInsert/{in_num}", method = RequestMethod.GET)
	
	public ModelAndView ReplyInquiryInsert(ModelAndView mv, @PathVariable("in_num") int in_num) {
		
		ArrayList<InquiryCategoryVO> inquiryCategory = myPageService.getInquiryCategory();
		
		InquiryVO inquiry = myPageService.getInquiryByNum(in_num);
		
		mv.addObject("inquiryCategory", inquiryCategory);
		
		mv.addObject("inquiry", inquiry);
		
		mv.setViewName("/MyPage/ReplyInquiryInsert");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReplyInquiryInsert", method = RequestMethod.POST)
	
	public ModelAndView ReplyInquiryInsertPost(ModelAndView mv, InquiryVO inquiry, MultipartFile []files, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(myPageService.ReplyInquiryInsert(inquiry, files, user)) {
			
			System.out.println("문의 사항 등록 성공 !!");
			
		} else {
			
			System.out.println("문의 사항 등록 실패 !!");
			
		}
		
		mv.setViewName("redirect:/MyPage/InquiryList");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReplyInquiryUpdate/{in_num}", method = RequestMethod.GET)
	
	public ModelAndView ReplyInquiryUpdate(ModelAndView mv, @PathVariable("in_num") int in_num, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(in_num);
		
		InquiryVO inquiry = myPageService.getInquiry(in_num, user);
		
		ArrayList<InquiryCategoryVO> inquiryCategory = myPageService.getInquiryCategory();
		
		ArrayList<FileVO> files = myPageService.getFileListByInquiry(in_num);
		
		System.out.println(inquiryCategory);
		
		System.out.println(files);
		
		mv.addObject("inquiry", inquiry);
		
		mv.addObject("files", files);
		
		mv.addObject("inquiryCategory", inquiryCategory);
		
		mv.setViewName("/MyPage/ReplyInquiryUpdate");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReplyInquiryUpdate/{in_num}", method = RequestMethod.POST)
	
	public ModelAndView ReplyInquiryUpdatePost(ModelAndView mv, @PathVariable("in_num") int in_num, InquiryVO inquiry, MultipartFile []files, int [] fileNums,
			
			HttpServletResponse response, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(in_num);
		
		System.out.println(files);
		
		System.out.println(fileNums);
		
		if(myPageService.UpdateReplyInquiry(inquiry, files, fileNums, user)) {
			
			MessageUtils.alertAndMovePage(response, "문의 사항 수정에 성공했습니다..", "OnAirAuction", "/MyPage/ReplyInquiryUpdate/"+in_num);
			
		} else {
			
			System.out.println("문의 사항 수정 실패!!!!");
			
		}
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReplyInquirydelete/{in_num}", method = RequestMethod.GET)
	
	public ModelAndView ReplyInquirydelete(ModelAndView mv, @PathVariable("in_num") int in_num, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(myPageService.deleteInquiry(in_num, user)) {
			
			System.out.println("문의 사항 삭제 성공");
			
		} else {
			
			System.out.println("문의 사항 삭제 실패");
			
		}
		
		mv.setViewName("redirect:/MyPage/InquiryList");
		
		return mv;
		
	}
	
	// 신고 등록
	
	@RequestMapping(value = "/MyPage/ReportInsert", method = RequestMethod.GET)
	
	public ModelAndView ReportInsert(ModelAndView mv, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<ReportCategoryVO> reportCategory = myPageService.getReportCategory();
		
		mv.addObject("reportCategory", reportCategory);
		
		mv.addObject("user", user);
		
		mv.setViewName("/MyPage/ReportInsert");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/ReportInsert", method = RequestMethod.POST)
	
	public ModelAndView ReportInsertPost(ModelAndView mv, ReportVO report, MultipartFile []files, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(myPageService.insertReport(report, files, user)) {
			
			System.out.println("신고 등록 성공 !!");
			
		} else {
			
			System.out.println("신고 등록 실패 !!");
			
		}
		
		mv.setViewName("redirect://MyPage/ReportInsert");
		
		return mv;
		
	}
	
	// ajax를 통한 유저 정보 조회
	
	@RequestMapping(value = "/PersonList", method = RequestMethod.POST)
	
	public Map<String, Object> PersonList(@RequestBody Criteria criteria){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<PersonSearchVO> person = myPageService.getPerson(criteria);
		
		System.out.println(person);
		
		map.put("person", person);
		
		return map;
		
	}
	
	// ajax를 통한 유저 아이디 누르면 화면에서 유저 아이디 출력
	
	@RequestMapping(value = "/MyPage/MemberSelect", method = RequestMethod.POST)
	
	public Map<String, Object> MemberSelect(@RequestBody PersonSearchVO person){
		
		System.out.println(person);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<PersonSearchVO> result = myPageService.SelectPerson(person);
		
		System.out.println(result);
		
		map.put("result", result);
		
		return map;
		
	}
	
	// 신고 조회
	
	@RequestMapping(value = "/MyPage/ReportList", method = RequestMethod.GET)
		
	public ModelAndView ReportList(ModelAndView mv, Criteria criteria, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
			
		ArrayList<ReportVO> list = myPageService.getReportList(criteria, user);
			
		int totalCount = myPageService.getReportTotalCount(criteria);
			
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("user",user);
			
		mv.addObject("list",list);
			
		mv.addObject("pm", pm);
			
		mv.setViewName("/MyPage/ReportList");
			
		return mv;
			
	}
	
	// 신고 상세 보기
	
	@RequestMapping(value = "/MyPage/ReportDetail/{re_num}", method=RequestMethod.GET)
		
	public ModelAndView ReportDetail(ModelAndView mv, @PathVariable("re_num") int re_num, HttpSession session) {
			
		System.out.println(re_num);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
			
		ReportVO report = myPageService.getReport(re_num, user);
			
		ArrayList<FileVO> files = myPageService.getFileListByReport(re_num);
			
		mv.addObject("report", report);
			
		mv.addObject("files", files);
			
		mv.setViewName("/MyPage/ReportDetail");
			
		return mv;
			
	}
	
	// 신고 수정
	
	@RequestMapping(value = "/MyPage/ReportUpdate/{re_num}", method = RequestMethod.GET)
		
	public ModelAndView ReportUpdate(ModelAndView mv, @PathVariable("re_num") int re_num, HttpSession session) {
			
		System.out.println(re_num);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
			
		ReportVO report = myPageService.getReport(re_num, user);
		
		ArrayList<ReportCategoryVO> reportCategory = myPageService.getReportCategory();
			
		ArrayList<FileVO> files = myPageService.getFileListByReport(re_num);
			
		System.out.println(reportCategory);
			
		System.out.println(files);
			
		mv.addObject("report", report);
			
		mv.addObject("files", files);
			
		mv.addObject("reportCategory", reportCategory);
			
		mv.setViewName("/MyPage/ReportUpdate");
			
		return mv;
			
	}
		
	@RequestMapping(value = "/MyPage/ReportUpdate/{re_num}", method = RequestMethod.POST)
		
	public ModelAndView InquiryUpdatePost(ModelAndView mv, @PathVariable("re_num") int re_num, ReportVO report, MultipartFile []files, int [] fileNums,
				
			HttpServletResponse response, HttpSession session) {
			
		System.out.println(re_num);
			
		System.out.println(files);
			
		System.out.println(fileNums);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
			
		if(myPageService.UpdateReport(report, files, fileNums, user)) {
				
			MessageUtils.alertAndMovePage(response, "신고 수정에 성공했습니다..", "OnAirAuction", "/MyPage/ReportUpdate/"+re_num);
				
		} else {
				
			System.out.println("신고 수정 실패!!!!");
				
		}
			
		return mv;
			
	}
	
	// 신고 삭제
	
	@RequestMapping(value = "/MyPage/ReportDelete/{re_num}", method = RequestMethod.GET)
		
	public ModelAndView ReportDelete(ModelAndView mv, @PathVariable("re_num") int re_num) {
			
		if(myPageService.deleteReport(re_num)) {
				
			System.out.println("신고 삭제 성공");
				
		} else {
				
			System.out.println("신고 삭제 실패");
				
		}
			
		mv.setViewName("redirect:/MyPage/ReportList");
			
		return mv;
			
	}
	
	// 회원 정보 수정
	
	@RequestMapping(value = "/MyPage/MemberUpdate/{me_id}", method = RequestMethod.GET)
	
	public ModelAndView MemberUpdate(ModelAndView mv, @PathVariable("me_id") String me_id, HttpSession session) {
		
		System.out.println(me_id);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		user = myPageService.getMember(me_id, user);
		
		mv.addObject("user", user);
		
		mv.setViewName("/MyPage/MemberUpdate");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/MyPage/MemberUpdate/{me_id}", method = RequestMethod.POST)
	
	public ModelAndView MemberUpdatePost(ModelAndView mv, @PathVariable("me_id") String me_id, MemberVO user, HttpSession session, HttpServletResponse response) {
		
		if(myPageService.UpdateMember(user)) {
			
			System.out.println("회원 정보 수정 성공");
			
			MessageUtils.alertAndMovePage(response, "회원 정보를 수정했습니다.", "OnAirAuction", "/MyPage/MemberUpdate/"+ me_id);
			
		} else {
			
			System.out.println("회원 정보 수정 실패!!!!");
			
		}
		
		return mv;
		
	}
	
}