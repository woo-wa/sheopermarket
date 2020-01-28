package com.dev.shop.service.user;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.shop.model.user.dao.UserDAO;
import com.dev.shop.model.user.dto.UserDTO;
import com.dev.shop.model.user.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO Userdao;
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserVO selectUser(String userid) {
		
		return Userdao.selectUser(userid);
	}
	
	@Transactional
	@Override
	public void update(UserVO vo) throws Exception {
		Userdao.updateUser(vo);
	}

	@Override
	public void delete(String userid) throws Exception {
		Userdao.deleteUser(userid);

	}

	@Override
	public String searchId(String email) {
		
		return Userdao.searchId(email);
	}

	@Override
	public String searchPw(UserVO vo) {
		String userid = Userdao.searchPw(vo);
		return userid;
	}

	@Override
	public void changePw(String userid, String passwd) {
		UserVO vo = new UserVO();
		vo.setUserid(userid);
		vo.setPasswd(passwd);
		Userdao.changePw(vo);
		
	}

	

	

}
