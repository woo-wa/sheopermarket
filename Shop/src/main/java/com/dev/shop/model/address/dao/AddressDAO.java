package com.dev.shop.model.address.dao;

import java.util.List;

import com.dev.shop.model.address.vo.AddressVO;

public interface AddressDAO {
	// 주소 추가
	public void insertAddress(AddressVO vo);
	// 주소 삭제
	public void deleteAddress(int addno);
	// 주소 수정
	public void updateAddress(AddressVO vo);
	// 주소 불러오기
	public List<AddressVO> selectAddress(String userid);
	

}
