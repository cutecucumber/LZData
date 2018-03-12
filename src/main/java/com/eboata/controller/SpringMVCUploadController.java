package com.eboata.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author lizhao
 *
 */
@Controller
@RequestMapping(value = "/springmvc/upload")
public class SpringMVCUploadController {
	
	@RequestMapping(value = "/uploadfile")
	public String uploadFile(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws Exception{
		
		String filename = file.getOriginalFilename();
		
		String basePath = req.getServletContext().getRealPath("/WEB-INF/images");
		
		File files = new File(basePath,filename);
		
		System.out.println(111+basePath);
		
		file.transferTo(files);
		
		req.setAttribute("message", files.getAbsolutePath());
		
		/*System.out.println(file.getOriginalFilename());
		if(!file.isEmpty()){
			
			FileOutputStream os = new FileOutputStream("D:/"+new Date().getTime()+file.getOriginalFilename());
			InputStream is = file.getInputStream();
			int a = 0;
			if((a=is.read()) != -1){
				os.write(a);
			}
			os.flush();
			os.close();
			is.close();
		}
		return "redirect:/suc.jsp";
		*/
		
		return "/springmvcupload";
		
		
	}

}
