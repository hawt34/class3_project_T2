package itwillbs.p2c3.boogimovie.vo;

public class PageInfo {
	private int NoticeCount; // 총 공지사항 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수
	private int maxPage; // 전체 페이지 수(최대 페이지 번호)
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	
	
	
	public PageInfo(int noticeCount, int pageListLimit, int maxPage, int startPage, int endPage) {
		super();
		NoticeCount = noticeCount;
		this.pageListLimit = pageListLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getNoticeCount() {
		return NoticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		NoticeCount = noticeCount;
	}
	public int getPageListLimit() {
		return pageListLimit;
	}
	public void setPageListLimit(int pageListLimit) {
		this.pageListLimit = pageListLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "PageInfo [NoticeCount=" + NoticeCount + ", pageListLimit=" + pageListLimit + ", maxPage=" + maxPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
