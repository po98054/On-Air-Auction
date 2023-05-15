package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryVO;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.OrderAuctionVO;

import kr.kr.OnAirAuction.VO.OrderCancleVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.ProductSearchVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.ReportVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

import kr.kr.OnAirAuction.VO.PersonSearchVO;

public interface MyPageService {
	
	// 경매 참가 내역 조회 서비스

	ArrayList<ParticipateAuctionVO> getPartAuctList(Criteria criteria, MemberVO user);

	int getPartAuctTotalCount(Criteria criteria);
	
	// 구매자 -> 경매 개최 내역

	ArrayList<HeldAuctionVO> getHeldAuctList(Criteria criteria);

	int getHeldAuctTotalCount(Criteria criteria);

	ArrayList<HeldAuctionVO> getHeldList(int ac_num);

	boolean insertAuctionCancle(AuctionCancleVO auctionCancle);
	
	// 후기 등록

	boolean insertReview(ReviewVO review, MultipartFile[] files);

	ParticipateAuctionVO getPate(Integer re_ar_num);
	
	// 후기 조회

	ArrayList<ReviewVO> getReviewList(Criteria criteria);
	
	// 후기 수정

	ReviewVO getReview(int re_num);

	ArrayList<FileVO> getFileList(int re_num);

	boolean updateReview(ReviewVO review, MultipartFile[] files, int[] fileNums);
	
	// 후기 삭제

	boolean deleteReview(int re_num);

	boolean updateHeldAuction(ArrayList<HeldAuctionVO> held);

	HeldAuctionVO getHeld(int ac_num);

	boolean updateHeld(HeldAuctionVO held);

	ArrayList<ProductSearchVO> getProduct(Criteria criteria);

	ArrayList<ProductSearchVO> SelectProduct(ProductSearchVO product);
	
	// 문의 사항 등록

	ArrayList<InquiryCategoryVO> getInquiryCategory();

	boolean insertInquiry(InquiryVO inquiry, MultipartFile[] files, MemberVO user);
	
	// 문의 사항 조회

	ArrayList<InquiryVO> getInquiryList(Criteria criteria, MemberVO user);

	int getInquiryTotalCount(Criteria criteria);
	
	// 문의 사항 상세 보기

	InquiryVO getInquiry(int in_num, MemberVO user);
	
	ArrayList<FileVO> getFileListByInquiry(int in_num);
	
	// 문의 사항 수정
	
	boolean UpdateInquiry(InquiryVO inquiry, MultipartFile[] files, int[] fileNums, MemberVO user);
	
	// 문의 사항 삭제

	boolean deleteInquiry(int in_num, MemberVO user);
	
	// 신고 등록

	ArrayList<ReportCategoryVO> getReportCategory();
	
	boolean insertReport(ReportVO report, MultipartFile[] files, MemberVO user);
	
	// ajax를 통한 아이디 조회

	ArrayList<PersonSearchVO> getPerson(Criteria criteria);

	ArrayList<PersonSearchVO> SelectPerson(PersonSearchVO person);
	
	// 신고 조회

	ArrayList<ReportVO> getReportList(Criteria criteria, MemberVO user);

	int getReportTotalCount(Criteria criteria);
	
	// 신고 상세 보기

	ReportVO getReport(int re_num, MemberVO user);

	ArrayList<FileVO> getFileListByReport(int re_num);
	
	// 신고 수정

	boolean UpdateReport(ReportVO report, MultipartFile[] files, int[] fileNums, MemberVO user);
	
	// 신고 삭제

	boolean deleteReport(int re_num);
	
	// 구매자 주문 내역 조회

	ArrayList<OrderAuctionVO> getOrderAuctList(Criteria criteria);

	int getOrderAuctTotalCount(Criteria criteria);

	boolean insertOrderCancle(OrderCancleVO orderCancle);
	
	// 환불 내역 조회

	ArrayList<OrderCancleVO> getRefundList(Criteria criteria);

	int getRefundTotalCount(Criteria criteria);
	
	// 회원 정보 수정

	MemberVO getMember(String me_id, MemberVO user);

	boolean UpdateMember(MemberVO member);
	
	// 회원 탈퇴

	boolean deleteMember(MemberVO user);

	InquiryVO getInquiryByNum(int in_num);

	boolean ReplyInquiryInsert(InquiryVO inquiry, MultipartFile[] files, MemberVO user);

	boolean UpdateReplyInquiry(InquiryVO inquiry, MultipartFile[] files, int[] fileNums, MemberVO user);

	ArrayList<AuctionCategoryVO> getAuctionCategory();

	/*ArrayList<AuctionVO> SelectAuction();

	ArrayList<AuctionRecordVO> SelectMaxAuctionRecord(ArrayList<AuctionVO> auction);*/

}
