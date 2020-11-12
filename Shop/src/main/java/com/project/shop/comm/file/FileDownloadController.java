package com.project.shop.comm.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "c:\\shop\\file_repo";
	
	@RequestMapping("/download")
	public void download(@RequestParam("product_image") String product_image, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH +"\\"+ product_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileNmae="+product_image);
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
