/**
 * 2017年12月27日
 * admin
 * 
 */
package com.eboata.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;

/**
 * @author lizhao
 *
 */
@Controller
public class uploadController {
	
	@RequestMapping(value = "/upload")
	public void upload(@RequestParam(value = "file",required = true)MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		String path = req.getSession().getServletContext().getRealPath("pic/");
		
		String fileName = file.getOriginalFilename();
		
		File files = new File(path,fileName);
		
		if(!files.exists()){
			
			files.mkdirs();
		}
		
		try {
			String picName = path/*+File.separator*/+fileName;
			
			file.transferTo(new File(picName));
			
			JSONObject json = new JSONObject();
			
			json.put("picName", picName);
			
			System.out.println(picName);
			
			resp.getWriter().write(json.toString());
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
