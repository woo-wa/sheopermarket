package com.dev.shop.service;

import java.util.Arrays;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.dev.shop.model.user.dto.UserVO;
import com.dev.shop.security.SecurityUser;

public class UserAuthenticationService implements UserDetailsService{
	
	@Inject
	SqlSessionTemplate sqlSession;
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	public UserAuthenticationService() {
	
	}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인 인증을 처리하는 코드
	// 파라미터로 입력된 아이디값에 해당하는 테이블의 레코드를 읽어옴
	// 정보가 없으면 예외를 발생시킴
	// 정보가 있으면 해당 정보가 map(dto)로 리턴됨

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		UserVO user = sqlSession.selectOne("user.selectUser",userid);
		System.out.println("loadUserByUsername : " + user);
		if(user == null) 
			throw new UsernameNotFoundException(userid); 

		SecurityUser su = new SecurityUser();
		if (user != null) {
			su.setUsername(user.getUserid());
			su.setName(user.getName());         
			su.setUsername(user.getUserid());     // principal
			su.setPassword(user.getPasswd());  // credetial
			su.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(user.getAuthority())));
		}
		return su;
	}

}
