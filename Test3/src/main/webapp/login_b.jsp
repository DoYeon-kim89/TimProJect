<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인 처리</title>
	</head>
	<body>
	<%
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String url="jdbc:mysql://127.0.0.1:3306/sample";
		String db_id="root";
		String db_pw="iotiot";
		
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		String sql="select * from member where user_id='"+id+"' and user_password='"+pw+"';";
		System.out.println(sql);
		
		//// 여기while문 부터 하면된다.
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url, db_id, db_pw);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				String st_sq=rs.getString("user_seq");
				String st_id=rs.getString("user_id");
				String st_pw=rs.getString("user_password");
				String st_name=rs.getString("user_name");
				String st_tel=rs.getString("user_tel");
				
				if(id.equals(st_id) && pw.equals(st_pw)){
					System.out.println("로그인 성공!");
					session.setAttribute("user_seq", st_sq);
					session.setAttribute("user_id",st_id);
					session.setAttribute("user_password",st_pw);
					session.setAttribute("login",true);
					session.setAttribute("user_name",st_name);
					session.setAttribute("user_tel",st_tel);//그냥 넣어봄 나중에 삭제
				
					//로그인 여부 세션에 저장
					//session은 모든 형태의 정보를 저장할 수 있는 Object규격이기에, 데이터를 빼어서 사용할 때, 캐스팅해 주어야 한다.
					%>
					<script>
						window.open("http://naver.com");
						//잘 열리나 예시임
					</script>
					<%
				}
				
			}
				
				
				
			
			
		}catch(Exception e){
			System.out.println("login.jsp 접속중 오류 발생"+e);
		}finally{
			try{//db접속 해제 부붑ㄴ
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("접속 해제 중 오류 발생:"+ex);
			}
		}
		//세션내 정보 확인
		System.out.println("세션내 데이터 확인");
		System.out.println(session.getAttribute("user_id"));
		System.out.println(session.getAttribute("user_password"));
		System.out.println(session.getAttribute("login"));
		response.sendRedirect("index.jsp");
		
		
	
	%>
	<script>
		function a(){
			alert("다시 입력하여주시기 바랍니다.");
	
	</script>
	</body>
</html>