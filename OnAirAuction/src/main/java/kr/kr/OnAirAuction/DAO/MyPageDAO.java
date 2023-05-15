package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryVO;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.OrderAuctionVO;

import kr.kr.OnAirAuction.VO.OrderCancleVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.PersonSearchVO;

import kr.kr.OnAirAuction.VO.ProductSearchVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

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
	
	// 문의 사항 등록

	ArrayList<InquiryCategoryVO> selectAllInquiryCategory();

	void insertInquiry(@Param("inquiry")InquiryVO inquiry);
	
	// 문의 사항 조회

	ArrayList<InquiryVO> selectInquiryList(@Param("criteria")Criteria criteria, @Param("user")MemberVO user);

	int selectInquiryTotalCount(@Param("criteria")Criteria criteria);
	
	// 문의 사항 상세 보기

	InquiryVO selectInquiry(@Param("in_num")int in_num);
	
	ArrayList<FileVO> selectFileListByInquiry(@Param("in_num")int in_num);
	
	// 문의 사항 수정
	
	int updateInquiry(@Param("inquiry")InquiryVO inquiry);

	void insertFileByInquiry(@Param("file")FileVO fileVo, @Param("in_num")int in_num);
	
	// 문의 사항 삭제

	int deleteInquiry(@Param("in_num")int in_num);
	
	// 신고 등록

	ArrayList<ReportCategoryVO> selectAllReportCategory();
	
	void insertReport(@Param("report")ReportVO report);

	// ajax를 통한 아이디 조회
	
	ArrayList<PersonSearchVO> selectPerson(@Param("criteria")Criteria criteria);

	ArrayList<PersonSearchVO> selectPersonName(@Param("person")PersonSearchVO person);

	void insertFileByReport(@Param("file")FileVO fileVo, @Param("re_num")int re_num);
	
	// 신고 조회

	ArrayList<ReportVO> selectReportList(@Param("criteria")Criteria criteria, @Param("user")MemberVO user);

	int selectReportTotalCount(@Param("criteria")Criteria criteria);
	
	// 신고 상세 보기

	ReportVO selectReport(@Param("re_num")int re_num);

	ArrayList<FileVO> selectFileListByReport(@Param("re_num")int re_num);
	
	// 신고 수정

	int updateReport(@Param("report")ReportVO report);
	
	// 신고 삭제

	int deleteReport(@Param("re_num")int re_num);
	
	// 구매자 주문 내역 조회

	ArrayList<OrderAuctionVO> selectOrderAuctList(@Param("criteria")Criteria criteria);

	int selectOrderAuctTotalCount(@Param("criteria")Criteria criteria);

	int insertOrderCancle(@Param("refund")OrderCancleVO orderCancle);
	
	// 환불 내역 조회

	ArrayList<OrderCancleVO> selectRefundList(@Param("criteria")Criteria criteria);

	int selectRefundTotalCount(@Param("criteria")Criteria criteria);
	
	// 회원 정보 수정

	MemberVO selectMember(@Param("me_id")String me_id);

	int updateMember(@Param("member")MemberVO member);
	
	// 회원 탈퇴
	
	int deleteMember(@Param("user")MemberVO user);

	InquiryVO selectInquiryByNum(@Param("in_num")int in_num);

	void insertInquiryReply(@Param("inquiry")InquiryVO inquiry);

	int updateReplyInquiry(@Param("inquiry")InquiryVO inquiry);

}
