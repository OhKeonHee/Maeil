package meail;

public class Main extends SelectQuest{
	
	public void main(String[] args) {

		GetWorddic gw = new GetWorddic();
		gw.GetWorddic();
		
		Request rq = new Request();
		rq.Request();
		
		CompareKeyword ck = new CompareKeyword();
		ck.CompareKeyword();
		
		SelectQuest sq = new SelectQuest();
		sq.SelectQuest();
		

		}


}