/**
 * 2017年12月21日
 * admin
 * 
 */
package com.eboata.dao;

import java.util.List;

import com.eboata.model.Student;

/**
 * @author lizhao
 *
 */
public interface StudentMapper {
	
	//登录查询用户信息，进行判断
	Student selectByName(String username);

	//根据主键删除信息
	int deleteByPrimaryKey(Integer id);
	
	//查询所有的学生信息
	List<Student> selectAll();
	
	//根据主键修改学生信息
	int updateByPrimaryKey(Student student);
	
	//增加学生信息
	int addStudent(Student student);
	
	//根据主键修改学生信息
	int updateSelective(Student student);
	
	//增加学生信息
	int insertSelective(Student student);
}
