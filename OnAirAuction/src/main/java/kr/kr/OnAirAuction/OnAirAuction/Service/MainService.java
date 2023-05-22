package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface MainService {

	ArrayList<ProductVO> getProductList(Integer pr_code);

	ArrayList<FileVO> getFileList(Integer fi_num);

}