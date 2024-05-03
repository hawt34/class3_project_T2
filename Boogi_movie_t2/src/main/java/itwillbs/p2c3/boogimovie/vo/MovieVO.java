package itwillbs.p2c3.boogimovie.vo;

import java.sql.Date;

public class MovieVO {
	private int movie_num;
	private int stillcut_num;
	private int genre_num;
	private String movie_name;
	private String movie_director;
	private String movie_poster;
	private String movie_grade;
	private String movie_summary;
	private String movie_trailler;
	private String movie_status;
	private Date movie_open_date;
	
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getStillcut_num() {
		return stillcut_num;
	}
	public void setStillcut_num(int stillcut_num) {
		this.stillcut_num = stillcut_num;
	}
	public int getGenre_num() {
		return genre_num;
	}
	public void setGenre_num(int genre_num) {
		this.genre_num = genre_num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_summary() {
		return movie_summary;
	}
	public void setMovie_summary(String movie_summary) {
		this.movie_summary = movie_summary;
	}
	public String getMovie_trailler() {
		return movie_trailler;
	}
	public void setMovie_trailler(String movie_trailler) {
		this.movie_trailler = movie_trailler;
	}
	public String getMovie_status() {
		return movie_status;
	}
	public void setMovie_status(String movie_status) {
		this.movie_status = movie_status;
	}
	public Date getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Date movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	@Override
	public String toString() {
		return "MovieVO [movie_num=" + movie_num + ", stillcut_num=" + stillcut_num + ", genre_num=" + genre_num
				+ ", movie_name=" + movie_name + ", movie_director=" + movie_director + ", movie_poster=" + movie_poster
				+ ", movie_grade=" + movie_grade + ", movie_summary=" + movie_summary + ", movie_trailler="
				+ movie_trailler + ", movie_status=" + movie_status + ", movie_open_date=" + movie_open_date + "]";
	}
	
	
	
}
