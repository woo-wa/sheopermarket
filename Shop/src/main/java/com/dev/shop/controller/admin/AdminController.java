package com.dev.shop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	// 관리자 페이지로 이동
	@RequestMapping(value = "main.do")
	public String adminPage() {
		return "admin/main";
	}
}
