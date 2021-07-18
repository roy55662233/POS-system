package com.pos.chicken.domain;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Entity
@Table(name="emp")
@Data
public class EmpBean {
	@Id
	@Column(name="Emp_id")
	private String empID;
	@Column(name="Emp_password")
	private String empPassword;
	@Column(name="Emp_name")
	private String empName;
//	@Column(name="Emp_authority")
//	private boolean empAuthority;
	@Column(name="Emp_postion")
	private String empPostion;
	@Column(name="Emp_hrs")
	private Integer empHrs;
	
//	@JsonManagedReference
	@JsonIgnore
	@OneToMany(mappedBy="empfk",cascade= {CascadeType.ALL},fetch = FetchType.EAGER)
	private List<OrderBean> orderemp;

	@Override
	public String toString() {
		return "EmpBean [empId=" + empID + ", empPassword=" + empPassword + ", empName=" + empName + ", empPostion="
				+ empPostion + ", empHrs=" + empHrs + "]";
	}

	
}
