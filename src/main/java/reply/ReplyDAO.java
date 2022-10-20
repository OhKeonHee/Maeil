package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class ReplyDAO {

	private Connection conn;
	private ResultSet rs;
	
	public ReplyDAO() {
		try {
            String dbURL = "jdbc:mysql://dosly2.cafe24.com/dosly2?useUnicode=true&serverTimezone=Asia/Seoul&autoReconnect=true";
            String dbID = "dosly2";
            String dbPassword = "maeil123";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
	public int getNext() {
		String SQL="select replyID FROM REPLY ORDER BY replyID DESC";
		try {
		
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	public int write(int bbsID,String replyContent,String userID) {
		String SQL="INSERT INTO REPLY VALUES(?,?,?,?,?)";	
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, replyContent);
			pstmt.setInt(4, bbsID);
			pstmt.setInt(5, 1);
			pstmt.executeUpdate();
			return getNext();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Reply> getList(int bbsID){
		String SQL="SELECT * FROM REPLY WHERE bbsID=? AND replyAvailable=1 ORDER BY replyID DESC LIMIT 10";
		ArrayList<Reply> list=new ArrayList<Reply>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply reply=new Reply();
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBbsID(rs.getInt(4));
				reply.setReplyAvailable(rs.getInt(5));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int update(int replyID, String replyContent) {
		String SQL = "UPDATE REPLY SET replyContent = ? WHERE replyID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public Reply getComment(int replyID) {
		String SQL = "SELECT * FROM reply WHERE replyID = ? ORDER BY replyID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  replyID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBbsID(rs.getInt(4));
				reply.setReplyAvailable(rs.getInt(5));
				return reply;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int replyID) {
		String SQL = "DELETE FROM reply WHERE replyID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

public Reply getReply(int replyID) { //특정한 ID에 해당하는 게시글을 가져오도록함
	String SQL = "SELECT * FROM REPLY WHERE REPLYID = ?"; //bbsID가 특정한 숫자일 경우 진행
	try {
        PreparedStatement pstmt = conn.prepareStatement(SQL); // conn객체를 이용 SQL문장을 실행준비로 만듬
        pstmt.setInt(1, replyID);
        rs = pstmt.executeQuery();
        if (rs.next()) { //결과가 나왔다면
        	Reply Rep = new Reply();
        	Rep.setUserID(rs.getString(1));
        	Rep.setReplyID(rs.getInt(2));
        	Rep.setReplyContent(rs.getString(3));
        	Rep.setBbsID(rs.getInt(4));
        	Rep.setReplyAvailable(rs.getInt(5));
            return Rep; //정보를 모두 담은 bbs를 리턴
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
    return null; //해당글이 존재하지 않는 경우 null
	}


	/*
	 * public Reply getReplyCon(int replyID) { //특정한 ID에 해당하는 게시글을 가져오도록함 String SQL
	 * = "SELECT * FROM REPLY WHERE REPLYID = ?"; //bbsID가 특정한 숫자일 경우 진행 try {
	 * PreparedStatement pstmt = conn.prepareStatement(SQL); // conn객체를 이용 SQL문장을
	 * 실행준비로 만듬 pstmt.setInt(1, replyID); rs = pstmt.executeQuery(); if (rs.next())
	 * { //결과가 나왔다면 Reply Rep = new Reply(); Rep.setUserID(rs.getString(1));
	 * Rep.setReplyID(rs.getInt(2)); Rep.setReplyContent(rs.getString(3));
	 * Rep.setBbsID(rs.getInt(4)); Rep.setReplyAvailable(rs.getInt(5)); return Rep;
	 * //정보를 모두 담은 bbs를 리턴 } } catch(Exception e) { e.printStackTrace(); } return
	 * null; //해당글이 존재하지 않는 경우 null }
	 */
}