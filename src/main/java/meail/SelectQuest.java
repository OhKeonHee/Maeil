package meail;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class SelectQuest extends CompareKeyword {
	
	public static String FinalQuest;
	public static String QR;
	
	public String SelectQuest(){
	
		PreparedStatement pstmt=null;
		FinalQuest=ml.get(0);
	
	
		
	 
	 /* 사용자의 질문과 연관된 질문 중 원하는 질문을 선택
	 *  > 추후 구현 예정
	 * 
	 * String FinalQuest = null;
	 * 
	 * if (ml.size()==1) { System.out.println(ml.get(0)); FinalQuest=ml.get(0); }
	 * 
	 * else { System.out.println(ml); System.out.println("원하는 질문의 번호를 선택해주세요.");
	 * Scanner sc=new Scanner (System.in);
	 * 
	 * int num = sc.nextInt();
	 * 
	 * for (int i=0;i<ml.size();i++) {
	 * 
	 * 
	 * if (i==(num-1)) {
	 * 
	 * System.out.println("사용자가 선택한 질문"); System.out.println(ml.get(i));
	 * FinalQuest=ml.get(i); }
	 * 
	 * }
	 * 
	 * }
	 */ 
		
	
	
	 try{ 
		 conn = DriverManager.getConnection(url, user, password);
     
   
		 String sql="SELECT ans_content FROM answer INNER JOIN quest ON answer.ans_id=quest.quest_id  WHERE quest_content like ?";
		 pstmt = conn.prepareStatement(sql);  

		 pstmt.setString(1, '%'+ FinalQuest + '%');
		 ResultSet rs = pstmt.executeQuery(); //SQL문을 전달하여 실행
		 
		 while(rs.next()){
		    	QR = rs.getString("ans_content");
		    	System.out.println(QR);
		    	
				
				
			}
		    
		    rs.close();
		    
		   pstmt.close();
		   conn.close();
		  
		} catch(Exception e){
			e.printStackTrace();
					//예외 발생 시 처리부분

		} finally { //예외가 있든 없든 무조건 실행
			
			try{
				if(pstmt!=null) {
					pstmt.close();}
			
			}catch(SQLException ex1){
				//
			}
					
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException ex1){
				//
			}
			
		}

//	 System.out.println(FinalQuest);
//	 System.out.println(QR);
	 return QR;
	}
	
}