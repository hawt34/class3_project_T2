package itwillbs.p2c3.boogimovie.vo;

public class MovieStillcutVO {
	private int stillcut_num;
	private String stillcut_src;
	public int getStillcut_num() {
		return stillcut_num;
	}
	public void setStillcut_num(int stillcut_num) {
		this.stillcut_num = stillcut_num;
	}
	public String getStillcut_src() {
		return stillcut_src;
	}
	public void setStillcut_src(String stillcut_src) {
		this.stillcut_src = stillcut_src;
	}
	@Override
	public String toString() {
		return "MovieStillcutVO [stillcut_num=" + stillcut_num + ", stillcut_src=" + stillcut_src + "]";
	}
	
	
}
