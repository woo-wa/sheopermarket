package com.dev.shop.model.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dev.shop.model.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductVO> listProduct(int category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteProduct(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
