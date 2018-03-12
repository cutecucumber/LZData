/**
 * 2017年12月25日
 * admin
 * 
 */
package com.eboata.utils;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.eboata.dao.StudentMapper;


/**
 * 关于mybatis的一个工具类（减少冗余代码的）
 * @author lizhao
 *
 */
public class DBUtil {
	
	/*private static Logger log = LoggerFactory.getLogger(DBUtil.class);*/
	
	public static SqlSession dataSource(){
	
		try{
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			
			SqlSessionFactory Sqlsession = new SqlSessionFactoryBuilder().build(is);
			
			SqlSession session = Sqlsession.openSession(true);
			
			return session;
		
		}catch(Exception e){
			
			e.printStackTrace();
			
			/*System.out.println("有问题了");*/
			
			/*log.error("数据库初始化有问题");*/
		}
		
		return null;
	}

}
