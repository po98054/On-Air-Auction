package kr.kh.onairauction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface AuctionDAO {
	String getEmail(@Param("id")String id);
	
	ArrayList<kr.kh.onairauction.vo2.ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")kr.kh.onairauction.vo2.ReportVO report);
	
	int insertNote(@Param("n")MessageVO note);
	
	ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> selectAuctionRecord();

	kr.kh.onairauction.vo2.MemberVO selectMember(String id);

	kr.kh.onairauction.vo2.ProductVO selectProduct(int num);

	kr.kh.onairauction.vo2.MembershipLevelVO selectMembership(String levelName);

	kr.kh.onairauction.vo2.VirtualAccountVO selectAccount(String id);

	void insertAuctionRecord(@Param("p")Double price, @Param("i")String id, @Param("n")int auctionNum);

	AuctionVO selectAuction(String id);
}