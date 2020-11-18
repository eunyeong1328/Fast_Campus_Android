package com.project.shop.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Service("productService")
@Transactional(propagation=Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	//아진
	@Override
	public List<ProductVO> listProduct(int productCategoryNum, Map map) throws Exception {
		List<ProductVO> productList = productDAO.selectProductList(productCategoryNum, map);
		return productList;
	}

	@Override
	public ProductVO productDetail(String productId) throws Exception {
		ProductVO productVO = productDAO.selectProductDetail(productId);
		return productVO;
	}

	@Override
	public String productCategoryName(int productCategoryNum) throws Exception {
		String  productCategoryName = productDAO.selectProductCategoryName(productCategoryNum);
		return productCategoryName;
	}

	@Override
	public int getTotalCount(int productCategoryNum) throws Exception {
		int totalCount = productDAO.getTotalCount(productCategoryNum);
		return totalCount;
	}

	@Override
	public List<ProductVO> productOption(String product_id) throws Exception {
		List<ProductVO> optionList = productDAO.selectOption(product_id);
		return optionList;
	}
	
	//상연
	@Override
	public List<ProductVO> bestList() {
		return productDAO.bestList();
	}

	@Override
	public List<ProductVO> newList() {
		return productDAO.bestList();
	}

	@Override
	public int insertProduct(ProductVO vo) {
		return productDAO.insertProduct(vo);
	}

}
