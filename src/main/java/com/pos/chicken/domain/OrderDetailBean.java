package com.pos.chicken.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@IdClass(OrderDetailBean.ConfigId.class)
@Entity
@Table(name="orderdetail")
//@Table(name="orderdetail",uniqueConstraints={@UniqueConstraint(columnNames={"Order_ID","Prod_ID"})})
//@Table(name="orderdetail",uniqueConstraints= @UniqueConstraint(columnNames={"Order_ID","Prod_ID"}) ) 
@Data
public class OrderDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Order_ID")
	private Integer orderId;
	
	@Id
	@Column(name="Prod_ID")
	private Integer prodID;
	
	@Column(name="Order_count")
	private Integer orderCount;
	@Column(name="Order_price")
	private Integer orderPrice;
	@Column(name="Order_Unitsprice")
	private Integer orderUnitsprice;
	
//	@JsonBackReference	
//	@JsonIgnore
	@ManyToOne
	@JoinColumn(
			name="Order_ID",
			referencedColumnName = "Order_ID",
			insertable=false,updatable=false)
	private OrderBean orderfk;

//	@JsonBackReference
//	@JsonIgnore
	@ManyToOne
	@JoinColumn(
			name="Prod_ID",
			referencedColumnName = "Prod_ID",
			insertable=false,updatable=false
	)
	private ProdBean prodfk;

	@Override
	public String toString() {
		return "OrderDetailBean [orderId=" + orderId + ", prodID=" + prodID + ", orderCount=" + orderCount
				+ ", orderPrice=" + orderPrice + ", orderUnitsprice=" + orderUnitsprice + ", orderfk=" + orderfk
				+ ", prodfk=" + prodfk + "]";
	}
	
	public static class ConfigId implements Serializable {
        private static final long serialVersionUID = 1L;
        
        private Integer orderId;
		private Integer prodID;

		public Integer getOrderId() {
			return orderId;
		}

		public void setOrderId(Integer orderId) {
			this.orderId = orderId;
		}

		public Integer getProdID() {
			return prodID;
		}

		public void setProdID(Integer prodID) {
			this.prodID = prodID;
		}
    }
	
}
