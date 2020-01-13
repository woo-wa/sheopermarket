package com.dev.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	

	@RequestMapping("list.do")
	public String ProductList() {
		return "product/shop.page";
	}
	
	@RequestMapping("detail.do")
	public String ProductDetail() {
		return "product/shop-single.page";
	}
	@RequestMapping("cart.do")
	public String Carrt() {
		return "product/cart.page";
	}
}
