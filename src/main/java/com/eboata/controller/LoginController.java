/**
 * 2017年12月21日
 * admin
 * 
 */
package com.eboata.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsNull;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eboata.dao.StudentMapper;
import com.eboata.model.Student;
import com.eboata.utils.MD5Utils;

import net.sf.json.JSONObject;

/**
 * @author lizhao
 *
 */
@Controller
public class LoginController {
	
	@Resource(name = "studentMapper")
	private StudentMapper studentMapper;
	
	//学生登录
	@RequestMapping(value = "/login")
	public void login(@RequestParam(value = "login")String username,@RequestParam(value = "pwd")
		String password,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		HttpSession session = req.getSession();
		
		session.setAttribute("username", username);
		
		String flag = "0";
		
		Student student = studentMapper.selectByName(username);
		
		if(student == null){
			
			flag = "-2";
			
			resp.getWriter().write(flag);
			
			return ;
		}
		
		password = MD5Utils.EncoderByMd5(password);
		
		if(student != null && student.getPassword().equals(password)){
			
			if("admin".equals(student.getType())){
				
				flag = "1";
			
			}else if("user".equals(student.getType())){
				
				flag = "2";
				
			}else{
				
				System.out.println("用户信息错误");
			}
			
		}
		
		/*JSONObject json = new JSONObject();
		json.put("flag", flag);*/
		
		System.out.println(flag);
		
		/*JSONObject json = new JSONObject();
		
		json.put("flag", flag);*/
		/*System.out.println(json.toString());*/
		resp.getWriter().write(flag);
		
	}
	
	//鼠标移出事件来判断用户名是否存在
	@RequestMapping(value = "/confirm")
	public void confirm(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		String flag = "0";
		
		String username = req.getParameter("login");
		
		System.out.println(username);
		
		List<Student> list = studentMapper.selectAll();
		
		if(list.size()>0 || list != null){
		
			for(Student stu:list){
				
				System.out.println(stu.getUsername());
				
				if(username.equals(stu.getUsername())){
					
					flag = "1";
				}
				
			}
		}
		JSONObject json = new JSONObject();
		
		json.put("flag", flag);
		
		resp.getWriter().write(json.toString());
	}
	//学生注册
	@RequestMapping(value = "/register")
	public void register(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		JSONObject json = new JSONObject();
		
		int flag = 0;
		
		String username = req.getParameter("login");
		
		String password = req.getParameter("pwd");
		
		String password1 = req.getParameter("pwd1");

		String type = req.getParameter("type");
		
		if(!password.equals(password1)){
			
			flag = -2;
			
			json.put("flag", flag);
			
			resp.getWriter().write(json.toString());
			
			return ;
		}
		
		Student student = new Student();
		
		student.setUsername(username);
		
		student.setPassword(password);
		
		student.setType(type);
		
		List<Student> stu = studentMapper.selectAll();
		
		for(Student list : stu){
			
			if(username.equals(list.getUsername())){
				flag = -1;
			}
		}
		if(flag == 0){
			
			flag = studentMapper.insertSelective(student);
		
		}
		/*System.out.println(flag);*/
		
		json.put("flag", flag);
		
		resp.getWriter().write(json.toString());
		
	}
	//查询出该学生的信息，用户学生信息修改时候的显示
	@RequestMapping(value = "/selectAll",method = RequestMethod.GET)
	public void selectAll(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		HttpSession session = req.getSession();
		
		Student student = studentMapper.selectByName((String) session.getAttribute("username"));
		
		JSONObject json = JSONObject.fromObject(student);
		
		resp.getWriter().write(json.toString());
		
	}
	//修改学生信息
	@RequestMapping(value = "/user",method = RequestMethod.GET)
	public void userInfo(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		int id = Integer.parseInt(req.getParameter("id"));
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		int age = Integer.parseInt(req.getParameter("age"));
		String sex = req.getParameter("sex");
		
		Student stu = new Student();
		stu.setId(id);
		stu.setPassword(MD5Utils.EncoderByMd5(password));
		stu.setUsername(username);
		stu.setAge(age);
		stu.setSex(sex);
		/*HttpSession session = req.getSession();
		session.setAttribute("sex", sex);*/
		/*String id = req.getParameter("id");
		
		String password = req.getParameter("password");*/
		
		int flag = studentMapper.updateSelective(stu);
		
		JSONObject json = new JSONObject();
		
		json.put("flag", flag);
		
		resp.getWriter().write(json.toString());
		
		/*resp.getWriter().write(flag);*/
	
	}

}
