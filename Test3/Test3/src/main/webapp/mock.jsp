<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.quest" %>
<!-- 23. 07. 13 김리나 추가-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <!--김리나 23.07.13 추가 -->
   <%
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   
	   String url ="jdbc:mysql://127.0.0.1:3306/sample";
   	   String db_id = "root";
   	   String db_pw = "iotiot";
   	   
   	   request.setCharacterEncoding("utf-8");
   	   String id = request.getParameter("id");
   	   String pw = request.getParameter("pw");
   	   %>
   	   
   	   <!-- 유저의 아이디를 jstl의 변수로 구현한 것-->
   	   <c:set var="name" value="${loginUser.user_id }"/>
   		
   		<!--그 c 태그를 밑에서 스크립트릿 안에서 연결하여 구현한 것임 -->
   	  	<%Object o = pageContext.getAttribute("name");
   	  	System.out.println("user id: "+o);%>
   	  	<!--위의 object 타입의 o가 유저 아이디임~  -->
   	  <%
   	   try{
   		   Class.forName("com.mysql.cj.jdbc.Driver");
   		   conn = DriverManager.getConnection(url, db_id, db_pw);
   		   stmt = conn.createStatement();
   		   
   		String sql = "insert into incorrect_table(user_id, user_Pick, quest_correct, used_quest_no, user_save_time) values('"+id+"');";
		
   		%>
   	 	
		  <%
   	   }catch(Exception e){
   		  System.out.println("접속 중 오류 발생 : "+e); 
   	   }finally{
   		   try{
   			   
   		   }catch(Exception ex){
   			   System.out.println("접속 해제 중 오류 발생");
   		   }
   	   }
   
   %>
   
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>드래그로 보기</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style9.css">
        <script src="js/script2.js"></script>
        <style>
        	input{
        		position:absolute;
        		z-index:1;
        	}
        	a{
        		position:relative;
        		z-index:2;
        	}
        </style>
    </head>
    <body>
        
                <jsp:include page="header.jsp"></jsp:include>
             <!-- 김리나 추가함 23.07.13--> 
            
           
            <div class="contents">
                
                <div class="many">
                    
                    <div class="contents_1">
                        한문제씩 보기<!-- 모바일 앱을 모티브로 했으니, 이 div는 삭제하고싶어요 -->
                    </div>
                    <div class="stopWatch">
                        <div class="time">
                        	
                        </div>
                        <div class="boon">
                        		분
   							</div>
   	                        <div class="cho">
                            	초
                            </div>
                      
                    </div>
                   
                    <div class="problem_group">
                 	 
                    
                        <div class="number" >
                        
                         
                          (실제문제번호) : ${questList.get((randomNumber.get(pageNum))-1).getQuest_seq() }
                        
                        </div>
                        <div class="problem">
                        	${ pageNum+1 } .
                            ${questList.get((randomNumber.get(pageNum))-1).getQuest_script() }
                        </div>
                    </div>
                </div>
                <div class="example">
                    <form action="#" method="get">
	                    <div class="one">	              
    	                	
    	                	<a href="quest.do?what=<%= "1" %>"><input type="hidden" name="answer" value="1">1. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex1() }</a>
                    	</div>
                    	<div class="two">
	                   		<a href="quest.do?what=<%= "1" %>"><input type="hidden" name="answer" value="2">2. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex2()	 }
                    	</div>
                    	<div class="three">
                       		<a href="quest.do?what=<%= "1" %>"><input type="hidden" name="answer" value="3">3. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex3() }
                    	</div>
                    	<div class="four">
                       		<a href="quest.do?what=<%= "1" %>"><input type="hidden" name="answer" value="4">4. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex4() }
                    	</div>
                    	<div class="five">
	                        <a href="quest.do?what=<%= "1" %>"><input type="hidden" name="answer" value="5">5. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex5() }
    	                </div>
    	             </form>
                </div>
               
                <div class="la"><!-- 페이지0일때는 버튼 없애거나 아예 막을 수 없나,.? -->
                    <a href="quest.do?what=<%= "-1" %>"><img src="images/LA.png" alt="왼쪽 화살표"></a>
                </div>
                <div class="ra">
                    <a href="quest.do?what=<%= "1" %>"><img src="images/RA.png" alt="오른쪽 화살표"></a>
                </div>
                <div class="csa">
                    <div class="current">
                        ${ pageNum+1 }<!-- 현재 페이지 : -->
                    </div>
                    <div class="slash">
                        /
                    </div>
                    <div class="alls">
                        40
                    </div>
                </div>
                    <jsp:include page="find.jsp"></jsp:include>
            
            		<div class="ui">
            			
            			 ${loginUser.user_id }
            		</div>
          
         
               
                
            </div>
      
     <% String a1 = request.getParameter("answer");
        //int a1_1 = Integer.parseInt(a1);
        
        //string을 목적한 게 아닌데 int로 안변해서 지움... 
        //암튼 별 상관은 없으니까 String으로 씁니다 답 패러미터를!
        
     	System.out.println("답:"+a1);
     
     %>
       	
    </body>
   
</html>