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
		
		return sqlSession.selectList("product.listProduct");
	}
	
	@Override
	public ProductVO detailProduct(int product_id) {

		return sqlSession.selectOne("product.detailProduct", product_id);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		sqlSession.insert("product.insertProduct", vo);

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
