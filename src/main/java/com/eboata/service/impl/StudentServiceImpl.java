/**
 * 2017年12月22日
 * admin
 * 
 */
package com.eboata.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.eboata.dao.StudentMapper;
import com.eboata.model.Student;
import com.eboata.service.StudentService;
import com.eboata.utils.MD5Utils;

/**
 * @author admin
 *
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource(name = "studentMapper")
	private StudentMapper studentMapper;
	
	
	public Student selectByName(String username) {
		
		Student student = studentMapper.selectByName(username);
		
		return student;
	}

	public int deleteByPrimaryKey(Integer id) {
		
		return 0;
	}

	public List<Student> selectAll() {
		
		List<Student> student = studentMapper.selectAll();
		
		return student;
	}

	public int updateByPrimaryKey(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	//编辑个人信息
	public int updateSelective(Student student) {
		
		int flag = 0;
		
		flag = studentMapper.updateSelective(student);
		
		return flag;
	}

	public int insertSelective(Student student) {
		
		student.setPassword(MD5Utils.EncoderByMd5(student.getPassword()));
		
		int flag = 0;
		
		flag = studentMapper.insertSelective(student);
		
		/*System.out.println(flag+">>>>>>>>>>>>>>");*/
		
		return flag;
	}

}
