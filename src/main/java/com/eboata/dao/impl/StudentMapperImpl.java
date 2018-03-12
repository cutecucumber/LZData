package com.eboata.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.eboata.dao.StudentMapper;
import com.eboata.model.Student;
import com.eboata.utils.DBUtil;
import com.eboata.utils.MD5Utils;

/**
 * @author lizhao
 *
 */
@Repository("studentMapper")
public class StudentMapperImpl implements StudentMapper {
	
	//反射出StudentMapper接口中的方法
	private static StudentMapper mapper = DBUtil.dataSource().getMapper(StudentMapper.class);

	//登录查询用户信息，进行判断
	public Student selectByName(String username) {
		
		Student student = mapper.selectByName(username);
		
		DBUtil.dataSource().close();
		
		return student;
			
	}

	//根据主键删除信息
	public int deleteByPrimaryKey(Integer id) {
		
		mapper.deleteByPrimaryKey(id);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

	//查询所有的学生信息
	public List<Student> selectAll() {
		
		List<Student> student = mapper.selectAll();
		
		DBUtil.dataSource().close();
		
		return student;
	}

	//根据主键修改学生信息
	public int updateByPrimaryKey(Student student) {
		
		mapper.updateByPrimaryKey(student);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

	//增加学生信息
	public int addStudent(Student student) {
		
		mapper.addStudent(student);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

	//根据主键修改学生信息
	public int updateSelective(Student student) {
		
		mapper.updateSelective(student);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

	//增加学生信息
	public int insertSelective(Student student) {
		
		student.setPassword(MD5Utils.EncoderByMd5(student.getPassword()));
		
		mapper.insertSelective(student);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

}




