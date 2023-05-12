package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;

public interface AuctionDAO {
	
	void insertAuction(@Param("auction")AuctionVO auction);
	
	ArrayList<AuctionVO> selectAuctionList(@Param("cri")Criteria cri);

	int selectAuctionTotalCount(@Param("cri")Criteria cri);

	AuctionVO selectAuction(@Param("au_num")int au_num);


}
