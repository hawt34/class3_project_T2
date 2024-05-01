package itwillbs.p2c3.boogimovie.vo;

public class LikeMovieVO {
	private int movie_num;
	private String member_id;
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
	@Override
	public String toString() {
		return "LikeMovieVO [movie_num=" + movie_num + ", member_id=" + member_id + "]";
	}
	
	
	
}
