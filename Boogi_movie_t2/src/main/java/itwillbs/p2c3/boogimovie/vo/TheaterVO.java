package itwillbs.p2c3.boogimovie.vo;


public class TheaterVO {
	
	private int theater_num;
	private String theater_address;
	private String theater_map_x;
	private String theater_map_y;
	private String theater_floor_info;
	private String theater_name;
	private String theater_parking_info;
	private String theater_parking_fee;
	private String theater_public_bus;
	private String theater_public_subway;
	private String theater_id;
	
	
	public TheaterVO() {}


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


	public String getTheater_floor_info() {
		return theater_floor_info;
	}


	public void setTheater_floor_info(String theater_floor_info) {
		this.theater_floor_info = theater_floor_info;
	}


	public String getTheater_name() {
		return theater_name;
	}


	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}


	public String getTheater_parking_info() {
		return theater_parking_info;
	}


	public void setTheater_parking_info(String theater_parking_info) {
		this.theater_parking_info = theater_parking_info;
	}


	public String getTheater_parking_fee() {
		return theater_parking_fee;
	}


	public void setTheater_parking_fee(String theater_parking_fee) {
		this.theater_parking_fee = theater_parking_fee;
	}


	public String getTheater_public_bus() {
		return theater_public_bus;
	}


	public void setTheater_public_bus(String theater_public_bus) {
		this.theater_public_bus = theater_public_bus;
	}


	public String getTheater_public_subway() {
		return theater_public_subway;
	}


	public void setTheater_public_subway(String theater_public_subway) {
		this.theater_public_subway = theater_public_subway;
	}


	public String getTheater_id() {
		return theater_id;
	}


	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}


	@Override
	public String toString() {
		return "TheaterVO [theater_num=" + theater_num + ", theater_address=" + theater_address + ", theater_map_x="
				+ theater_map_x + ", theater_map_y=" + theater_map_y + ", theater_floor_info=" + theater_floor_info
				+ ", theater_name=" + theater_name + ", theater_parking_info=" + theater_parking_info
				+ ", theater_parking_fee=" + theater_parking_fee + ", theater_public_bus=" + theater_public_bus
				+ ", theater_public_subway=" + theater_public_subway + ", theater_id=" + theater_id + "]";
	}
	
	
	
	
	

}
