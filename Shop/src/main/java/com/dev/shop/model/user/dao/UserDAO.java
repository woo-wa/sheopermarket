package com.dev.shop.model.user.dao;

import java.util.Map;

import com.dev.shop.model.user.dto.UserDTO;
import com.dev.shop.model.user.dto.UserVO;

public interface UserDAO {
	//회원가입 처리
	public int insertUser(Map<String, String> map);
	//회원 상세 정보
	public UserVO selectUser(String userid);
	//아이디 찾기
	public String searchId(String email);
	//비밀번호 찾기
	public String searchPw(UserVO vo);
	//정보 변경
	public void updateUser(UserDTO dto) throws Exception;
	//회원 탈퇴
	public void deleteUser(String userid) throws Exception;
}
