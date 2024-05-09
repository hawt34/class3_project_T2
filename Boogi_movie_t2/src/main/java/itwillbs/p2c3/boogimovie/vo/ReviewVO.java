package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDateTime;

import lombok.Data;


@Data
public class ReviewVO {
	private int review_id;
    private int movie_num;
    private String member_id;
    private int rating;
    private String review_text;
    private LocalDateTime review_date;
    
}
