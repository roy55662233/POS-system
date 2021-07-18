package com.pos.chicken.iotest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.FileCopyUtils;

@SpringBootTest
public class iotest {
	
	 @Value("${web.upload-path}")
	    private String path;
	
	//@Test
	public void method() {
		try {
			FileOutputStream fout = 
					new FileOutputStream("/img/c1.jpg");
			FileInputStream fin =
				new FileInputStream("dir1/coffee.jpg");
			byte[] buf = new byte[4*1024]; int len = 0;
			while ((len = fin.read(buf)) != -1) {
				fout.write(buf, 0, len);
			}
			fin.close();
			
			fout.flush();
			fout.close();
			System.out.println("OK");
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	//  @Test
	  public void uploadTest() throws Exception {
	        File f = new File("D:/c2.jpg");
	        FileCopyUtils.copy(f, new File(path+"/1.jpg"));
	    }
	  
	  @Test
	  public void listFilesTest() {
	      File file = new File(path);
	      for(File f : file.listFiles()) {
	          System.out.println("fileName : "+f.getName());
	      }
	

}
}
