package itwillbs.p2c3.boogimovie.vo;

public class TheaterVO {
	
	private int theater_num;
	private String theater_address;
	private String theater_map_x;
	private String theater_map_y;
	private String theater_map_code;
	private String theater_name;
	private String theater_parking;
	private String theater_floor_info;
	private String theater_facility_info;
	
	
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getTheater_address() {
		return theater_address;
	}
	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}
	public String getTheater_map_x() {
		return theater_map_x;
	}
	public void setTheater_map_x(String theater_map_x) {
		this.theater_map_x = theater_map_x;
	}
	public String getTheater_map_y() {
		return theater_map_y;
	}
	public void setTheater_map_y(String theater_map_y) {
		this.theater_map_y = theater_map_y;
	}
	public String getTheater_map_code() {
		return theater_map_code;
	}
	public void setTheater_map_code(String theater_map_code) {
		this.theater_map_code = theater_map_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_parking() {
		return theater_parking;
	}
	public void setTheater_parking(String theater_parking) {
		this.theater_parking = theater_parking;
	}
	public String getTheater_floor_info() {
		return theater_floor_info;
	}
	public void setTheater_floor_info(String theater_floor_info) {
		this.theater_floor_info = theater_floor_info;
	}
	public String getTheater_facility_info() {
		return theater_facility_info;
	}
	public void setTheater_facility_info(String theater_facility_info) {
		this.theater_facility_info = theater_facility_info;
	}
	@Override
	public String toString() {
		return "TheaterVO [theater_num=" + theater_num + ", theater_address=" + theater_address + ", theater_map_x="
				+ theater_map_x + ", theater_map_y=" + theater_map_y + ", theater_map_code=" + theater_map_code
				+ ", theater_name=" + theater_name + ", theater_parking=" + theater_parking + ", theater_floor_info="
				+ theater_floor_info + ", theater_facility_info=" + theater_facility_info + "]";
	}

	
	
}
