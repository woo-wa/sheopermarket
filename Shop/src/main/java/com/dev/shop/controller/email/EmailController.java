package com.dev.shop.controller.email;

import java.util.UUID;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.shop.model.email.EmailVO;
import com.dev.shop.service.email.EmailSerivice;
import com.dev.shop.service.user.UserService;

@Controller
@RequestMapping("/email/*")
public class EmailController {

	@Inject
	EmailSerivice emailService;
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	@Inject
	UserService userService;

	@RequestMapping("sendEmail.do")
	public void send(String email, String userid) {
		EmailVO vo = new EmailVO();
		String msg = "";

		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
		uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
		System.out.println("임시 비밀번호 : " + uuid);
		String passwd = passwordEncoder.encode(uuid);
		//userService.changePw(userid, passwd);
		
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += userid + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += uuid + "</p></div>";

		vo.setSenderName("Shoeper");
		vo.setSenderMail("shoeper@sheoper.com");
		vo.setSubject("임시 비밀번호 입니다.");
		vo.setReceiveMail(email);
		vo.setMessage(msg);
		try {
			emailService.sendMail(vo);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
