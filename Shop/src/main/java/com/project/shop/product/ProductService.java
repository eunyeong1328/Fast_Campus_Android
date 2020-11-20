package com.project.shop.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {
	//아진
	public List<ProductVO> listProduct(int productCategoryNum, Map map) throws Exception;
	public ProductVO productDetail(String product_id) throws Exception;	
	public List<ProductVO> productOption(String product_id) throws Exception;
	public String productCategoryName(int productCategoryNum) throws Exception;
	public int getTotalCount(int productCategoryNum) throws Exception;
	public Paging pagingInfo(int productCategoryNum, String cPage) throws Exception;
	
	//상연
	public List<ProductVO> bestList();
	public List<ProductVO> newList();
	public int insertProduct(ProductVO vo,MultipartHttpServletRequest request);
	public List<ProductVO> allList();
	public void deleteProduct(String request);
	public List<ProductVO> loadOne(String request);
	public void updateProduct(ProductVO vo, MultipartHttpServletRequest request);
	public List<ProductVO> loadOption(String request);
	public void deleteOption(String name);
	public void insertOption(ProductVO vo);
}
