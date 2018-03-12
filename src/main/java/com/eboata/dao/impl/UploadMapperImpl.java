/**
 * 2018年1月19日
 * admin
 * 
 */
package com.eboata.dao.impl;

import org.springframework.stereotype.Repository;

import com.eboata.dao.StudentMapper;
import com.eboata.dao.UploadMapper;
import com.eboata.model.Word;
import com.eboata.utils.BASE64Util;
import com.eboata.utils.DBUtil;

/**
 * @author lizhao
 *
 */
@Repository(value = "uploadMapper")
public class UploadMapperImpl implements UploadMapper{
	
	//反射出UploadMapper接口中的方法
	private static UploadMapper mapper = DBUtil.dataSource().getMapper(UploadMapper.class);

	public int addUpload(Word word) {
		
		/*word.setLogo(BASE64Util.Image2String(word.getLogo()));*/
		
		mapper.addUpload(word);
		
		DBUtil.dataSource().close();
		
		return 1;
	}

}
