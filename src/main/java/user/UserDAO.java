package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt; //�빐�궧�쓣 諛⑹��븯�뒗
    private ResultSet rs;
/*
    //암호 변경할 때 필요함
    public User selectById(Connection conn, String id)throws SQLException{
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	try {
    		pstmt = conn.prepareStatement("select * from user where userID = ?");
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		User user = null;
    		if(rs.next()) {
    			user = new User(
    						rs.getString("userID"),
    						rs.getString("userName"),
    						rs.getString("userPassword"),
    						rs.getString("userEmail")
    					);
    		}
    		return user;
    	}finally {}
    	
    }
*/
    public UserDAO() {
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
    
 
    public int login(String userID, String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //?濡� userID瑜� 諛쏆쓬
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();//寃곌낵���엯
            if (rs.next()) {
                if(rs.getString(1).equals(userPassword)) {
                    return 1; // 濡쒓렇�씤 �꽦怨�
                } else {
                    return 0; // 鍮꾨�踰덊샇 遺덉씪移�
                }
            }
            return -1; // �븘�씠�뵒媛� �뾾�쓬
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
    }
    
    
    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)"; // user�젙蹂대줈 �뱾�뼱媛� 5媛�吏�
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID()); //臾쇱쓬�몴�뿉 �뱾�뼱媛덈궡�슜�씠 臾댁뾿�씤吏�, SQL�닚�꽌瑜� 吏��궎硫� �꽔湲�
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserEmail());
            return pstmt.executeUpdate(); // �빐�떦 �뒪�뀒�씠�듃癒쇳듃瑜� �떎�뻾�븳 寃곌낵瑜� �꽔�쓣 �닔 �엳�룄濡�
            } catch(Exception e) {
                e.printStackTrace();
            }
            return -1; // �뜲�씠�꽣踰좎씠�뒪�삤瑜�
        }
   
    
    //암호 변경
    public void update(Connection conn, User user)throws SQLException{
    	try(PreparedStatement pstmt = conn.prepareStatement(
    			"update user set name = ?, password = ? where userID = ?")){
    		pstmt.setString(1, user.getUserName());
    		pstmt.setString(2, user.getUserPassword());
    		pstmt.setString(3, user.getUserID());
    		pstmt.setString(4, user.getUserEmail());
    		pstmt.executeUpdate();
    		}
    	}

}