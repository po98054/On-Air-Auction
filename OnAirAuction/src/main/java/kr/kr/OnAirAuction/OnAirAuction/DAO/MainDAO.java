package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface MainDAO {

	ArrayList<ProductVO> selectProduct(@Param("pr_code")Integer pr_code);

	ArrayList<FileVO> selectFileList(@Param("fi_num")Integer fi_num);

}