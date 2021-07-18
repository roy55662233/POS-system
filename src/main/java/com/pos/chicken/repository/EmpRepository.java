package com.pos.chicken.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.domain.EmployeeHour;

public interface EmpRepository extends JpaRepository<EmpBean, String> {

	@Transactional
	  @Query("SELECT NEW com.pos.chicken.domain.EmployeeHour(SUM(emp.empHrs)) FROM EmpBean emp"
	     
	    )
	  List<EmployeeHour> selectEmployeeHour();
}
