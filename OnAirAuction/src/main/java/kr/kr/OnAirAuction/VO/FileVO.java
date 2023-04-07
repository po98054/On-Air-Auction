package kr.kr.OnAirAuction.VO;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	
	int fi_num;
	
	String fi_name;
	
	String fi_savename;
	
	String fi_tablename;
	
	int fi_tablenum;
	
	@Override
	public String toString() {
		
		return "파일 번호 : " + fi_num + " 파일 원본 파일명 : " + fi_name + " 파일명 : " + fi_savename + " 등록할 테이블 명 : " + fi_tablename + " 등록할 테이블 번호 : " + fi_tablenum;
		
	}
	
	public FileVO(String fi_name, String fi_savename, int fi_tablenum) {
		
		this.fi_name = fi_name;
		
		this.fi_savename = fi_savename;
		
		this.fi_tablenum = fi_tablenum;
		
	}

}