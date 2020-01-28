package com.dev.shop.security;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.dev.shop.model.user.dao.UserDAO;
import com.dev.shop.model.user.dto.UserVO;

@Component
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private UserDAO userDao;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		System.out.println("으아아악:"+userid);
		UserVO userVo = new UserVO();
		userVo=userDao.selectUser(userid);
		System.out.println("loadUserByUsername : " + userVo.toString());
		SecurityUser su = new SecurityUser();
		
		if (userVo != null) {
			su.setName(userVo.getName());         
			su.setUsername(userVo.getUserid());     // principal
			su.setPassword(userVo.getPasswd());  // credetial
			su.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(userVo.getAuthority())));
		}
		
		return su;
	}
	

}
