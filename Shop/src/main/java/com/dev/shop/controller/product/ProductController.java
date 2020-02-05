package com.dev.shop.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dev.shop.model.product.vo.ProductVO;
import com.dev.shop.service.product.ProductService;
import com.dev.shop.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	
	
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView list() {
		List<ProductVO> list = productService.listProduct(1);
		logger.info("리스트 : " + list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/shop.page");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword)
			throws Exception {
		logger.debug("search_option : " + search_option);
		logger.debug("keyword : " + keyword);

		//레코드 갯수 계산
		int count = productService.countArticle(search_option, keyword);

		//페이지 나누기 관련 처리
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ProductVO> list = productService.listAll(start, end, search_option, keyword);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");

		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);

		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping("detail.do/{product_id}")
	public ModelAndView ProductDetail(@PathVariable("product_id") int product_id) {
		ProductVO vo = productService.detailProduct(product_id);
		logger.info("상품 정보 : " + vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/shop-single.page");
		mv.addObject("detail", vo);
		
		return mv;
	}

	@RequestMapping("cart.do")
	public String Carrt() {
		return "product/cart.page";
	}
}
