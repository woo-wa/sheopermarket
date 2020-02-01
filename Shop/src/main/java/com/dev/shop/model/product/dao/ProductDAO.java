package com.dev.shop.model.product.dao;

import java.util.List;

import com.dev.shop.model.product.vo.ProductVO;

public interface ProductDAO {

	//리스트
	public List<ProductVO> listProduct(int category);
	//입력
	public String insertProduct(ProductVO vo);
	//삭제
	public String deleteProduct(int product_id);
	//수정
	public String updateProduct(ProductVO vo);
}
