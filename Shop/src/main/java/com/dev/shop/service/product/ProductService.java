package com.dev.shop.service.product;

import java.util.List;

import com.dev.shop.model.product.vo.ProductVO;

public interface ProductService {
	// 상품 리스트
	public List<ProductVO> listProduct(int category);
	// 상품 조회
	public ProductVO detailProduct(int product_id);
	// 상품 입력
	public void insertProduct(ProductVO vo);

	public List<ProductVO> listAll(int start, int end, String search_option, String keyword);

	public int countArticle(String search_option, String keyword);
	
	

}
