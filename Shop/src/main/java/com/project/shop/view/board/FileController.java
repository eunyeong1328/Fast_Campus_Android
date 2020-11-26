package com.project.shop.view.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/board")
public class FileController {
	
	private static String path = "C:\\Users\\bitcamp\\git\\web-project\\Shop\\src\\main\\webapp\\resources\\memQ\\";
	
	@RequestMapping("/fileDownload.do")
	public void fileDownload(@RequestParam("image") String image, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		
		String downFile = path + image;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + image);
		
		FileInputStream in = new FileInputStream(file);
		
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	public HashMap<String, Object> fileUpload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		HashMap<String, Object> map = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		List<String> fileList = fileProcess(multipartRequest);
		int i = 1;
		if (fileList != null) {
			for (String image : fileList) {
				if (image != null) {
					map.put("image" + i, image);
					i++;
				}
			}
		} else {
			for (i = 1; i <= 3; i++) {
				System.out.println(i + "번째 등록된 파일이 없습니다.");
			}
		}
		return map;
	}
	
	public List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws IOException {
		multipartRequest.setCharacterEncoding("utf-8");
		List<String> fileNameList = new ArrayList<String>();
		   
		List<MultipartFile> fileList = multipartRequest.getFiles("file[]");
		
		if(fileList.isEmpty()) {
			return null;
		}
	
		for(MultipartFile mfile : fileList) {
			String originalFileName = mfile.getOriginalFilename();
			fileNameList.add(originalFileName);
			
			String saveFile = path + originalFileName;
			File file = new File(saveFile);
			
			if(!file.exists()) {
				if(file.getParentFile().mkdirs()) {
					file.createNewFile();
				}
			}
			
			try {
				mfile.transferTo(new File(saveFile));
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return fileNameList;
	}
	
}
