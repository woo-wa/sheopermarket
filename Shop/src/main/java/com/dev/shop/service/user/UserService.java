package com.dev.shop.service.user;

import com.dev.shop.model.user.dto.UserDTO;
import com.dev.shop.model.user.dto.UserVO;

public interface UserService {
	public UserVO selectUser(String userid);			//회원 정보
	public String searchId (String email);				//아이디 찾기
	public String searchPw (UserVO vo); //비밀번호 찾
	public void update(UserVO vo) throws Exception;	//회원 정보 수정
	public void delete(String userid) throws Exception;	//회원 탈퇴
	public void changePw (String userid, String passwd); // 비밀번호 변경	
}
