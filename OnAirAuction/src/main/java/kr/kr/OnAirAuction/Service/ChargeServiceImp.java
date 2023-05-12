package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.ChargeDAO;
import kr.kr.OnAirAuction.VO.ChargeVO;

@Service
public class ChargeServiceImp implements ChargeService {

	@Autowired
	ChargeDAO chargeDao;

	@Override
	public void insertCharge(ChargeVO chargeVO) {
		chargeDao.chargeInsert(chargeVO);			
	}


}
