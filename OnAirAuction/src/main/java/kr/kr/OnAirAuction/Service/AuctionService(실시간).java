package kr.kh.onairauction.service;

import java.util.ArrayList;

import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.VirtualAccountVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MessageVO;

public interface AuctionService {
	String getEmail(String id);
	
	ArrayList<kr.kh.onairauction.vo2.ReportCategoryVO> getReportCategoryName();

	boolean register(kr.kh.onairauction.vo2.ReportVO report);
	
	boolean registerNote(MessageVO note);
	
	ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> getAuctionRecordList();
	
	kr.kh.onairauction.vo2.MemberVO getUser(String id);
	
	kr.kh.onairauction.vo2.ProductVO getProduct(int num);

	boolean insertBid(Double price, int expense, kr.kh.onairauction.vo2.VirtualAccountVO account, kr.kh.onairauction.vo2.MemberVO user, int auctionNum);
	
	kr.kh.onairauction.vo2.MembershipLevelVO getMebership(String levelName);

	kr.kh.onairauction.vo2.VirtualAccountVO selectAccount(String id);
	
	AuctionVO getAuction(String id);
	
}