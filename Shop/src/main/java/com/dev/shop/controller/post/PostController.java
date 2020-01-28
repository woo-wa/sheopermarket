package com.dev.shop.controller.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/post/*")
public class PostController {

	@RequestMapping(value="post.do", method = RequestMethod.GET)
	public String post() {
		return "post/post.page";
	}
}
