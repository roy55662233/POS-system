package com.pos.chicken.domain;




public class MonthPrice {
	private Long totalprice;
	private Integer month;
	
	public MonthPrice(Long totalprice,Integer month) {
		this.totalprice = totalprice;
		this.month = month;
	}

	public Long getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Long totalprice) {
		this.totalprice = totalprice;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "NewPojo [totalprice=" + totalprice + ", month=" + month + "]";
	}
	
	
	

	

	
}
