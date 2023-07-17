<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원가입처리 브라우저 to DB</title>
	</head>
	<body>
	<h1>rsgister.jsp 회원가입처리 브라우저 to DB</h1>
	<h2>약식에 맞게 다시 입력하시오.</h2>
		<%
			Connection conn = null;
			Statement stmt=null;
			ResultSet rs=null; 

			String url="jdbc:mysql://127.0.0.1:3306/sample";
			String db_id="root";
			String db_pw="iotiot";
			
			
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			String name=request.getParameter("nm");
			String birth=request.getParameter("bt");
			String phone=request.getParameter("hp");
			
			
			
	 String sql="insert into member(user_id, user_password, user_name, user_tel,user_birth) values (";
			sql=sql+"'"+id+"','"+pw+"','"+name+"','"+phone+"','"+birth+"'";
			sql=sql+");"; 
			
			System.out.println(sql);
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,db_id,db_pw);	//회선 연결
				stmt=conn.createStatement();	
				stmt.execute(sql);
				
				//response.sendRedirect("mypage.jsp");
				response.sendRedirect("index.jsp");
				System.out.println("아버지가방");
			}catch(Exception e){
				System.out.println("접속중 오류 발생 : "+e);
			}finally{
				try{
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("접속 해제 중 오류 발생: "+ex);
				}
			}
		%>
	</body>
</html>