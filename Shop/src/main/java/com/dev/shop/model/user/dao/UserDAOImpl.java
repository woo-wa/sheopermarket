package com.dev.shop.model.user.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dev.shop.model.user.dto.UserDTO;
import com.dev.shop.model.user.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int insertUser(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.insertUser",map);
	}

	@Override
	public UserVO selectUser(String userid) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("user.selectUser", userid);
	}
	
	@Override
	public String searchId(Map<String, String> map) {
		
		return sqlSession.selectOne("user.searchId", map);
	}

	@Override
	public void updateUser(UserDTO dto) throws Exception {
		sqlSession.update("user.updateUser", dto);
		
	}

	@Override
	public void deleteUser(String userid) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
