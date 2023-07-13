package controller;

import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import beans.Member;

@WebServlet("/join.do")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index.jsp에서 a태그 누르고, 여기 join서블렛으로 get방식으로 왔다.
		RequestDispatcher dis = request.getRequestDispatcher("/join.jsp");
		//join.jsp로 보내, 실제 양식 작성하여 post방식으로 form태그 리퀴스트해서 날라올 것이다. doPost로 가자->
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("join.jsp로부터 doPost 확인!");
		request.setCharacterEncoding("utf-8");
		
		//join.jsp의 form으로부터 리퀘스트 받은 것을 자바 필드로 받아둔다.
		//얘로 나중에 객체의 재료로 쓸 것이다.
		 
		String user_id= request.getParameter("id");
		String user_password= request.getParameter("pw");
		String user_name = request.getParameter("nm");
		String user_birth = request.getParameter("bt");
		String user_tell = request.getParameter("hp");
		
		//그 객체를 완성시키고,
		Member m = new Member();//new연산자->객체 만들 설계도 이용해 객체를 '조립'하는 동작 
		m.setUser_id(user_id);
		m.setUser_password(user_password);
		m.setUser_name(user_name);
		m.setUser_birth(user_birth);
		m.setUser_tel(user_tell);
		
		// 객체 통째로 데이터 매개변수로 사용하여, MemberDAO.insertMember(만든 객체 m) 
		//실제 db에 넣어주는 작업위해, 자바와 db를 연결해주는 회선이 필요한데 딱 하나만 있고 이걸 싱글톤으로 써야함
		//그리고 그 회선연결위한 단 하나의 생성자 열어줘야 하는데, 그게 아래임.
		MemberDAO mDAO=MemberDAO.getInstance();
		int result = mDAO.insertMember(m);
		HttpSession session=request.getSession();
		if(result == 1) {
			session.setAttribute("userid", m.getUser_id());
			request.setAttribute("message", "회원가입에 성공했습니다.");
			System.out.println("회원가입 성공");
		}else {
			request.setAttribute("message", "회원가입 중 오류가 발생했습니다.");
			System.out.println(request.getAttribute("message"));
		}
		RequestDispatcher dis = request.getRequestDispatcher("login.do");
		dis.forward(request, response);
	}

}
