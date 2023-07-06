package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import beans.Member;


@WebServlet("/login.do")
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
		System.out.println("doPost() 실행확인");
		//로그인 인증처리 //로그인처리하려면,  index.jsp에서 post방식으로 쏜 form을 리퀘스트받아온다. 
		String url="index.jsp";
		request.setCharacterEncoding("utf-8");
		
		String user_id=request.getParameter("id");
		String user_password=request.getParameter("pw");
		System.out.println("index.jsp에서 리퀴스트 받아온 데이터 : id / pw : "+ user_id+" / "+user_password);
		
		//그것을 이제 DB의 해당하는 놈이랑 비교해서 맞는지 확인.
		
		MemberDAO mDAO = MemberDAO.getInstance(); //db와 연결할 회선 준비완료
		//이 회선을 이용해서 usercheck()메서드를 사용할 수 있다.
		
		int resulttt=mDAO.userCheck(user_id, user_password);
		System.out.println(resulttt);
		//로그인처리 ( -1: 아이디없음, 0 :비번틀림, 1: 로그인통과
		if(resulttt == 1) {
			//로그인 성공
			Member m =mDAO.getMember(user_id);//이제 로그인이 되었으니까, 로그인한 이용자에 대한 정보들을 막 사용할거 아니야?
			//그러니까 db에서 rs로 다 뺴주고, 빼준 것들을 자바에 m.setNum(rs.getString("num"));
			//이런식으로 해줘서, 객체를 만들어둔다. 그래야 나중에 객체호출로 편하게 메서드 써먹고 이용한다.
			
			HttpSession session=request.getSession();
			//많고많은 회선 중, index.jsp의 form태그의 섭및을 누르 사용자로부터 받는 것이니 request로 받고
			//언제나 session스코프로 사용할 수 있게
			session.setAttribute("loginUser", m);
			//데이터가 들어있는 객체 m을 loginUser라는 이름으로 session에 담아두었다.
			//loginUser에 현재 로그인한 사용자에 대한 객체(데이터)가 들어있다.그걸session에 넣어뒀으니 EL방식으로 언제든 쓸 수 있다. 
			request.setAttribute("message", "로그인에 성공했습니다.");
			url="index.jsp";
			
		}else if ( resulttt == 0) {
			//비밀번호가 틀린 경우
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		}else if ( resulttt == -1) {
			//아예 회원이 아닌 경우
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(url);//위에서 지정해둔 url index.jsp로 날아간다.
		dis.forward(request, response);
		
	}

}
