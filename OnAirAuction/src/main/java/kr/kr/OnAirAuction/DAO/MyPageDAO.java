package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryVO;

import kr.kr.OnAirAuction.VO.ParticipateAuction2VO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.ProductSearchVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.ReportPersonVO;

import kr.kr.OnAirAuction.VO.ReportVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

public interface MyPageDAO {
	
	// 경매 참가 내역 조회 서비스

	ArrayList<ParticipateAuctionVO> selectPartAuctList(@Param("criteria")Criteria criteria);

	int selectPartAuctTotalCount(@Param("criteria")Criteria criteria);
	
	// 경매 개최 내역 조회 서비스

	ArrayList<HeldAuctionVO> selectHeldAuctList(@Param("criteria")Criteria criteria);

	int selectHeldAuctTotalCount(@Param("criteria")Criteria criteria);

	ArrayList<HeldAuctionVO> selectHeldList(@Param("ac_num")int ac_num);

	int insertAuctionCancle(@Param("auctionCancle")AuctionCancleVO auctionCancle);
	
	// 후기 등록

	void insertReview(@Param("review")ReviewVO review);

	ParticipateAuctionVO selectAuction(@Param("re_ar_num")Integer re_ar_num);

	void insertFile(@Param("fileVO")FileVO fileVo, @Param("re_num")int re_num);
	
	// 후기 조회

	ArrayList<ReviewVO> selectReviewList(@Param("criteria")Criteria criteria);

	ReviewVO selectReview(@Param("re_num")int re_num);

	ArrayList<FileVO> selectFileList(@Param("re_num")int re_num);
	
	// 후기 수정

	int updateReview(@Param("review")ReviewVO review);
	
	// 첨부 파일 삭제

	void deleteFile(@Param("file")FileVO file);
	
	// 첨부 파일 찾기

	FileVO selectFile(@Param("fi_num")int fileNum);
	
	// 후기 삭제

	int deleteReview(@Param("re_num")int re_num);

	HeldAuctionVO selectHeld(@Param("ac_num")int ac_num);

	int updateHeld(@Param("held")HeldAuctionVO held);

	ArrayList<ProductSearchVO> selectProduct(@Param("criteria")Criteria criteria);

	ArrayList<ProductSearchVO> selectProductName(@Param("product")ProductSearchVO product);

	ArrayList<InquiryCategoryVO> selectAllInquiryCategory();

	void insertInquiry(@Param("inquiry")InquiryVO inquiry);

	ArrayList<InquiryVO> selectInquiryList(@Param("criteria")Criteria criteria);

	int selectInquiryTotalCount(@Param("criteria")Criteria criteria);

	InquiryVO selectInquiry(@Param("in_num")int in_num);

	int deleteInquiry(@Param("in_num")int in_num);

	ArrayList<ReportCategoryVO> selectAllReportCategory();

	ArrayList<ReportPersonVO> selectPerson(@Param("criteria")Criteria criteria);

	ArrayList<ReportPersonVO> selectPersonName(@Param("member")ReportPersonVO person);

	ArrayList<ReportVO> selectReportList(@Param("criteria")Criteria criteria);

	int selectReportTotalCount(@Param("criteria")Criteria criteria);

	ReportVO selectReport(@Param("re_num")int re_num);

	int deleteReport(@Param("re_num")int re_num);

	ArrayList<ParticipateAuction2VO> selectPartAuctList2(@Param("criteria")Criteria criteria);
	
	int selectPartAuctTotalCount2(@Param("criteria")Criteria criteria);

}
