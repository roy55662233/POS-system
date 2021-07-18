package com.pos.chicken.domain;



import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;


@Entity
@Table(name = "prod")
@Data
public class ProdBean {
	
	@Id
	@Column(name="Prod_ID")
	private Integer prodID;
	@Column(name="Prod_Name")
	private String prodName;
	@Column(name="Prod_Unit")
	private String prodUnit;
	@Column(name="Prod_Category")
	private String prodCategory;
	@Column(name="Prod_Price")
	private Integer prodPrice;
	@Column(name="Prod_Count")
	private Integer prodCount;
	
//	@Column(name="Prod_Img")
//	@Lob
//	@Type(type="org.hibernate.type.ImageType")
//	private  byte[] prodImg;

	
//	@JsonManagedReference
	@JsonIgnore
	@OneToMany(mappedBy="prodfk",cascade= {CascadeType.ALL},fetch = FetchType.EAGER)
	private List<OrderDetailBean> prodorderdetails;

	@Override
	public String toString() {
		return "ProdBean [prodID=" + prodID + ", prodName=" + prodName + ", prodUnit=" + prodUnit + ", prodCategory="
				+ prodCategory + ", prodPrice=" + prodPrice + ", prodCount=" + prodCount + "]";
	}

	

	
}