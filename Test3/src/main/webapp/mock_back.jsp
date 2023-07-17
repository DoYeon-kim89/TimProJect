<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.quest" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>모의고사 40제 back</title>
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt=null;
			ResultSet rs=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/sample";
			String db_id="root";
			String db_pw="iotiot";
			String sql="select * from quest ; ";
			//sql+="where quest_category=1 ;";
			System.out.println(sql);
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,db_id,db_pw);
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				ArrayList<quest> ql = new ArrayList<quest>();
				
				while(rs.next()) 
				{
					quest q= new quest();
					q.setQuest_seq(rs.getInt("quest_seq"));
					q.setQuest_category(rs.getString("quest_category"));
					q.setQuest_script(rs.getString("quest_script"));
					q.setQuest_ex1(rs.getString("quest_ex1"));
					q.setQuest_ex2(rs.getString("quest_ex2"));
					q.setQuest_ex3(rs.getString("quest_ex3"));
					q.setQuest_ex4(rs.getString("quest_ex4"));
					q.setQuest_ex5(rs.getString("quest_ex5"));
					q.setQuest_correct_answer1(rs.getString("quest_correct_answer1"));
					q.setQuest_correct_answer2(rs.getString("quest_correct_answer2"));
					q.setQuest_comment(rs.getString("quest_comment"));
				//	q.setQuest_image(rs.getString("quest_image"));
				//	q.setQuest_video(rs.getString("quest_video"));
					q.setQuest_point(rs.getInt("quest_point"));
					
					ql.add(q);
					
				}	
				session.setAttribute("questList", ql);
				//ql객체를 session에 setAttribute해줬다. 이제 세션에 담겨있으니, 이 페이지 밖에서,
				//세션이 만료되지 않는 한, questList에 (안에)있는 모든 것을 이용할 수 있다.
				//request.setAttribute("questList", ql);
				
				//ql의 사이즈가 몇인지
				System.out.println("ql의 사이즈는 :"+ql.size());
				//ql에 담겨있는 3번 인덱스의 값을 가져와
				System.out.println("ql의 3번인덱스는 :"+ql.get(3));
				//ql.get(3) 현재 이 상태는, Object타입데이터 뭉텅이라고 봐야한다. 
				
		/*		for (int i=0; i<10; i++) {
					int str= (int)ql.get(i).getQuest_seq();
					System.out.println(str);
				}
				System.out.println(ql.get(3).getQuest_seq());
		*/
				
		
		quest randomNumber = new quest();
		ArrayList<Integer> rn = randomNumber.getRandom(); 
		//System.out.println(qi);
		
		HttpSession session2=request.getSession();
		session2.setAttribute("randomNumber",rn);
		
		int pn= 0;
	
		//HttpSession session3=request.getSession();
		session2.setAttribute("pageNum",pn);
		
		
		
		
				response.sendRedirect("mock.jsp");
				
				//참고로, list는 ArrayList타입이니까(Object), 
				//실제 안에 들어 있는 String타입으로 형변환(캐스팅) 해주고 변수에 담아 준다.
					
	
				
				//1번 form태그를 만들되, 인풋히든태그로 mock.jsp로 객체 데이터 보내주기
				//2번 session에 담아서 사용하기,
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				/* 하나하나 하지 않고, 교수님이 알려주신대로, 한 번에 다 몰아 담아. 객체 리스트에 담아둔다.
					String st_quest_seq=rs.getString("quest_seq");
					String st_quest_catagory=rs.getString("quest_category");
					String st_quest_script=rs.getString("quest_script");
					String st_quest_ex1=rs.getString("quest_ex1");
					String st_quest_ex2=rs.getString("quest_ex2");
					String st_quest_ex3=rs.getString("quest_ex3");
					String st_quest_ex4=rs.getString("quest_ex4");
					String st_quest_ex5=rs.getString("quest_ex5");
					String st_quest_correct_answer1=rs.getString("quest_correct_answer1");
					String st_quest_correct_answer2=rs.getString("quest_correct_answer2");
					String st_quest_comment=rs.getString("quest_comment");
					String st_quest_image=rs.getString("quest_image");
					String st_quest_video=rs.getString("quest_video");
					String st_quest_point=rs.getString("quest_point");
						
					
					//if( st_quest_seq.equals("1")){
						session.setAttribute("quest_seq",st_quest_seq );
						session.setAttribute( "quest_category",st_quest_catagory);
						session.setAttribute("quest_script", st_quest_catagory);
						session.setAttribute( "quest_script",st_quest_script);
						session.setAttribute("quest_ex1",st_quest_ex1 );
						session.setAttribute("quest_ex2", st_quest_ex2);
						session.setAttribute("quest_ex3", st_quest_ex3);
						session.setAttribute("quest_ex4", st_quest_ex4);
						session.setAttribute("quest_ex5",st_quest_ex5);
						session.setAttribute( "quest_correct_answer1",st_quest_correct_answer1);
						session.setAttribute("quest_correct_answer2", st_quest_correct_answer2);
						session.setAttribute("quest_comment", st_quest_comment);
						session.setAttribute("quest_point" ,st_quest_point);
						
						System.out.println("동작ㅇㅇ");
						response.sendRedirect("mock(onetoone).jsp");
					}
				*/	
					
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}catch(Exception e)
			{
				System.out.println("접속 중 오류 발생:"+e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex) {
					System.out.println("접속 해제 중 오류 발생 : "+ex);
				}
			}
			System.out.println("mock_back.jsp 동작 끝");
			
		%>
	</body>
</html>