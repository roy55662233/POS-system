package com.pos.chicken.repository;




import java.util.ArrayList;

import java.util.List;
import java.util.Optional;


import javax.persistence.PersistenceContext;


import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.domain.EmpBean;

@Service
@Transactional
public class EmpServiceRepository {

	@Autowired
	private EmpRepository empdao = null;
	
	
	@PersistenceContext
	private Session session;
	
	
//	public void addEmp(String empId, String empName,String empPassword, Integer empHrs  ,String empPostion) {
//		
//		EmpBean bean = new EmpBean();
//		bean.setEmpId(empId);
//		bean.setEmpName(empName);
//		bean.setEmpPassword(empPassword);
////		bean.setEmpAuthority(empAuthority);
//		bean.setEmpHrs(empHrs);
//		bean.setEmpPostion(empPostion);
//		
//		empdao.save(bean);
//		
//		
//	}
	public EmpBean addEmp1(EmpBean bean) {
		EmpBean result = null;
		if(bean != null && bean.getEmpID()!=null && bean.getEmpID()!="") {
			
			if(!empdao.existsById(bean.getEmpID())) {
				
				result = empdao.save(bean);
				System.out.println("讓我進去");
			}
			
		}
		return result;
	}
	
//	public void addEmp2
//	(String empId, String empPassword, String empName , Date empBirthday, String empPhone, String empEmail) {
//		String hql=
//				"INSERT  INTO `emp` (`Emp_ID`, `Emp_password`, `Emp_Name`, `Emp_Birthday`, `Emp_Phone`, `Emp_Email`) "
//				+ "VALUES"+ "("+"'"+empId+"'"+"," +"'"+empPassword+"'"+"," +"'"+empName+"'"
//				+"," +"'"+empBirthday+"'"+"," +"'"+empPhone+"'"+","+"'"+empEmail+"'"+")";
//		
//		String hql2=
//				"INSERT INTO `emp` (`Emp_ID`, `Emp_password`, `Emp_Name`, `Emp_Birthday`, `Emp_Phone`, `Emp_Email`) "
//				+ "VALUES"+ "("+"'"+empId+"'"+"," +"'"+empPassword+"'"+"," +"'"+empName+"'"
//				+"," +empBirthday+"," +"'"+empPhone+"'"+","+"'"+empEmail+"'"+")";
//		System.out.println(hql);
//		
//		int num1 = entityManager.createNativeQuery(hql).executeUpdate();
//
//		System.out.println(num1);
//		
//	}
	
	public List<EmpBean> selectEmp(EmpBean bean) {
		List<EmpBean> result = null;
		if(bean!=null && bean.getEmpID()!=null  ) {
			Optional<EmpBean> optional = empdao.findById(bean.getEmpID());
			if(!optional.isEmpty()) {
				EmpBean temp = optional.get();
				System.out.println("a");
				result = new ArrayList<EmpBean>();
				result.add(temp);
				}else {
				result = empdao.findAll();
			System.out.println("hi all emp");
			
			
				
				
			}
		}
			
			return result;
	}
	
	public boolean deleteEmp(EmpBean bean) {
		boolean result = false;
		if(bean != null && bean.getEmpID()!=null) {
			if(empdao.existsById(bean.getEmpID())) {
				empdao.delete(bean);
				System.out.println("delete OK");
				result = true;
			}else {
				System.out.println("delete failed");
			}
		}
		return result;
	}
	
	public EmpBean editEmp(EmpBean bean) {
		EmpBean result = null;
		if(bean !=null && bean.getEmpID()!=null) {
			if(empdao.existsById(bean.getEmpID())) {
				result = empdao.save(bean);
			}
		}
		return result;
	}
	
	
	
	public EmpBean login(String empId,String password) {
		Optional<EmpBean> optional = empdao.findById(empId);
		if(!optional.isEmpty()) {
			EmpBean bean = optional.get();
			
			if(password!=null&& password.length()!=0) {
				String pass = bean.getEmpPassword();
				System.out.println(pass);
				System.out.println(password);
				if(pass.equals(password)) {
					System.out.println("login OK");
					return bean;
				}else {
					System.out.println("login failed");
				}
			}
		}
		return null;
	}
	
	public boolean changePassword(String empId, String oldPassword, String newPassword) {
		EmpBean bean = this.login(empId, oldPassword);
		if(bean!=null) {
			bean.setEmpPassword(newPassword);
			bean=empdao.save(bean);
			return true;
		}
		return false;
	}
}
