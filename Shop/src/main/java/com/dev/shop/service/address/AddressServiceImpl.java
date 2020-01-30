package com.dev.shop.service.address;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dev.shop.model.address.dao.AddressDAO;
import com.dev.shop.model.address.vo.AddressVO;

@Service
public class AddressServiceImpl implements AddressService {

	@Inject
	AddressDAO addrDao;
	
	@Override
	public void insertAddress(AddressVO vo) {
		addrDao.insertAddress(vo);

	}

	@Override
	public void deleteAddress(int addno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAddress(AddressVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AddressVO> selectAddress(String userid) {
		
		return addrDao.selectAddress(userid);
	}

}
