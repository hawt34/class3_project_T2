package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class ScreenRoundVO {
	private int round_num;
	private LocalTime start_time;
	private LocalTime end_time;
	public int getRound_num() {
		return round_num;
	}
	public void setRound_num(int round_num) {
		this.round_num = round_num;
	}
	public LocalTime getStart_time() {
		return start_time;
	}
	public void setStart_time(LocalTime start_time) {
		this.start_time = start_time;
	}
	public LocalTime getEnd_time() {
		return end_time;
	}
	public void setEnd_time(LocalTime end_time) {
		this.end_time = end_time;
	}
	@Override
	public String toString() {
		return "ScreenRoundVO [round_num=" + round_num + ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}
	
	
	
}
