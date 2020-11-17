package com.project.shop.common.file;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController{
	private static String CURR_IMAGE_REPO_PATH = "C:\\shop\\file_repo";
//	private static String CURR_IMAGE_REPO_PATH = "resources\\images\\item_image";
	
	@RequestMapping("/product/thumbnails.do")
	protected void thumbnails(@RequestParam("product_image") String product_image,
                            	@RequestParam("product_id") String product_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+product_image;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(200,200).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
