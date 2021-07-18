package com.pos.chicken.domain;

public class EmployeeHour {

	private Long hour;
	
	public EmployeeHour(Long hour) {
		this.hour=hour;
	}

	@Override
	public String toString() {
		return "EmployeeHour [hour=" + hour + "]";
	}

	public Long getHour() {
		return hour;
	}

	public void setHour(Long hour) {
		this.hour = hour;
	}
}
