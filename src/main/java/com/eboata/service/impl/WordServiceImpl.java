/**
 * 2018年1月23日
 * admin
 * 
 */
package com.eboata.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eboata.dao.UploadMapper;
import com.eboata.model.Word;
import com.eboata.service.WordService;

/**
 * @author lizhao
 *
 */
@Service(value = "wordService")
public class WordServiceImpl implements WordService {
	
	@Autowired
	private UploadMapper uploadMapper;

	public int addWord(Word word) {
		
		int flag = 0;
		
		flag = uploadMapper.addUpload(word);
		
		System.out.println("ssssssss"+flag);
		
		return flag;
	}

	
}
