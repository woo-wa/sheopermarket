package com.dev.shop.service.user;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.shop.model.user.dao.UserDAO;
import com.dev.shop.model.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO Userdao;
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Map<String, Object> checkPw (String userid, String passwd) {
		
		return null;
	}
	
	@Transactional
	@Override
	public void update(UserDTO dto) throws Exception {
		Userdao.updateUser(dto);
	}

	@Override
	public void delete(String userid) throws Exception {
		// TODO Auto-generated method stub

	}

	

}
