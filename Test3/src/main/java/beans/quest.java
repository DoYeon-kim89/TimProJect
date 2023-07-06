package beans;

import java.util.ArrayList;

public class quest {
	
	private String quest_category;
	private String quest_script;
	private String quest_ex1;
	private String quest_ex2;
	private String quest_ex3;
	private String quest_ex4;
	private String quest_ex5;
	private String quest_correct_answer1;//db에는 int인데 난 String으로 쓰고싶어
	private String quest_correct_answer2;
	private String quest_comment;
	private Object quest_image;
	private Object quest_video;
	private int quest_point;
	private int quest_seq;
	
	
	public String getQuest_category() {
		return quest_category;
	}
	public void setQuest_category(String quest_category) {
		this.quest_category = quest_category;
	}
	public String getQuest_script() {
		return quest_script;
	}
	public void setQuest_script(String quest_script) {
		this.quest_script = quest_script;
	}
	public String getQuest_ex1() {
		return quest_ex1;
	}
	public void setQuest_ex1(String quest_ex1) {
		this.quest_ex1 = quest_ex1;
	}
	public String getQuest_ex2() {
		return quest_ex2;
	}
	public void setQuest_ex2(String quest_ex2) {
		this.quest_ex2 = quest_ex2;
	}
	public String getQuest_ex3() {
		return quest_ex3;
	}
	public void setQuest_ex3(String quest_ex3) {
		this.quest_ex3 = quest_ex3;
	}
	public String getQuest_ex4() {
		return quest_ex4;
	}
	public void setQuest_ex4(String quest_ex4) {
		this.quest_ex4 = quest_ex4;
	}
	public String getQuest_ex5() {
		return quest_ex5;
	}
	public void setQuest_ex5(String quest_ex5) {
		this.quest_ex5 = quest_ex5;
	}
	public String getQuest_correct_answer1() {
		return quest_correct_answer1;
	}
	public void setQuest_correct_answer1(String quest_correct_answer1) {
		this.quest_correct_answer1 = quest_correct_answer1;
	}
	public String getQuest_correct_answer2() {
		return quest_correct_answer2;
	}
	public void setQuest_correct_answer2(String quest_correct_answer2) {
		this.quest_correct_answer2 = quest_correct_answer2;
	}
	public String getQuest_comment() {
		return quest_comment;
	}
	public void setQuest_comment(String quest_comment) {
		this.quest_comment = quest_comment;
	}
	public Object getQuest_image() {
		return quest_image;
	}
	public void setQuest_image(Object quest_image) {
		this.quest_image = quest_image;
	}
//	public Object getQuest_video() {
//		return quest_video;
//	}
//	public void setQuest_video(Object quest_video) {
//		this.quest_video = quest_video;
//	}
	public int getQuest_point() {
		return quest_point;
	}
	public void setQuest_point(int quest_point) {
		this.quest_point = quest_point;
	}
	public int getQuest_seq() {
		return quest_seq;
	}
	public void setQuest_seq(int quest_seq) {
		this.quest_seq = quest_seq;
	}
	
	
	
	//세션에 무작위 번호 40개 넣기
	ArrayList<Integer> RandomQuestNum = new ArrayList<Integer>();
	
	public ArrayList<Integer> getRandom() {
		
		
		int [] r = new int[40];
		
		for (int i=0; i<40; i++) {	  
			 r[i]=(int)((Math.random() * 500) +1);	
			 for (int j=0; j<i; j++) { //중복번호 제거
				  if(r[i] == r[j]){
					  i--;
					  break;
				  }  
				  
			  }
			  System.out.println(i+"번째 : "+r[i]); 
			  	  
		}
		
		for (int i=0; i<40; i++) {
			RandomQuestNum.add(r[i]);
		}
		System.out.println("랜덤넘버 : "+RandomQuestNum);
		return RandomQuestNum;
	}
	
	
	
}

