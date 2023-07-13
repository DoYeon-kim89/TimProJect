package DAO;

import java.sql.*;
import beans.Member;

public class MemberDAO {
	//Database Access Object
	
	private MemberDAO() {
		
	}//###
	private static MemberDAO instance = new MemberDAO();
	//MemberDAO클래스 안의 것을 사용하고싶으면, 생성자를 열어야하느데,이것을 instance에 담아주었고ㅡ
	//private static으로 가두어놔서, 오직 이 MemberDAO instance에 담겨있는 회선만 사용할 수 있는 것이다.일부러
	public static MemberDAO getInstance() {
		return instance;//생성자가 담겨있다.//싱글톤방식.
	}
	
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/sample";
		String db_id="root";
		String db_pw="iotiot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,db_id,db_pw);
		return conn;
		//이 db연결 메서드인 getConnection()의 반환값은,
		//conn회선이다. 이 회선은, 우리가 db와 서버간에 통신을 할 때ㅡ 딱 하나만 필요하기에
		//그래서 이 회선을 만드는 생성자를 더 이상 만들 수 없게ㅏ instance객체로 딱 하나 두고
		//이 생성자를 보유하는 객체 하나를 두루두루 모든 곳에 쓴다. 싱글톤방식.
		//이 getConnection으로 db에 접근할때 개발자가 편안하게 쓸 수 있다
		//어디서던 회선 불러오고싶을 때, getConncetion()으로 불러올 수 있다.
		
	}
	
	
	public int userCheck(String user_id, String user_password ) {
		//사용자 인증(로그인)//db에 이용자가 있나없나.
		// -1 : 아이디가 존재하지않음->회원가입 요청
		// 0 : 비밀번호가 틀렸거나, 값이 null인 경우-> 다시 요청
		// 1 : 비밀번호가 동일한경우 -> 로그인 확인
		
		//int result=-1;
				//return result;
		
		int result = -1;
		String sql="select * from member where user_id = ?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try {
			//위에서 getConnection()메서드를 만들어 두었기에, 편하게,
			// try문안에서 직접적으로 db에 연결할 때, 주구절절 안쓰고, 바로 회선 만들어주었다.
			//회선 만들어준 것을 바탕으로 이제 통신해야쥐
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);//sql을 미리 담아서 준비해둔, 프레스테이트먼트 conn회선에 담아서 pstmt에 담는다.
			rs=pstmt.executeQuery();//sql을 담은 회선을. 실행시킨다.쿼리는 이미 담았으니 비워둔다() 리절트셋이 반환되니, 받을 변수명을 rs로 한다.
			
			if(rs.next()) {
				if(rs.getString("user_password").equals(user_password) 
						&& rs.getString("user_password")!=null) {
					result= 1;
				}else {
					result= 0;
				}
				
			}else {	
				result = -1;
			}
			
		}catch(Exception e) {
			System.out.println(" DAO.userCheck() 내부 접속 중 오류 발생: "+e);
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("접속 해제 중 오류 발생:"+ex);
			}
		}
		return result;
	}
	
	//사용자 정보 조회//입력받은 아이디를 매개변수로 받아 이 녀석이 기준점이 된 객체를 반환받는 메소드
	public Member getMember(String user_id ) {
		Member m =null;
		String sql = "select * from member where user_id = ? ";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user_id);//1번째에 사용자로부터 받은 user_id를 ?에 넣는다.
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member() ;
					//드디어 Member() 클래스 생성자로 객체를 만들어 낼 수 있다.
					//Member 클래스에 있던 name, birth, password등 그 갖가지것이 조합되면, member하는 한 객체가 완성되는 것이다.
					
				m.setUser_seq(rs.getString("user_seq"));
				m.setUser_id(rs.getString("user_id"));
				m.setUser_password(rs.getString("user_password"));
				m.setUser_name(rs.getString("user_name"));
				m.setUser_tel(rs.getString("user_tel"));
				m.setUser_birth(rs.getString("user_birth"));
				
			}
		}catch(Exception e) {
				System.out.println("DAO.getMember() 접속 중 오류 발생:"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
					
			}catch(Exception ex) {
				System.out.println("DAO.getMember() 접속 해제중 오류 발생 :"+ex);
			}
		}
		return m;
	}
	
	public int confirmId(String userid) {
		int result = -1;
		String sql="select * from member "; 
		sql+="where user_id= '"+userid+"';";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {//해당하는 데이터가 있으니, rs.next() -> true로 나와 result를 1로하라고 명령을할 수 있는 것임./
				//해당 아이디가 데이터베이스에 존재하는 경우, 중복아이디가 있어서 회원가입을 반려해야하는 경우
				result= 1;
			}else {
				//해당 아이디가 데이터베이스에 없는 경우. 회원가입을 허가해야하는경우
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("MemberDAO.confirmID() 접속 중 오류 :"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("MemberDAO.confirmId() 접속 해제 중 오류:"+ex);
			}
		}
		return result;
		
		
	}

	//회원가입 메서드
	//매개변수로 데이터(객체)를 가져올 수 있다.
	public int insertMember(Member m ) {
		int result= -1;
		String sql="insert into member (user_id, user_password, user_name, user_tel, user_birth) values (?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getUser_id() );
			pstmt.setString(2, m.getUser_password());
			pstmt.setString(3,  m.getUser_name());
			pstmt.setString(4,  m.getUser_tel());
			pstmt.setString(5, m.getUser_birth());
			
			result=pstmt.executeUpdate();//execueUpdate()의 반환값은 변경된 row수 이다! //변경된 row수가 return값이므로 1만을 반환한다.당연
			System.out.println("result값은 : "+result);
		}catch(Exception e) {
			System.out.println("MemberDAO.insertMember() 접속 중 오류 발생 :"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) { 
				System.out.println("MemberDAO.inserMember() 접속 해제 중 오류 발생 :"+ex);
			}
		}
		
		return result;//정상적으로 db에 가입처리 되면 result값은 1이다.
	}
	
	//김리나의 추가영역 23.07.13 추가
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//CLLAAASSS
