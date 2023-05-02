package kr.kh.onAirAuction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.onAirAuction.vo.ChargeVO;

public interface ChargeDAO {

	void chargeInsert(ChargeVO chargeVO);

	void chargeSelect(ChargeVO chargeVO);


}
