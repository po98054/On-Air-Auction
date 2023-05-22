package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.AddressBookVO;

import kr.kr.OnAirAuction.VO.MemberVO;

public interface AddressBookDAO {
	
	// 주소록 조회

	ArrayList<AddressBookVO> selectAddressBook(@Param("user")MemberVO user);
	
	// 주소록 등록

	void insertAddressBook(@Param("ab")AddressBookVO ab);
	
	// 주소록 수정

	int updateAddressBook(@Param("ab")AddressBookVO ab);
	
	// 주소록 삭제

	boolean deleteAddressBook(@Param("bl_num")int bl_num);

}