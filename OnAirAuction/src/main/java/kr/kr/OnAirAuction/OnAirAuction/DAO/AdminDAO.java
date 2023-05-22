package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.MembershipLevelVO;

import kr.kr.OnAirAuction.VO.RatingStandardVO;

public interface AdminDAO {

	ArrayList<ReportCategoryVO> selectReportCategory();

	void insertReportCategory(@Param("rc")ReportCategoryVO rc);

	int updateReportCategory(@Param("rc")ReportCategoryVO rc);

	boolean deleteReportCategory(@Param("rc_num")int rc_num);
	
	ArrayList<InquiryCategoryVO> selectInquiryCategory();

	void insertInquiryCategory(@Param("ic")InquiryCategoryVO ic);

	int updateInquiryCategory(@Param("ic")InquiryCategoryVO ic);

	boolean deleteInquiryCategory(@Param("ic_num")int ic_num);
	
	ArrayList<AuctionCategoryVO> selectAuctionCategory();

	void insertAuctionCategory(@Param("ac")AuctionCategoryVO ac);

	int updateAuctionCategory(@Param("ac")AuctionCategoryVO ac);

	boolean deleteAuctionCategory(@Param("ac_num")int ac_num);
	
	ArrayList<MembershipLevelVO> selectMembership();

	void insertMembership(@Param("ms")MembershipLevelVO ms);

	int updateMembership(@Param("ms")MembershipLevelVO ms);

	boolean deleteMembership(@Param("ml_name")String ml_name);

}