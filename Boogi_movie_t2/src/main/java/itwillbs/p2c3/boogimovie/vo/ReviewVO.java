package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDateTime;



public class ReviewVO {
	private int review_id;
    private int movie_num;
    private String member_id;
    private int rating;
    private String review_text;
    private LocalDateTime review_date;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReview_text() {
		return review_text;
	}
	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}
	public LocalDateTime getReview_date() {
		return review_date;
	}
	public void setReview_date(LocalDateTime review_date) {
		this.review_date = review_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", movie_num=" + movie_num + ", member_id=" + member_id
				+ ", rating=" + rating + ", review_text=" + review_text + ", review_date=" + review_date + "]";
	}
    
}
