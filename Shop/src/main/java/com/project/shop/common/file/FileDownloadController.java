package com.project.shop.common.file;

import java.io.File;
import java.io.FileInputStream;
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
	@RequestMapping("/product/thumbnails1.do")
	protected void thumbnails1(@RequestParam("product_image") String product_image,
                            	@RequestParam("product_id") String product_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+product_image;
		File image=new File(filePath);
		
		System.out.println("이미지 표시 왜안돼냐고 ");
		if (image.exists()) { 
			//Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
			Thumbnails.of(image).size(586,600).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	@RequestMapping("/product/download")
	public void download(@RequestParam("product_detail_image") String imageFileName,
					HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
