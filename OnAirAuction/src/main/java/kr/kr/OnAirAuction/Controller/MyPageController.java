package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

@Controller
@RestController
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	// 구매자 -> 경매 참가 내역 (일반/실시간 경매)
	
	@RequestMapping(value = "/MyPage/participateAuctionList")
	public ModelAndView ParticipateAuctionList(ModelAndView mv, Criteria criteria) {
		
		ArrayList<ParticipateAuctionVO> list = myPageService.getPartAuctList(criteria);
		
		int totalCount = myPageService.getPartAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/participateAuctionList");
		
		return mv;
		
	}
	
	// 구매자 -> 경매 개최 내역
	
	@RequestMapping(value = "/MyPage/heldAuctionList")
	public ModelAndView HeldAcutionList(ModelAndView mv, Criteria criteria) {
		
		ArrayList<HeldAuctionVO> list = myPageService.getHeldAuctList(criteria);
		
		int totalCount = myPageService.getHeldAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		System.out.println(list);
		
		mv.addObject("pm", pm);
		
		mv.addObject("list", list);
		
		mv.setViewName("/MyPage/heldAuctionList");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/AuctionCancle/insert", method = RequestMethod.POST)
	public Map<String, Object> AuctionCancleInsert(@RequestBody AuctionCancleVO auctionCancle, HeldAuctionVO held){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = myPageService.insertAuctionCancle(auctionCancle);

		map.put("result", res);
		
		System.out.println(res);
		
		return map;
		
	}
	
	// 후기 등록
	
	@RequestMapping(value = "/MyPage/ReviewInsert", method = RequestMethod.GET)
	public ModelAndView ReviewInsert(ModelAndView mv, Integer re_ar_num) {
		
		System.out.println(re_ar_num);
		
		re_ar_num = re_ar_num == null ? 0 : re_ar_num;
		
		ParticipateAuctionVO pate = myPageService.getPate(re_ar_num);
		
		mv.addObject("re_ar_num", re_ar_num);
		
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
	
	// 후기 조회
	
	@RequestMapping(value = "/MyPage/ReviewList", method = RequestMethod.GET)
	
	public ModelAndView ReviewList(ModelAndView mv, Criteria criteria) {
		
		ArrayList<ReviewVO> list = myPageService.getReviewList(criteria);
		
		int totalCount = myPageService.getHeldAuctTotalCount(criteria);
		
		PageMaker pm = new PageMaker(totalCount, 1, criteria);
		
		mv.addObject("list",list);
		
		mv.addObject("pm", pm);
		
		mv.setViewName("/MyPage/ReviewList");
		
		return mv;
		
	}
	
	// 후기 상세 보기
	
	@RequestMapping(value = "/MyPage/ReviewDetail/{re_num}", method=RequestMethod.GET)
	
	public ModelAndView ReviewDetail(ModelAndView mv, @PathVariable("re_num") int re_num) {
		
		ReviewVO review = myPageService.getReview(re_num);
		
		ArrayList<FileVO> files = myPageService.getFileList(re_num);
		
		System.out.println(files);
		
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
	
}