package com.dev.shop.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.shop.model.user.dao.UserDAO;
import com.dev.shop.model.user.dto.UserVO;
import com.dev.shop.service.user.UserService;

@Controller
@RequestMapping("/user/**")
public class UserController {

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Inject
	private UserDAO userDao;
	
	@Inject
	UserService userService;

	@RequestMapping("login.do")
	public String Login(HttpServletRequest req) {
		String referrer = req.getHeader("Referer");
		System.out.println("이전 페이지:"+referrer);
		req.getSession().setAttribute("prevPage", referrer);
		return "user/login.page";
	}

	@RequestMapping("joinUser.do")
	public String Contact() {
		return "user/join.page";
	}

	// 회원 가입 처리
	@RequestMapping("insertUser.do")
	public String insertUser(@RequestParam String userid, @RequestParam String passwd, @RequestParam String name,
			@RequestParam String email, @RequestParam String phone, @RequestParam String authority) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		System.out.println("암호화 전의 비번 : " + passwd);
		// 비밀번호 암호화
		String encryptPassword = passwordEncoder.encode(passwd);
		System.out.println("암호화 후의 비번 : " + encryptPassword);
		map.put("passwd", encryptPassword);
		map.put("name", name);
		map.put("email", email);
		map.put("phone", phone);
		map.put("authority", authority);
		userDao.insertUser(map);
		return "user/login.page";
	}

	// 아이디 찾는 로직
	@RequestMapping("searchId.do")
	@ResponseBody
	public String searchId(String email) {
		String userid = userService.searchId(email);
		
		if(userid==null)
			return "error";
		
		return userid;
	}
	
	@RequestMapping(value="searchPw.do", method = RequestMethod.POST)
	public void searchPw(UserVO vo) {
		System.out.println(vo);
		userService.searchPw(vo);		
	}
	

	// 마이 페이지로 이동
	@Secured("ROLE_USER")
	@RequestMapping("mypage.do")
	public String myPage() {
		return "user/mypage.page";
	}

	// 회원 정보 수정
	@Secured("ROLE_USER")
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String checkPW() throws Exception {

		return "user/checkPw.page";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="modify.do", method = RequestMethod.POST)
	public ModelAndView modify (@RequestParam String userid, @RequestParam String passwd) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> user; 
		user = userService.checkPw(userid, passwd);

		boolean check =	passwordEncoder.matches(passwd, (String)user.get("PASSWORD"));
		if(check) {
			mv.addObject("map",user);
			mv.setViewName("user/modify.page");
			return mv;
		}
		return mv;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("update.do")
	public String UpdateUser() throws Exception {

		return "user/modify.page";
	}

}
