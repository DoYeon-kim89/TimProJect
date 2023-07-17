package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.*	;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.quest;



import java.beans.*;

@WebServlet("/quest.do")
public class questServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("quest.do doGet실행");
		String what =request.getParameter("what");
		HttpSession session2=request.getSession();
		
		
		
		System.out.println(what);
		if(what.equals("1")) {
			int ppage = (int)session2.getAttribute("pageNum");
			if(ppage<39) {
				ppage++;
				
				session2.setAttribute("pageNum",ppage);
				
				response.sendRedirect("mock.jsp");
			}else {
				response.sendRedirect("menu.jsp");
				System.out.println("totalScore 페이지로 호출하자");
				
			}
		}else {
			int ppage = (int)session2.getAttribute("pageNum");
			if(ppage>0) {
				ppage--;
				
				session2.setAttribute("pageNum",ppage);
				
				response.sendRedirect("mock.jsp");
			}else {
				response.sendRedirect("mock.jsp");
				System.out.println("0page로는 갈 수 없다.");
				
			}
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
