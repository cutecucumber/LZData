/**
 * 2017年12月22日
 * admin
 * 
 */
package com.eboata.service;

import java.util.List;

import com.eboata.model.Student;

/**
 * @author admin
 *
 */
public interface StudentService {
	
	//用户登陆验证
	Student selectByName(String username);

	int deleteByPrimaryKey(Integer id);
	
	List<Student> selectAll();
	
	int updateByPrimaryKey(Student student);
	
	int addStudent(Student student);
	
	int updateSelective(Student student);
	
	int insertSelective(Student student);
}
