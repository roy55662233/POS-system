package com.pos.chicken;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
public class DataSource1 {

	@Autowired
	private DataSource dataSource;
	@Test
	public void testDataSource() throws SQLException{
	Connection conn = dataSource.getConnection();
	String sql="INSERT INTO `orderdetail` (`orderd_id`,`Order_ID`, `Order_Name`, `Order_Count`, `Order_Price`,"
			+ " `Order_Unitsprice`) VALUES (?,?,?,?,?)";
	String sql2="INSERT INTO `orderdetail` (`OrderD_ID`, `Order_ID`, `Order_Name`, `Order_Count`, `Order_Price`, `Order_Unitsprice`) VALUES (NULL, '7', 'bbbbbbbb', '20', '300', '15')";
	//PreparedStatement pstmt = conn.prepareStatement(sql);
	Statement stmt = conn.createStatement();
	stmt.execute(sql2);

	
	
	


	
	
	stmt.close();
	conn.close();
}
}
