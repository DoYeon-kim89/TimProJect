<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title></title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style2.css">
        <script src="js/script.js"></script>
    </head>
    <body>
    	<%
    		String num=null;
    		String name=null;
    		String email=null;
    		//boolean login=false;
    		Object login=null;
    		if(session.getAttribute("loginUser")!=null){
    			login=session.getAttribute("loginUser");//
    		}
    	
    	
    	%>
        <div id="wrap">
            <jsp:include page="header.jsp"></jsp:include>
            <div class="contents">
                    <div class="inside">  
                    <%if(login == null){    %>    
                        <form method="post" action="login.do">
                            <span>id</span><input type="email" name="id" placeholder="이메일 형식으로 써주세요."><br>
                            <span>pw</span><input type="text" name="pw" placeholder="비밀번호를 입력하세요.">
                            <div class="lnj">                    
                                <div class="login"><a href="index.jsp"><input type="submit" style="opacity:0;">로그인</a></div>
                                
                               
                                <jsp:include page="find.jsp"></jsp:include>
                                                    
                            </div>
                        </form>
                	<%}else { %>
                			<h1>loginUser 로그인이 된 상태입니당.</h1>
                			<!-- loginUser에 현재 로그인한 사용자의 객체 데이터가 들어있다. -->
                			<h2>안녕하세요 여기는 index.jsp 페이지입니다.</h2>
                			<h2> ${loginUser.user_id }님 환영합니다.</h2>
                			<h2> ${loginUser.user_birth } 생일 축하합니다. </h2>
                			<!-- 이 아래부분은 login_b.jsp를 사용했을 때 구동된다. 지금은 거길 이용하지 않아 아래쪽은 null값으로 나온다. -->
                			<!--  <h3><% out.println(session.getAttribute("user_name"));%>님 환영합니다.</h3>
                			<h3><% out.println(session.getAttribute("loginUser.user_id"));%>계정으로 로그인이 되었습니다.</h3>
                			<h3><% out.println(session.getAttribute("loginUser.user_tel"));%>로 전화가 갈 수 있습니다. 주의하세요</h3>
                			-->
                			<a href="information_start.jsp"><input type="button">문제풀러가자 </a>
							<input type="button" value="로그아웃!" onclick="logout()">
							<!--<jsp:include page="find.jsp"></jsp:include>-->
						<% } %>	
                </div>
            </div>
            <div class="side">
            </div>
            <div class="footer">
            </div>
        </div>
        <script>
        	function logout() {
        		location.href="logout_register.jsp";
        	}
        </script>
    </body>
</html>