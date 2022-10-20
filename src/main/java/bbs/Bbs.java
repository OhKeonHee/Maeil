package bbs;

public class Bbs {

	private int bbsID; //게시글 번호
	private String bbsTitle; //게시글 제목 저장
	private String userID; // 사용자 ID (작성자)
	private String bbsDate;// 작성날짜
	private String bbsContent; //게시글 2048크기로 할당함 별로 안큼
	private int bbsAvailable; // 1인 경우 -> 삭제안된 글 // 0인경우 -> 삭제됨
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
}
