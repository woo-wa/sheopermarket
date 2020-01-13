package com.dev.shop.service.user;

import java.util.Map;

import com.dev.shop.model.user.dto.UserDTO;

public interface UserService {
	public Map<String, Object> checkPw(String userid, String passwd);
	public void update(UserDTO dto) throws Exception;	//회원 정보 수정
	public void delete(String userid) throws Exception;	//회원 탈퇴
}
