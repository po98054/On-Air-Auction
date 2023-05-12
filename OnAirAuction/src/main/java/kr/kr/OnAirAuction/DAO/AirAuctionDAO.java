package kr.kh.onairauction.dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductVO;
import kr.kh.onairauction.vo2.ReportCategoryVO;
import kr.kh.onairauction.vo2.ReportVO;
import kr.kh.onairauction.vo2.VirtualAccountVO;

public interface AuctionDAO {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")ReportVO report);
	
	int insertMessage(@Param("m")MessageVO note);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord();

	MemberVO selectMember(String id); //나중에 삭제

	MembershipLevelVO selectMembership(String levelName);

	VirtualAccountVO selectAccount(String id);

	void insertAuctionRecord(@Param("p")Double price, @Param("i")String id, @Param("n")int auctionNum);

	AuctionVO selectAuction(String id); //나중에 삭제

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);
}