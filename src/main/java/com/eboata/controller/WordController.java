/**
 * 2018年1月23日
 * admin
 * 
 */
package com.eboata.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eboata.model.Word;
import com.eboata.service.WordService;

import net.sf.json.JSONObject;

/**
 * @author lizhao
 *
 */
@Controller
public class WordController {
	
	@Autowired
	private WordService wordService;

	@RequestMapping(value = "/addWord",method = RequestMethod.GET)
	public void addWord(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		int flag = 0;
		
		/*String logo = req.getParameter("picName");*/
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String descp = req.getParameter("descp");
		
		System.out.println("11111"+"\t"+id+"\t"+name+"\t"+descp+"\t");
		
		Word word = new Word();
		/*word.setLogo(logo);*/
		word.setId(Integer.parseInt(id));
		word.setName(name);
		word.setDescp(descp);
		
		flag = wordService.addWord(word);
		JSONObject json = new JSONObject();
		json.put("flag", flag);
		resp.getWriter().write(json.toString());
		
	}
}
