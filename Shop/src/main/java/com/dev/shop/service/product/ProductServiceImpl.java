package com.dev.shop.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dev.shop.model.product.dao.ProductDAO;
import com.dev.shop.model.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;

	@Override
	public List<ProductVO> listAll(int start, int end, String search_option, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ProductVO detailProduct(int product_id) {
		
		return productDao.detailProduct(product_id);
	}
	
	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertProduct(ProductVO vo) {
		try {
			productDao.insertProduct(vo);
		}catch(Exception e) {
			System.out.println("저장 실패  : " + e);
		}
	}

	@Override
	public List<ProductVO> listProduct(int category) {
		
		return productDao.listProduct(category);
	}


}
