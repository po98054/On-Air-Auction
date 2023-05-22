package kr.kh.onairauction.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.AuctionVO;
import kr.kh.onairauction.vo.BoardListVO;
import kr.kh.onairauction.vo.ChattingVO;
import kr.kh.onairauction.vo.FileVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.MessageVO;
import kr.kh.onairauction.vo.AuctionOrderVO;
import kr.kh.onairauction.vo.ProductLikeVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.SellerLikeVO;
import kr.kh.onairauction.vo.VirtualAccountVO;

public interface AuctionDAO {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	int insertReport(@Param("r")ReportVO report);
	
	int insertMessage(@Param("m")MessageVO note);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(int auctionNum);

	MemberVO selectMember(String id); //나중에 삭제

	MembershipLevelVO selectMembership(String levelName);

	VirtualAccountVO selectAccount(String id);

	void insertAuctionRecord(@Param("p")double price, @Param("i")String id, @Param("n")int auctionNum);

	AuctionVO selectAuction(int num); 

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);

	SellerLikeVO selectSellerLike(@Param("userId")String userId, @Param("sellerId")String sellerId);

	void insertSellerLike(@Param("userId")String userId, @Param("sellerId")String sellerId, @Param("num")int num);

	void updateSellerLike(@Param("s")SellerLikeVO table, @Param("sellerLikeState")int sellerLikeState);

	ProductLikeVO selectProductLike(@Param("productCode")int productCode, @Param("userId")String userId);

	void insertProductLike(@Param("productCode")int productCode, @Param("userId")String userId, @Param("num")int num);

	void updateProductLike(@Param("p")ProductLikeVO table, @Param("productLikeState")int productLikeState);

	void insertAuctionRecord2(@Param("date")String au_start_day, @Param("price")int pr_start_price, @Param("id")String me_id, @Param("num")int au_num);

	void updateAuction(@Param("a")AuctionVO auction);

	void updateProduct(@Param("p")ProductVO product);

	ArrayList<BoardListVO> selectBoardList(String me_id);

	void insertWithdraw(@Param("s")double sum, @Param("b")String bidder);

	void updateVirtualAccount(@Param("b") String bidder, @Param("a") double afterAmount);

	void insertOrder(@Param("a") String auctionBidder, @Param("n") int num);

	AuctionOrderVO selectOrder(int num);

	void insertDelivery(@Param("a")int ao_num, @Param("b")int bl_num);

	ChattingVO selectChatting(int au_num);

	void insertChatting(int au_num);

	void insertChattingRecord(@Param("m")String message, @Param("s")String sender, @Param("r")String room);

	FileVO selectFile(int productCode);
}