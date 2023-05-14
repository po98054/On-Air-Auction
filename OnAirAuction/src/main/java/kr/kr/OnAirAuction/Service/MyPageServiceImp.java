package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.DAO.MyPageDAO;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.Utils.UploadFileUtils;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryVO;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.OrderAuctionVO;

import kr.kr.OnAirAuction.VO.OrderCancleVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.PersonSearchVO;

import kr.kr.OnAirAuction.VO.ProductSearchVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.ReportVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

@Service
public class MyPageServiceImp implements MyPageService{
	
	@Autowired
	MyPageDAO myPageDao;
	
	String uploadPath = "C:/Users/82108/Pictures/fileUpload";
	
	// 경매 참가 내역 조회 서비스

	@Override
	public ArrayList<ParticipateAuctionVO> getPartAuctList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectPartAuctList(criteria);
		
	}
	
	// 경매 개최 내역 조회 서비스

	@Override
	public int getPartAuctTotalCount(Criteria criteria) {

		return myPageDao.selectPartAuctTotalCount(criteria);
		
	}

	@Override
	public ArrayList<HeldAuctionVO> getHeldAuctList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectHeldAuctList(criteria);
		
	}

	@Override
	public int getHeldAuctTotalCount(Criteria criteria) {
		
		return myPageDao.selectHeldAuctTotalCount(criteria);
		
	}

	@Override
	public ArrayList<HeldAuctionVO> getHeldList(int ac_num) {
		
		return myPageDao.selectHeldList(ac_num);
		
	}

	@Override
	public boolean insertAuctionCancle(AuctionCancleVO auctionCancle) {
		
		if(auctionCancle == null) {
			
			return false;
			
		}
		
		return myPageDao.insertAuctionCancle(auctionCancle) != 0;
		
	}
	
	// 후기 등록

	@Override
	public boolean insertReview(ReviewVO review, MultipartFile[] files) {
		
		if(review == null || review.getRe_title() == null|| review.getRe_title().trim().length() == 0) {
			
			return false;
			
		}
		
		if(review.getRe_content() == null || review.getRe_content().trim().length() == 0) {
			
			return false;
			
		}
		
		myPageDao.insertReview(review);
		
		uploadFiles(files, review.getRe_num());
		
		return true;
		
		
	}
	
	// 첨부 파일

	private void uploadFiles(MultipartFile [] files, int re_num) {
		
		if(files == null || files.length == 0)
			
			return ;
		
		//반복문
		for(MultipartFile file : files) {
			
			if(file == null || file.getOriginalFilename().length() == 0)
				
				continue;
			
			String fileName = "";
			
			//첨부파일 서버에 업로드
			
			try {
				
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()); 
						
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			System.out.println(fileName);
			
			//첨부파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, re_num);
			
			System.out.println(re_num);
			
			//다오에게서 첨부파일 정보를 주면서 추가하라고 요청
			myPageDao.insertFile(fileVo, re_num);
		}
	}

	@Override
	public ParticipateAuctionVO getPate(Integer re_ar_num) {
		
		ParticipateAuctionVO pate = myPageDao.selectAuction(re_ar_num); 
		
		return null;
		
	}
	
	// 후기 조회

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectReviewList(criteria);
		
	}
	
	// 후기 수정

	@Override
	public ReviewVO getReview(int re_num) {
		
		return myPageDao.selectReview(re_num);
		
	}

	@Override
	public ArrayList<FileVO> getFileList(int re_num) {
		
		return myPageDao.selectFileList(re_num);
		
	}
	
	// 리뷰 수정

	@Override
	public boolean updateReview(ReviewVO review, MultipartFile[] files, int[] fileNums) {
		
		if(review == null || review.getRe_num()<=0) {
			
			return false;
			
		}
		
		ReviewVO dbReview = myPageDao.selectReview(review.getRe_num());
		
		if(dbReview == null) {
			
			return false;
			
		}
		
		if(myPageDao.updateReview(review) == 0) {
			
			return false;
			
		}
		
		uploadFiles(files, review.getRe_num());
		
		if(fileNums == null || fileNums.length == 0) {
			
			return true;
			
		}

		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		for(int fileNum : fileNums) {
			
			FileVO fileVo = myPageDao.selectFile(fileNum);
			
			if(fileVo != null) {
				
				fileList.add(fileVo);
				
			}
			
		}
		
		deleteFileList(fileList);
			
		return true;
		
	}
	
	// 첨부 파일 삭제
	
	private void deleteFileList(ArrayList<FileVO> fileList) {
		
		if(fileList == null || fileList.size() == 0) {
			
			return;
			
		}
		
		for(FileVO file : fileList) {
			
			if(file == null) {
				
				continue;
				
			}
			
			UploadFileUtils.removeFile(uploadPath, file.getFi_save_name());
			
			myPageDao.deleteFile(file);
			
		}
		
	}
	
	// 후기 삭제

	@Override
	public boolean deleteReview(int re_num) {
		
		ReviewVO review = myPageDao.selectReview(re_num);
		
		if(review == null) {
			
			return false;
			
		}
		
		ArrayList<FileVO> fileList = myPageDao.selectFileList(re_num);
		
		deleteFileList(fileList);
		
		return myPageDao.deleteReview(re_num) != 0;
		
	}

	@Override
	public boolean updateHeldAuction(ArrayList<HeldAuctionVO> held) {
		
		System.out.println(held);
		
		return false;
	}

	@Override
	public HeldAuctionVO getHeld(int ac_num) {
		// TODO Auto-generated method stub
		
		System.out.println(ac_num);
		
		return myPageDao.selectHeld(ac_num);
	}

	@Override
	public boolean updateHeld(HeldAuctionVO held) {
		
		System.out.println(held);
		
		if(held == null) {
			
			return false;
			
		}
		
		return myPageDao.updateHeld(held) != 0;
	}

	@Override
	public ArrayList<ProductSearchVO> getProduct(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectProduct(criteria);
		
	}

	@Override
	public ArrayList<ProductSearchVO> SelectProduct(ProductSearchVO product) {
		
		return myPageDao.selectProductName(product);
		
	}

	// 문의 사항 등록
	
	@Override
	public ArrayList<InquiryCategoryVO> getInquiryCategory() {
		
		return myPageDao.selectAllInquiryCategory();
		
	}

	@Override
	public boolean insertInquiry(InquiryVO inquiry, MultipartFile[] files, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		System.out.println(files);
		
		if(inquiry == null || inquiry.getIn_title() == null || inquiry.getIn_title().trim().length() == 0 ||
				
				inquiry.getIn_content() == null) {
			
			return false;
			
		}
		
		inquiry.setIn_me_id(user.getMe_id());
		
		myPageDao.insertInquiry(inquiry);
		
		uploadFilesByInquiry(files, inquiry.getIn_num());
		
		return true;
		
	}
	
	// 문의 사항 수정 시 첨부 파일 조회
	
	private void uploadFilesByInquiry(MultipartFile [] files, int in_num) {
		
		if(files == null || files.length == 0)
			
			return ;
		
		//반복문
		for(MultipartFile file : files) {
			
			if(file == null || file.getOriginalFilename().length() == 0)
				
				continue;
			
			String fileName = "";
			
			//첨부파일 서버에 업로드
			
			try {
				
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()); 
						
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			System.out.println(fileName);
			
			//첨부파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, in_num);
			
			System.out.println(in_num);
			
			//다오에게서 첨부파일 정보를 주면서 추가하라고 요청
			myPageDao.insertFileByInquiry(fileVo, in_num);
		}
	}

	// 문의 사항 조회
	
	@Override
	public ArrayList<InquiryVO> getInquiryList(Criteria criteria, MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectInquiryList(criteria, user);
		
	}

	@Override
	public int getInquiryTotalCount(Criteria criteria) {
		
		return myPageDao.selectInquiryTotalCount(criteria);
		
	}
	
	// 문의 사항 상세 보기

	@Override
	public InquiryVO getInquiry(int in_num, MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
	
		return myPageDao.selectInquiry(in_num);
			
	}
	
	@Override
	public ArrayList<FileVO> getFileListByInquiry(int in_num) {
		
		return myPageDao.selectFileListByInquiry(in_num);
		
	}
	
	// 문의 사항 수정
	
	@Override
	public boolean UpdateInquiry(InquiryVO inquiry, MultipartFile[] files, int[] fileNums, MemberVO user) {
		
		System.out.println(files);
		
		System.out.println(fileNums);
		
		if(inquiry == null || inquiry.getIn_num() <= 0) {
			
			return false;
			
		}
		
		if(user == null) {
			
			return false;
			
		}
		
		InquiryVO dbInquiry = myPageDao.selectInquiry(inquiry.getIn_num());
		
		if(dbInquiry == null) {
			
			return false;
			
		}
		
		if(!dbInquiry.getIn_me_id().equals(user.getMe_id())) {
			
			return false;
			
		}
		
		if(myPageDao.updateInquiry(inquiry) == 0) {
			
			return false;
			
		}
		
		uploadFilesByInquiry(files, inquiry.getIn_num());
		
		if(fileNums == null || fileNums.length == 0) {
			
			return true;
			
		}

		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		System.out.println(fileList);
		
		for(int fileNum : fileNums) {
			
			FileVO fileVo = myPageDao.selectFile(fileNum);
			
			System.out.println(fileVo);
			
			if(fileVo != null) {
				
				fileList.add(fileVo);
				
			}
			
		}
		
		deleteFileList(fileList);
			
		return true;
		
	}

	// 문의 사항 삭제
	
	@Override
	public boolean deleteInquiry(int in_num, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		System.out.println(in_num);
		
		InquiryVO inquiry = myPageDao.selectInquiry(in_num);
		
		if(inquiry == null) {
			
			return false;
			
		}
		
		if(!inquiry.getIn_me_id().equals(user.getMe_id())) {
			
			return false;
			
		}
		
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		deleteFileList(fileList);
		
		return myPageDao.deleteInquiry(in_num) != 0;
	}

	// 신고 등록
	
	@Override
	public ArrayList<ReportCategoryVO> getReportCategory() {
		
		
		return myPageDao.selectAllReportCategory();
		
	}

	// ajax를 통한 아이디 조회
	
	@Override
	public ArrayList<PersonSearchVO> getPerson(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectPerson(criteria);
		
	}

	@Override
	public ArrayList<PersonSearchVO> SelectPerson(PersonSearchVO person) {
		
		return myPageDao.selectPersonName(person);
		
	}

	@Override
	public boolean insertReport(ReportVO report, MultipartFile[] files, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		System.out.println(files);
		
		if(report == null || report.getRe_content() == null) {
			
			return false;
			
		}
		
		report.setRe_me_id(user.getMe_id());
		
		myPageDao.insertReport(report);
		
		uploadFilesByReport(files, report.getRe_num());
		
		return true;
		
	}
	
	// 신고 등록시 첨부파일 등록
	
	private void uploadFilesByReport(MultipartFile [] files, int re_num) {
		
		if(files == null || files.length == 0)
			
			return ;
		
		//반복문
		for(MultipartFile file : files) {
			
			if(file == null || file.getOriginalFilename().length() == 0)
				
				continue;
			
			String fileName = "";
			
			//첨부파일 서버에 업로드
			
			try {
				
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()); 
						
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			System.out.println(fileName);
			
			//첨부파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, re_num);
			
			System.out.println(re_num);
			
			//다오에게서 첨부파일 정보를 주면서 추가하라고 요청
			myPageDao.insertFileByReport(fileVo, re_num);
			
		}
	}

	// 신고 조회
	
	@Override
	public ArrayList<ReportVO> getReportList(Criteria criteria, MemberVO user) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		if(user == null) {
			
			return null;
			
		}
		
		return myPageDao.selectReportList(criteria, user);
		
	}

	@Override
	public int getReportTotalCount(Criteria criteria) {
		
		return myPageDao.selectReportTotalCount(criteria);
		
	}
	
	// 신고 상세 보기

	@Override
	public ReportVO getReport(int re_num, MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		return myPageDao.selectReport(re_num);
		
	}

	@Override
	public ArrayList<FileVO> getFileListByReport(int re_num) {
		
		return myPageDao.selectFileListByReport(re_num);
		
	}
	
	// 신고 수정

	@Override
	public boolean UpdateReport(ReportVO report, MultipartFile[] files, int[] fileNums, MemberVO user) {
		
		System.out.println(files);
		
		System.out.println(fileNums);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(report == null || report.getRe_num() <= 0) {
			
			return false;
			
		}
		
		ReportVO dbreport = myPageDao.selectReport(report.getRe_num());
		
		if(dbreport == null) {
			
			return false;
			
		}
		
		if(!dbreport.getRe_me_id().equals(user.getMe_id())) {
			
			return false;
			
		}
		
		if(myPageDao.updateReport(report) == 0) {
			
			return false;
			
		}
		
		uploadFilesByReport(files, report.getRe_num());
		
		if(fileNums == null || fileNums.length == 0) {
			
			return true;
			
		}

		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		System.out.println(fileList);
		
		for(int fileNum : fileNums) {
			
			FileVO fileVo = myPageDao.selectFile(fileNum);
			
			System.out.println(fileVo);
			
			if(fileVo != null) {
				
				fileList.add(fileVo);
				
			}
			
		}
		
		deleteFileList(fileList);
			
		return true;
	}
	
	// 신고 삭제

	@Override
	public boolean deleteReport(int re_num) {
		
		System.out.println(re_num);
		
		ReportVO report = myPageDao.selectReport(re_num);
		
		if(report == null) {
			
			return false;
			
		}
		
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		deleteFileList(fileList);
		
		return myPageDao.deleteReport(re_num) != 0;
		
	}
	
	// 구매자 주문 내역 조회

	@Override
	public ArrayList<OrderAuctionVO> getOrderAuctList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectOrderAuctList(criteria);
		
	}

	@Override
	public int getOrderAuctTotalCount(Criteria criteria) {
		
		return myPageDao.selectOrderAuctTotalCount(criteria);
		
	}

	@Override
	public boolean insertOrderCancle(OrderCancleVO orderCancle) {
		
		if(orderCancle == null) {
			
			return false;
			
		}
		
		return myPageDao.insertOrderCancle(orderCancle) != 0;
		
	}
	
	// 환불 내역 조회

	@Override
	public ArrayList<OrderCancleVO> getRefundList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectRefundList(criteria);
		
	}

	@Override
	public int getRefundTotalCount(Criteria criteria) {
		
		return myPageDao.selectRefundTotalCount(criteria);
		
	}
	
	// 회원 정보 수정

	@Override
	public MemberVO getMember(String me_id, MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
	
		return myPageDao.selectMember(me_id);
		
	}

	@Override
	public boolean UpdateMember(MemberVO member) {
		
		if(member == null) {
			
			return false;
			
		}
		
		MemberVO dbMember = myPageDao.selectMember(member.getMe_id());
		
		if(dbMember == null) {
			
			return false;
			
		}
		
		return myPageDao.updateMember(member) != 0;
		
	}

	@Override
	public boolean deleteMember(MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		return myPageDao.deleteMember(user) != 0;
	}

	@Override
	public InquiryVO getInquiryByNum(int in_num) {
		
		return myPageDao.selectInquiryByNum(in_num);
		
	}

	@Override
	public boolean ReplyInquiryInsert(InquiryVO inquiry, MultipartFile[] files, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		System.out.println(files);
		
		if(inquiry == null || inquiry.getIn_title() == null || inquiry.getIn_title().trim().length() == 0 ||
				
				inquiry.getIn_content() == null) {
			
			return false;
			
		}
		
		inquiry.setIn_me_id(user.getMe_id());
		
		myPageDao.insertInquiryReply(inquiry);
		
		uploadFilesByInquiry(files, inquiry.getIn_num());
		
		return true;
		
	}
	
}