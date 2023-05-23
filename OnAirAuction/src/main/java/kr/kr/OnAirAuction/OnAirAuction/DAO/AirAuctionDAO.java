package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.BoardListVO;
import kr.kr.OnAirAuction.VO.ChattingVO;
import kr.kr.OnAirAuction.VO.DeliveryVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.MessageVO;
import kr.kr.OnAirAuction.VO.AuctionOrderVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReportCategoryVO;
import kr.kr.OnAirAuction.VO.ReportVO;
import kr.kr.OnAirAuction.VO.SellerLikeVO;
import kr.kr.OnAirAuction.VO.VirtualAccountVO;

public interface AirAuctionDAO {
	
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

	ArrayList<FileVO> selectFile(int productCode);

	DeliveryVO selectDelivery(int ao_num);

	void updateDelivery(@Param("a")int ao_num, @Param("b")int bl_num);
}