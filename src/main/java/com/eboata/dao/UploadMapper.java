package com.eboata.dao;

import org.springframework.stereotype.Repository;

import com.eboata.model.Word;

/**
 * @author lizhao
 *
 */
@Repository
public interface UploadMapper {
	
	//增加文档信息
	int addUpload(Word word);

}
