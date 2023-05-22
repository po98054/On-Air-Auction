package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.DAO.ProductDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.Utils.UploadFileUtils;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLargeCategoryVO;
import kr.kr.OnAirAuction.VO.ProductMiddleCategoryVO;
import kr.kr.OnAirAuction.VO.ProductSmallCategoryVO;


@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	ProductDAO productDao;
	
	String uploadPath = "C:/Users/82108/Pictures/fileUpload";
	
	//상품 등록
	@Override
	public void insertProduct(ProductLargeCategoryVO plc, ProductMiddleCategoryVO pmc,
			ProductSmallCategoryVO psc, ProductCategoryVO pc,  
			ProductVO vo, MultipartFile[] files) {
		productDao.ProductLargeCategoryVO(plc);
		productDao.ProductMiddleCategoryVO(pmc);
		productDao.ProductSmallCategoryVO (psc);
		productDao.ProductCategoryVO(pc);
		productDao.insertProduct(vo);	
		uploadFiles(files, vo.getPr_code());	
	}
	
	//첨부파일
	private void uploadFiles(MultipartFile [] files, int pr_code) {
		if(files == null || files.length == 0)
			return ;
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(),
						file.getBytes()); 
			} catch (Exception e) {
				e.printStackTrace();
			} 
			System.out.println(fileName);
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, pr_code);
			productDao.insertFile(fileVo, pr_code);
		}
	}
	
	// 상품 리스트
	@Override
	public ArrayList<ProductVO> getProductList(Criteria criteria) {
		return productDao.selectProductList(criteria);
	}
	@Override
	public int getProductTotalCount(Criteria criteria) {
		return productDao.selectProductTotalCount(criteria);
	}
	
	// 상품 상세페이지
	@Override
	public ProductVO getProduct(int pr_code) {
		return productDao.selectProduct(pr_code);
	}
	@Override
	public ArrayList<FileVO> getFileList(int pr_code) {
		return productDao.selectFileList(pr_code);
	}
	
	// 상품 삭제
	@Override
	public boolean deleteProduct(int pr_code) {
		ProductVO vo = productDao.selectProduct(pr_code);	
		ArrayList<FileVO> fileList = productDao.selectFileList(pr_code);
		deleteFileList(fileList);
		return productDao.deleteProduct(pr_code) != 0;
	}
	private void deleteFileList(ArrayList<FileVO> fileList) {
		if(fileList == null || fileList.size() == 0) 
			return;
		for(FileVO file : fileList) {
			if(file == null)
				continue;
			UploadFileUtils.removeFile(uploadPath, file.getFi_save_name());
			productDao.deleteFile(file);
		}	
	}
	
	// 상품 수정
	@Override
	public boolean updateProduct(ProductVO vo, MultipartFile[] files, int[] fileNums) {
		ProductVO dbvo = productDao.selectProduct(vo.getPr_code());
		if(dbvo == null)
			return false;
		if(productDao.updateProduct(vo) == 0)
			return false;
		uploadFiles(files, vo.getPr_code());
		if(fileNums == null || fileNums.length == 0)
			return true;
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		for(int fileNum : fileNums) {
			FileVO fileVo = productDao.selectFile(fileNum);
			if(fileVo != null)
				fileList.add(fileVo);
		}	
		deleteFileList(fileList);	
		return true;
	}
	

	
}
