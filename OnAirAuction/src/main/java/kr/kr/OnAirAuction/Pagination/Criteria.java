package kr.kr.OnAirAuction.Pagination;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Criteria {
	
	private int page;
	
	private int perPageNum;
	
	private String search;
	
	private String select;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fromDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDate;
	
	public Criteria() {
		
		this.page = 1;
		
		this.perPageNum = 3;
		
		this.search = "";
		
	}

	@Override
	public String toString() {
		
		return " 현재 페이지 : " + page + " 한 페이지당 컨텐츠 갯수 : " + perPageNum + " 시작 일자 : " + fromDate + " 종료 일자 : " + toDate + " 검색어 : " + search;
		
	}
	
	public int getPageStart() {
		
		return (this.page - 1) * perPageNum;
		
	}
	
	public String getFromDate_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(fromDate == null) {
			
			return "";
			
		}
		
		return sdf.format(fromDate);
		
	}
	
	public String getToDate_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(toDate == null) {
			
			return "";
			
		}
		
		return sdf.format(toDate);
		
	}
	
}