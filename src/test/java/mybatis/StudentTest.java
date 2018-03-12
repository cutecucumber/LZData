/**
 * 2017年12月21日
 * admin
 * 
 */
package mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.eboata.dao.StudentMapper;
import com.eboata.dao.impl.StudentMapperImpl;
import com.eboata.model.Student;
import com.eboata.service.StudentService;
import com.eboata.service.impl.StudentServiceImpl;

/**
 * @author lizhao 
 *
 */
public class StudentTest {
	
	/*private String filename = "mybatis-config.xml";
	
	@Test
	public void test1(){
		
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(filename);
			SqlSessionFactory Sqlsession = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = Sqlsession.openSession();
			
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			Student student = mapper.selectByPrimaryKey(4);
			System.out.println(student.getUsername()+"\t"+student.getSex()+"\t"+student.getBirthday());
			
			Student stu = new Student();
			stu.setId(3);
			stu.setUsername("James");
			mapper.updateSelective(stu);
			mapper.deleteByPrimaryKey(4);
			
			Student stu = new Student();
			stu.setId(9);
			stu.setUsername("Ji");
			stu.setSex("男");
			stu.setBirthday(new Date());
			stu.setAge(20);
			stu.setClassid(3);
			mapper.addStudent(stu);
			
			session.commit();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}*/
	/*@Test
	public void test(){
		StudentService student = new StudentServiceImpl();
		Student stu = new Student();
		stu.setId(6);
		stu.setUsername("Ji");
		stu.setSex("男");
		stu.setBirthday(new Date());
		stu.setAge(20);
		stu.setClassid(3);
		stu.setPassword("123456");
		stu.setType("user");
		student.insertSelective(stu);
	}*/
	@Test
	public void sss(){
		StudentMapper ss = new StudentMapperImpl();
		
		ss.deleteByPrimaryKey(6);
		
	}
	@Test
	public void ssss(){
		
		StudentMapper ss = new StudentMapperImpl();
		
		Student student = new Student();
		student.setId(62);
		student.setPassword("123456");
		student.setAge(20);
		ss.updateSelective(student);
	}

}
