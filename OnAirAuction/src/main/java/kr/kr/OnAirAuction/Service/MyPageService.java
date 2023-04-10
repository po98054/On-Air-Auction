package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

public interface MyPageService {
	
	// 경매 참가 내역 조회 서비스

	ArrayList<ParticipateAuctionVO> getPartAuctList(Criteria criteria);

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

	ReviewVO getReview(int re_num);

	ArrayList<FileVO> getFileList(int re_num);
	
}
