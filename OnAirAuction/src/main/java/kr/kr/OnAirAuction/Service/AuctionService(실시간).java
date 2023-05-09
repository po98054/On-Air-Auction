package kr.kh.onairauction.service;

import java.util.ArrayList;

import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductVO;
import kr.kh.onairauction.vo2.ReportCategoryVO;
import kr.kh.onairauction.vo2.ReportVO;
import kr.kh.onairauction.vo2.VirtualAccountVO;

public interface AuctionService {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	boolean insertReport(ReportVO report);
	
	boolean insertMessage(MessageVO message);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord();
	
	MemberVO getUser(String me_id); //나중에 삭제
	
	boolean insertBid(Double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum);
	
	MembershipLevelVO selectMebership(String levelName);

	VirtualAccountVO selectAccount(String id);
	
	AuctionVO getAuction(String id); //나중에 삭제

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);
	
}