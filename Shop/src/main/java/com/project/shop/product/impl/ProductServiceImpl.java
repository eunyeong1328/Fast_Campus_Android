package com.project.shop.product.impl;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public int insertProduct(ProductVO vo,MultipartHttpServletRequest request) {
		//파일 저장
		System.out.println(vo);
		//이미지 파일 저장 경로
		File dir = new File("C:"+File.separator+"Users"+File.separator+"bitcamp"+File.separator+"git"+File.separator+"web-project"+File.separator+"Shop"+File.separator+"src"
				+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"images"+File.separator+"item_image"); 
		//업로드할 폴더 존재하지 않으면 생성
		if(!dir.exists()) { 
            dir.mkdirs();
        }
        
		Iterator<String> iterator = request.getFileNames();
		String uploadFileName;
		MultipartFile mFile = null;
        String orgFileName = ""; //진짜 파일명
               
        while(iterator.hasNext()) {
            uploadFileName = iterator.next();
            mFile = request.getFile(uploadFileName);
            
            orgFileName = mFile.getOriginalFilename();    
            
            if(orgFileName != null && orgFileName.length() != 0) { //sysFileName 생성
               try {                    
                    mFile.transferTo(new File(dir + File.separator + orgFileName)); // C:/Upload/sysFileName 파일 저장
                }catch(Exception e){
                    e.printStackTrace();
                }
            }//if
        }//while
        vo.setProduct_image(orgFileName);
        System.out.println(vo);
		
		//DB에 상품 추가
		return productDAO.insertProduct(vo);
	}

}
