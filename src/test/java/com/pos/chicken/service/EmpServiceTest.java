package com.pos.chicken.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.EmpServiceRepository;

@SpringBootTest
public class EmpServiceTest {
	
	@PersistenceContext Session session;
	
	@Autowired
	private EmpRepository dao;
	
	@Autowired
	private EmpServiceRepository empservice;
	//時間
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	@Test
	public void empInsert() throws Exception {
		
		Date date = sdf.parse("1997-06-01");
		
		
		
		
	}
	//@Test
	public void empEdit() throws Exception{
		EmpBean bean = new EmpBean();
		Date newdate = sdf.parse("1990-06-06");
		bean.setEmpID("unitTest");
		
		bean.setEmpName("I will be the best");
		
		bean.setEmpPassword("TtEeSsTt");
		
		empservice.editEmp(bean);
	}
	//@Test
	public void empLogin() {
		 empservice.login("beetest", "appletest1");
		 
	}
	//@Test
	public void empDelete() {
		EmpBean bean = new EmpBean();
		bean.setEmpID("1");
		empservice.deleteEmp(bean);
	}
	@Test
	public void empSelect() {
		EmpBean bean = new EmpBean();
		bean.setEmpID("Boss");
		List<EmpBean> a= empservice.selectEmp(null);
		System.out.println(a);
	}
//	@Test
	public void empInsert1() {
		try {
		EmpBean bean = new EmpBean();
		bean.setEmpID("Emp013");
		bean.setEmpName("蔡SQL");
//		bean.setEmpPassword("password");
		bean.setEmpPostion("員工");
		bean.setEmpHrs(8);
//		dao.save(bean);
		empservice.addEmp1(bean);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
