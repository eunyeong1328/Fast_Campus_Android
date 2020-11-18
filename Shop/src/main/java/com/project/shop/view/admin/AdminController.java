package com.project.shop.view.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.common.base.BaseController;
import com.project.shop.product.ProductService;
import com.project.shop.product.ProductVO;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	ProductService service;

	@RequestMapping(value = "/productAdd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productAdd(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav.setViewName((String) request.getAttribute("viewName"));

		return mav;

	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public void add(ProductVO vo ,MultipartHttpServletRequest request) {
		System.out.println(vo);
		//이미지 파일 저장 경로
		//C:\Users\bitcamp\git\web-project\Shop\src\main\webapp\resources\images\item_image
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
	}

}
