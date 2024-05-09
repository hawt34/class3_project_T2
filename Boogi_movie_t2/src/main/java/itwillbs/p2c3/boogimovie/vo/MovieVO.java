package itwillbs.p2c3.boogimovie.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MovieVO {
	private int movie_num;
	private String movie_name;
	private String movie_director;
	private String movie_poster;
	private String movie_grade;
	private String movie_summary;
	private String movie_trailler;
	private String movie_status;
	private String movie_runtime;
	private Date movie_open_date;
	private Date movie_end_date;
	
	
}
