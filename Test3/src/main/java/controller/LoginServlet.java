package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import beans.Member;


@WebServlet("/Login.doo")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	//a태그의 클릭 또는, 도메인 창에 직접 적어 이동하는 경우에는, doGet이 자동으로 실행!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행 확인~");
		RequestDispatcher dis=request.getRequestDispatcher("");
		//### login_b의 것들을 이 서블릿 안에다가 녹여야 할 듯싶다.
		// 그리고 index.jsp에 있는 form태그에서 받은, 것들을 login.doo로 리퀘스트 하려고하는데, 정확히는 이 페이지로지.
				//그러니 거기action을 login.do로 바꾸고, login_b의 것들을 이 서블렛 getPost부분으로 옮기자.
	}	
		
		
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
