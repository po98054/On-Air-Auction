package kr.kr.OnAirAuction.Pagination;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageMaker {
	
	private int totalCount;
	
	private int startPage;
	
	private int endPage;
	
	private boolean prev;
	
	private boolean next;
	
	private int displayPageNum;
	
	private Criteria criteria;
	
	public void calcData() {
		
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			
			endPage = tempEndPage;
			
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
		
	}

	@Override
	public String toString() {
		
		return " 총 컨텐츠의 갯수 : " + totalCount + " 시작 페이지 : " + startPage + " 마지막 페이지 : " + endPage + " 이전 : " + prev + " 다음 : " + prev 
				
				+ " 한 페이지메이커가 보여줄 페이지의 갯수 : " + displayPageNum + " 현재 페이지 정보 : " + criteria;
		
	}
	
	public PageMaker(int totalCount, int displayPageNum, Criteria criteria) {
		
		this.totalCount = totalCount;
		
		this.displayPageNum = displayPageNum;
		
		this.criteria = criteria;
		
		calcData();
		
	}
	
}