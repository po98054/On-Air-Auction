package kr.kh.onAirAuction.service;

import java.util.ArrayList;

import kr.kh.onAirAuction.vo.ChargeVO;
import kr.kh.onAirAuction.vo.ProductVO;

public interface ChargeService {

	void insertCharge(ChargeVO chargeVO);

	void selectCharge(ChargeVO chargeVO);

}
