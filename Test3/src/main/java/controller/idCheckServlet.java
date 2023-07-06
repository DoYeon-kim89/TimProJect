package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;


@WebServlet("/idCheck.doo")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet실행완료");
		String userid=request.getParameter("userid");
		
		MemberDAO m =MemberDAO.getInstance();
		int result=m.confirmId(userid);
		request.setAttribute("userid",userid );
		request.setAttribute("result", result);
		//request.setAttribute를 통해서 리퀘스트에 어떤 값을 어떤 이름으로 담아줄 수 있다.
		//이렇게 담아두고, 리퀘스트 디스패처나 리다이렉트를 통해서 리퀘스트를 보낸 페이지에서 리퀘스트에 담긴 값을 EL방식이던 따로 getAttribute간에 뽑아서 사용할 수 있다.
		System.out.println("데이터 입력 확인 :"+userid+"/"+result);
		RequestDispatcher dis = request.getRequestDispatcher("idCheck.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
