package com.dev.shop.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
	//회원 탈퇴 페이지
	@RequestMapping(value="deleteUser.do", method = RequestMethod.GET)
	public String deleteUser() {
		return "user/delete.page";
	}
	//회원 탈퇴 로직
	@RequestMapping(value="deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(String passwd ,Authentication authentication, HttpSession session) {
		UserDetails user = (UserDetails) authentication.getPrincipal();
		boolean check = passwordEncoder.matches(passwd, user.getPassword());
		System.out.println("비번 : " + passwd);
		if(check) {
			session.invalidate();
			return "redirect:/";
		}else {
			return "user/alert";
		}
		
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
	//비밀번호 찾기 로직
	@RequestMapping(value="searchPw.do", method = RequestMethod.POST)
	@ResponseBody
	public String searchPw(UserVO vo) {
		System.out.println(vo);
		String id = userService.searchPw(vo);
		
		return id;
	}
	

	// 마이 페이지로 이동
	@Secured("ROLE_USER")
	@RequestMapping("mypage.do")
	public String myPage() {
		return "user/mypage.page";
	}

	// 회원 정보 수정 전 암호 확인 페이지
	@Secured("ROLE_USER")
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String checkPW() throws Exception {

		return "user/checkPw.page";
	}
	// 회원 정보 수정 페이지 이동
	@Secured("ROLE_USER")
	@RequestMapping(value="modify.do", method = RequestMethod.POST)
	public ModelAndView modify (@RequestParam String userid, @RequestParam String passwd, Authentication authentication) {
		UserDetails user = (UserDetails) authentication.getPrincipal();
		UserVO userVo = userService.selectUser(userid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/alert");
		boolean check =	passwordEncoder.matches(passwd, user.getPassword());
		if(check) {
			mv.addObject("user",userVo);
			mv.setViewName("user/modify.page");
			return mv;
		}
		return mv;
	}
	
	// 회원 정보 수정 로직
	@Secured("ROLE_USER")
	@RequestMapping(value="updateUser.do", method = RequestMethod.POST)
	public String UpdateUser(UserVO vo) throws Exception {
		userService.update(vo);
		return "redirect:user/mypage.do";
	}
	
	// 비밀번호 변경 페이지
	@Secured("ROLE_USER")
	@RequestMapping(value="changePw.do", method = RequestMethod.GET)
	public String changePw() {
		return "user/changePw.page";
	}
	
	//비밀번호 변경 로직
	@Secured("ROLE_USER")
	@RequestMapping(value="changePw.do", method= RequestMethod.POST)
	@ResponseBody
	public String changePW(@RequestParam String oldpasswd, @RequestParam String newpasswd,
			Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		boolean check = passwordEncoder.matches(oldpasswd, userDetails.getPassword());
		if(check) {
			if(oldpasswd.equals(newpasswd)) {		//비밀번호가 전과 같음
				return "same";		
			}else {				//비밀번호 변경 성공
				String encryptPassword = passwordEncoder.encode(newpasswd);
				userService.changePw(userDetails.getUsername(),encryptPassword);
				return "suc";	
			}
		}else {		//비밀번호 틀림
			return "wrong";			
		}
	}
}
