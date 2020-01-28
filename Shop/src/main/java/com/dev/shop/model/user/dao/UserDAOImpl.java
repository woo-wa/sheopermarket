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
		System.out.println("Mybatis 호출------------------");
		return sqlSession.selectOne("user.selectUser", userid);
	}
	
	@Override
	public String searchId(String email) {
		System.out.println("Mybatis 호출------------------");
		return sqlSession.selectOne("user.searchId", email);
	}
	
	@Override
	public String searchPw(UserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.searchPw", vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		sqlSession.update("user.updateUser", vo);
		
	}

	@Override
	public void deleteUser(String userid) throws Exception {
		sqlSession.delete("user.deleteUser", userid);
		
	}

	@Override
	public void changePw(UserVO vo) {
		sqlSession.update("user.changePw", vo);
		
	}

	

}
