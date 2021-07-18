package com.pos.chicken.iotest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import com.pos.chicken.domain.ProdBean;
import com.pos.chicken.repository.ProdRepository;


@SpringBootTest
public class ProdIOtest {
	@Value("${web.upload-path}")
    private String path;
	
	@Autowired
	private ProdRepository prod;
	@Autowired
	private DataSource datasource;
//	@Autowired
//	private multipartResolver mu;
	
//	@Test
	public void method() {
		File f = new File("D:/c3.jpg");
		
		try {
			FileInputStream fout = 
					new FileInputStream(f);
			
			byte[] img = fout.toString().getBytes();
			ProdBean bean = new ProdBean();
			bean.setProdID(6);
//			bean.setProdImg(img);
			bean.setProdCount(10);
			bean.setProdCategory("炸物");
			bean.setProdName("上天雞排");
			bean.setProdUnit("片");
			bean.setProdPrice(80);
			prod.save(bean);
			
//			FileInputStream fin =
//				new FileInputStream(path+"/2.jpg");
//			byte[] buf = new byte[4*1024]; int len = 0;
//			while ((len = fin.read(buf)) != -1) {
//				fout.write(buf, 0, len);
//			}
//			fin.close();
			
			
			fout.close();
			System.out.println("OK");
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	@Test
	public void select() throws Exception{
		
	 	String sql = "select * from prod where prod_id = 5";
	 	Connection conn = datasource.getConnection();
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	ResultSet rs = pstmt.executeQuery();
	 	rs.next();
	 	FileOutputStream fout = new FileOutputStream(path+"/0614再一次.jpg");
	 	InputStream in = rs.getBinaryStream("prod_img");
	 	int len = 0;
	 	byte[] buf = new byte[4096];
	 	while((len=in.read(buf))!=-1) {
	 		fout.write(buf,0,len);
	 	}
	 	fout.flush();
	 	fout.close();
	 	in.close();
	}
//	@Test
	public void insertImg() {
		
		try {
			Connection conn = datasource.getConnection();
			 FileInputStream fin = new FileInputStream("D:/a1.png");
			 String sql = "update prod set prod_img=? where prod_id = 1";
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setBinaryStream(1, fin);
			 pstmt.executeUpdate();
			 System.out.println("Update OK");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
//	@Test
	public void t() {
		
	}
	}

