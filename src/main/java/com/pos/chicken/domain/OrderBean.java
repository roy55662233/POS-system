package com.pos.chicken.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Entity
@Table(name="orders")
@Data
public class OrderBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "Order_ID")
	@Column(name="Order_ID")
	private Integer orderId;
	
	@JsonFormat(shape= JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="GMT+8")
	@Column(name="Order_Date")
	private java.util.Date orderDate;
	@Column(name="Order_mark")
	private String orderMark;
	
//	@JsonManagedReference
	@JsonIgnore
	@OneToMany(mappedBy="orderfk",cascade= {CascadeType.ALL},fetch = FetchType.EAGER)
	private List<OrderDetailBean> orderdetails;
	
//	@JsonBackReference
	@JsonIgnore
	@ManyToOne
	@JoinColumn(
			name="Emp_ID",
			referencedColumnName = "Emp_ID",
			insertable=true,updatable=true
	)
	
	private EmpBean empfk;

	@Override
	public String toString() {
		return "OrderBean [orderId=" + orderId + ", orderDate=" + orderDate + ", orderMark=" + orderMark
				+ "]";
	}
	
}
