package com.dev.shop.model.address.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dev.shop.model.address.vo.AddressVO;

@Repository
public class AddressDAOImpl implements AddressDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertAddress(AddressVO vo) {
		sqlSession.insert("address.insertAddr", vo);

	}

	@Override
	public void deleteAddress(int addno) {
		sqlSession.delete("address.deleteAddre", addno);

	}

	@Override
	public void updateAddress(AddressVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AddressVO> selectAddress(String userid) {
		sqlSession.selectList("address.selectAddr", userid);
		return null;
	}

}
