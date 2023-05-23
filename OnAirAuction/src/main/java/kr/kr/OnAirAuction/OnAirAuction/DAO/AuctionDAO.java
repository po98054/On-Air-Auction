package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface AuctionDAO {
	
	void insertAuction(@Param("auction")AuctionVO auction);
	
	ArrayList<AuctionVO> selectAuctionList(@Param("cri")Criteria cri);

	int selectAuctionTotalCount(@Param("cri")Criteria cri);

	AuctionVO selectAuction(@Param("au_num")int au_num);
	
	ProductVO selectProduct(@Param("au_pr_code")int au_pr_code);


}