<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
			String sql="select * from quest ";
			sql+="where quest_category=1 ;";
			System.out.println(sql);
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,db_id,db_pw);
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) 
				{
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
					
					if( st_quest_seq.equals("1")){
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
					
					
				}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}catch(Exception e)
			{
				System.out.println("접속 중 오류 발생:");
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex) {
					System.out.println("접속 해제 중 오류 발생 : "+ex);
				}
			}
			System.out.println("동작 끝읕");
			
		%>
	</body>
</html>