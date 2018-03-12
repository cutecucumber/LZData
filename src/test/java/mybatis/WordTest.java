/**
 * 2018年1月19日
 * admin
 * 
 */
package mybatis;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eboata.dao.UploadMapper;
import com.eboata.dao.impl.UploadMapperImpl;
import com.eboata.model.Word;

/**
 * @author lizhao
 *
 */
public class WordTest {
	
	/*@Autowired
	private UploadMapper uploadMapper;*/
	
	@Test
	public void test(){
		
		UploadMapper uploadMapper = new UploadMapperImpl();
		
		Word word = new Word();
		
		/*word.setId(1);*/
		word.setName("滑板鞋");
		word.setDescp("滑冰的");
		word.setLogo("111");
		
		uploadMapper.addUpload(word);
	}

}
