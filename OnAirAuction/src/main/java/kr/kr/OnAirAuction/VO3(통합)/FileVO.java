package kr.kr.OnAirAuction.VO;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	
	int fi_num;
	
	String fi_name;
	
	String fi_save_name;
	
	String fi_table_name;
	
	int fi_table_num;
	
	@Override
	public String toString() {
		
		return "파일 번호 : " + fi_num + " 파일 원본 파일명 : " + fi_name + " 파일명 : " + fi_save_name + " 등록할 테이블 명 : " + fi_table_name + " 등록할 테이블 번호 : " + fi_table_num;
		
	}
	
	public FileVO(String fi_name, String fi_save_name, int fi_table_num) {
		
		this.fi_name = fi_name;
		
		this.fi_save_name = fi_save_name;
		
		this.fi_table_num = fi_table_num;
		
	}

}