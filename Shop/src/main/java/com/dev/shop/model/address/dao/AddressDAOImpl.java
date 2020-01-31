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
		try {
			sqlSession.update("address.defSetup", vo);
			sqlSession.update("address.updateAddr", vo);
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

	@Override
	public List<AddressVO> selectAddress(String userid) {
		
		return sqlSession.selectList("address.selectAddr", userid);
	}

}
