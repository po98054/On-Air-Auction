package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.MembershipLevelVO;

import kr.kr.OnAirAuction.VO.RatingStandardVO;

import kr.kr.OnAirAuction.Service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(ModelAndView mv, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<ReportCategoryVO> list = adminService.getReportCategory(user);
		
		ArrayList<InquiryCategoryVO> ic = adminService.getInquiryCategor(user);
		
		ArrayList<AuctionCategoryVO> ac = adminService.getAuctionCategory(user);
		
		ArrayList<MembershipLevelVO> ms = adminService.getMembership(user);
		
		ArrayList<RatingStandardVO> rs = adminService.getRatingStandard(user);
		
		System.out.println(list);
		
		mv.addObject("list", list);
		
		mv.addObject("ic", ic);
		
		mv.addObject("ac", ac);
		
		mv.addObject("ms", ms);
		
		mv.addObject("rs", rs);
		
		mv.setViewName("/Admin/Admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/ReportCategory/insert", method=RequestMethod.POST)
	
	public ModelAndView ReportCategoryInsert(ModelAndView mv, ReportCategoryVO rc, HttpSession session) {
		
		System.out.println(rc);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.insertReportCategory(rc, user);
		
		if(res) {
			
			System.out.println("신고 카데고리 등록 성공!!!");
			
		} else {
			
			System.out.println("신고 카데고리 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/ReportCategory/update", method=RequestMethod.POST)
	
	public ModelAndView ReportCategoryUpdate(ModelAndView mv, ReportCategoryVO rc, HttpSession session) {
		
		System.out.println(rc);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.updateReportCategory(rc, user);
		
		if(res) {
			
			System.out.println("신고 카데고리 수정 성공!!!");
			
		} else {
			
			System.out.println("신고 카데고리 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/ReportCategory/delete", method=RequestMethod.POST)
	
	public ModelAndView ReportCategoryDelete(ModelAndView mv, ReportCategoryVO rc) {
		
		boolean res = adminService.deleteReportCategory(rc.getRc_num());
		
		if(res) {
			
			System.out.println("신고 카데고리 삭제 성공!!!");
			
		} else {
			
			System.out.println("신고 카데고리 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/InquiryCategory/insert", method=RequestMethod.POST)
	
	public ModelAndView InquiryCategoryInsert(ModelAndView mv, InquiryCategoryVO ic, HttpSession session) {
		
		System.out.println(ic);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.insertInquiryCategory(ic, user);
		
		if(res) {
			
			System.out.println("문의 카데고리 등록 성공!!!");
			
		} else {
			
			System.out.println("문의 카데고리 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/InquiryCategory/update", method=RequestMethod.POST)
	
	public ModelAndView InquiryCategoryUpdate(ModelAndView mv, InquiryCategoryVO ic, HttpSession session) {
		
		System.out.println(ic);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.updateInquiryCategory(ic, user);
		
		if(res) {
			
			System.out.println("문의 카데고리 수정 성공!!!");
			
		} else {
			
			System.out.println("문의 카데고리 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/InquiryCategory/delete", method=RequestMethod.POST)
	
	public ModelAndView InquiryCategoryDelete(ModelAndView mv, InquiryCategoryVO ic) {
		
		boolean res = adminService.deleteInquiryCategory(ic.getIc_num());
		
		if(res) {
			
			System.out.println("문의 카데고리 삭제 성공!!!");
			
		} else {
			
			System.out.println("문의 카데고리 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/AuctionCategory/insert", method=RequestMethod.POST)
	
	public ModelAndView AuctionCategoryInsert(ModelAndView mv, AuctionCategoryVO ac, HttpSession session) {
		
		System.out.println(ac);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.insertAuctionCategory(ac, user);
		
		if(res) {
			
			System.out.println("경매 카데고리 등록 성공!!!");
			
		} else {
			
			System.out.println("경매 카데고리 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/AuctionCategory/update", method=RequestMethod.POST)
	
	public ModelAndView ReportCategoryUpdate(ModelAndView mv, AuctionCategoryVO ac, HttpSession session) {
		
		System.out.println(ac);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.updateAuctionCategory(ac, user);
		
		if(res) {
			
			System.out.println("경매 카데고리 수정 성공!!!");
			
		} else {
			
			System.out.println("경매 카데고리 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/AuctionCategory/delete", method=RequestMethod.POST)
	
	public ModelAndView ReportCategoryDelete(ModelAndView mv, AuctionCategoryVO ac) {
		
		boolean res = adminService.deleteAuctionCategory(ac.getAc_num());
		
		if(res) {
			
			System.out.println("경매 카데고리 삭제 성공!!!");
			
		} else {
			
			System.out.println("경매 카데고리 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/Membership/insert", method=RequestMethod.POST)
	
	public ModelAndView InquiryCategoryInsert(ModelAndView mv, MembershipLevelVO ms, HttpSession session) {
		
		System.out.println(ms);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.insertMembership(ms, user);
		
		if(res) {
			
			System.out.println("회원 등급 등록 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/Membership/update", method=RequestMethod.POST)
	
	public ModelAndView MembershipUpdate(ModelAndView mv, MembershipLevelVO ms, HttpSession session) {
		
		System.out.println(ms);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.updateMembership(ms, user);
		
		if(res) {
			
			System.out.println("회원 등급 수정 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/Membership/delete", method=RequestMethod.POST)
	
	public ModelAndView MembershipDelete(ModelAndView mv, MembershipLevelVO ms) {
		
		boolean res = adminService.deleteMembership(ms.getMl_name());
		
		if(res) {
			
			System.out.println("회원 등급 삭제 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/RatingStandard/insert", method=RequestMethod.POST)
	
	public ModelAndView RatingStandardInsert(ModelAndView mv, RatingStandardVO rs, HttpSession session) {
		
		System.out.println(rs);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.insertRatingStandard(rs, user);
		
		if(res) {
			
			System.out.println("회원 등급 조건 등록 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 조건 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/RatingStandard/update", method=RequestMethod.POST)
	
	public ModelAndView RatingStandardUpdate(ModelAndView mv, RatingStandardVO rs, HttpSession session) {
		
		System.out.println(rs);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = adminService.updateRatingStandard(rs, user);
		
		if(res) {
			
			System.out.println("회원 등급 조건 수정 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 조건 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/RatingStandard/delete", method=RequestMethod.POST)
	
	public ModelAndView RatingStandardDelete(ModelAndView mv, RatingStandardVO rs) {
		
		boolean res = adminService.deleteRatingStandard(rs.getRs_ml_name());
		
		if(res) {
			
			System.out.println("회원 등급 조건 삭제 성공!!!");
			
		} else {
			
			System.out.println("회원 등급 조건 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/admin");
		
		return mv;
	}

}