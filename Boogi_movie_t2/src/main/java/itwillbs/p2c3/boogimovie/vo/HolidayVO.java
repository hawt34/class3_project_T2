package itwillbs.p2c3.boogimovie.vo;

import java.sql.Date;

public class HolidayVO {
	private String holiday_name;
	private Date holiday_date;
	
	
	public String getHoliday_name() {
		return holiday_name;
	}
	public void setHoliday_name(String holiday_name) {
		this.holiday_name = holiday_name;
	}
	public Date getHoliday_date() {
		return holiday_date;
	}
	public void setHoliday_date(Date holiday_date) {
		this.holiday_date = holiday_date;
	}
	@Override
	public String toString() {
		return "HolidayVO [holiday_name=" + holiday_name + ", holiday_date=" + holiday_date + "]";
	}
	
	
	
}
