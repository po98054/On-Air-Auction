package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.MembershipLevelVO;

import kr.kr.OnAirAuction.VO.RatingStandardVO;

public interface AdminService {
	
	ArrayList<ReportCategoryVO> getReportCategory(MemberVO user);

	boolean insertReportCategory(ReportCategoryVO rc, MemberVO user);

	boolean updateReportCategory(ReportCategoryVO rc, MemberVO user);

	boolean deleteReportCategory(int rc_num);
	
	ArrayList<InquiryCategoryVO> getInquiryCategor(MemberVO user);

	boolean insertInquiryCategory(InquiryCategoryVO ic, MemberVO user);

	boolean updateInquiryCategory(InquiryCategoryVO ic, MemberVO user);

	boolean deleteInquiryCategory(int ic_num);
	
	ArrayList<AuctionCategoryVO> getAuctionCategory(MemberVO user);

	boolean insertAuctionCategory(AuctionCategoryVO ac, MemberVO user);

	boolean updateAuctionCategory(AuctionCategoryVO ac, MemberVO user);

	boolean deleteAuctionCategory(int ac_num);
	
	ArrayList<MembershipLevelVO> getMembership(MemberVO user);

	boolean insertMembership(MembershipLevelVO ms, MemberVO user);

	boolean updateMembership(MembershipLevelVO ms, MemberVO user);

	boolean deleteMembership(String ml_name);
	
	ArrayList<RatingStandardVO> getRatingStandard(MemberVO user);

	boolean insertRatingStandard(RatingStandardVO rs, MemberVO user);

	boolean updateRatingStandard(RatingStandardVO rs, MemberVO user);

	boolean deleteRatingStandard(String rs_ml_name);

}