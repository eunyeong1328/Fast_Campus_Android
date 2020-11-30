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

	private String notice_file_path = "C:\\DRJJ\\notice\\";
	private String memQ_file_path = "C:\\DRJJ\\member_q\\";
	private String memA_file_path = "C:\\DRJJ\\member_a\\";

	@RequestMapping("/fileDownload.do")
	public void fileDownload(@RequestParam("image") String image, @RequestParam("action") String action, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		System.out.println("fileDownload action: " + action);
		String downFile = null;
		if (action.equals("notice")) {
			downFile = notice_file_path + image;
		} else if (action.equals("memQ")) {
			downFile = memQ_file_path + image;
		} else if (action.equals("memA")) {
			downFile = memA_file_path + image;
		} 
		
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

	public HashMap<String, Object> fileUpload(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		HashMap<String, Object> map = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		List<String> fileList = fileProcess(multipartRequest);
		map.put("images", fileList.toString());
		return map;
	}

	public List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws IOException {
		List<String> fileList = new ArrayList<String>();
		List<MultipartFile> mFiles = multipartRequest.getFiles("file[]");
		String action = multipartRequest.getParameter("action");
		String savePath = null;
		System.out.println("멀티파트 액션 체크" + action);
		
		for (MultipartFile mfile : mFiles) {
			String originalFileName = mfile.getOriginalFilename();
			fileList.add(originalFileName);
			if (action.equals("noticeAdd")) {
				savePath = notice_file_path + originalFileName;
			} else if (action.equals("memqAdd")) {
				savePath = memQ_file_path + originalFileName;
			} else if (action.equals("memqAdminAdd")) {
				savePath = memA_file_path + originalFileName;
			}
			File file = new File(savePath);
			if (mfile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); // 이후 파일 생성
					}
				}
				mfile.transferTo(new File(savePath)); // 임시로 저장된 multipartFile을 실제 파일로 전송
			} else {
				System.out.println("등록할 파일이 없습니다.");
			}
		}

		return fileList;
	}

}
