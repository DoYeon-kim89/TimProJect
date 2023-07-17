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
   	  	<%String user_Id = String.valueOf(pageContext.getAttribute("name"));
   	  	System.out.println("user Id: "+user_Id);%>
   	  	<!--1. 위의 object 타입의 user_Id가 유저 아이디임~  -->
   	  <%
   	   try{
   		   Class.forName("com.mysql.cj.jdbc.Driver");
   		   conn = DriverManager.getConnection(url, db_id, db_pw);
   		   stmt = conn.createStatement();
   		   
   		String sql = "insert into incorrect_table(user_Id, user_Pick, quest_correct, used_quest_no, user_save_time) values('"+user_Id+"');";
		
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
            
             
             <!-- 김리나 테스트용<form action="#" method="post">
               		<input type="hidden" name="a" value="good">
        
  					<input type="submit" value="전송!">             		
               		
               		
               </form>-->
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
                   
                    	<!-- <form action="#" method="get">
                    	
                    		<input type="hidden" name="good" value="1" style="width:100px; position:relative;">
                    		<>
                    		
                    		<input type="hidden" name="good" value="2" style="width:100px; position:relative; top:10px;">
                    		
                    		<input type="submit">
                    		
                    	
                    	</form>-->
                    <div class="problem_group">
                 
                 		 
                    <!-- int quest_number = -->
                        <div class="number" >
                        
                       
                          (실제문제번호) : ${questList.get((randomNumber.get(pageNum))-1).getQuest_seq() }
                        
                        </div>
                        <div class="problem">
                        	${ pageNum+1 } .
                            ${questList.get((randomNumber.get(pageNum))-1).getQuest_script() }
                        </div>
                    </div>
                </div>
                
                <!-- 김리나 23.07.17 -->
                 <c:set var="quest_number" value="${questList.get((randomNumber.get(pageNum))-1).getQuest_seq() }"></c:set>
 				
 				<!-- . used_quest_no -->
 				<% Object used_quest_no = (int)pageContext.getAttribute("quest_number");%>
                <%System.out.println("used_quest_no : "+used_quest_no); %>
                
         
                <div class="example">
                    <form action="#" method="post">
	                   
                    	<div class="one">	             
    	                	
   	                		<input type="submit" name="answer" value="1. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex1() }" onclick="">
                    	</div>
	                  
                    	<div class="two">
	                   		<a href="quest.do?what=<%= "1" %>" onclick="a1()"><input type="hidden" name="answer" value="2번">2. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex2()	}</a>
                    	</div>
                    	<div class="three">
                       		<a href="quest.do?what=<%= "1" %>" onclick="a1()">
       													<input type="button" name="answer" value="3번">3. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex3() }</a>
                    	</div>
                    	<div class="four">
                       		<a href="quest.do?what=<%= "1" %>" onclick="a1()"><input type="hidden" name="answer" value="4번">4. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex4() }</a>
                    	</div>
                    	<div class="five">
	                       <a href="quest.do?what=<%= "1" %>" onclick="a1()"><input type="hidden" name="answer" value="5번" >5. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex5() }</a>
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
            
            <form action="#" method="get">
            	<input type="submit" name="test" value="abcde">
            	<input type="submit" value="굿임굿" onclick="execu()">
            	<!--<div id="goodds" style="width:500px; height:200px; background-color:blue;" onclick="execu()">
            		클릭해봐 
            	</div>-->
            
            </form>
            
      	
    
   		<script>
   		var fo = document.getElementsByTagName("form")[0];
		console.log(fo);
	
   			function a1(){
   				fo.submit();
   			
   			}
   			
   		
   			function tes(){
   				//
   				console.log("test 실행됨");
   			}
   			function consol(){
   				console.log("잘되고 있습니다.");
   				
   			}
   			function execu(){
   				//console.log("되냐?");
   				//window.location.href = "http://www.w3schools.com";
   				//안된다.
   				//window.location.href="quest.do?what=<       \"1\"           ";
   			}
   		 <% 
		 	
   		 String a2 = request.getParameter("answer");
	        //int a1_1 = Integer.parseInt(a1);
	        
	        //string을 목적한 게 아닌데 int로 안변해서 지움... 
	        //암튼 별 상관은 없으니까 String으로 씁니다 답 패러미터를!
	        
	     	System.out.println("!답:"+a2);
	     	//String p = request.getParameter("a");
	     	//System.out.println("a 패러미터:"+p);
   		 	
	     	//test2
	     	//String test = request.getParameter("good");
   		 	//System.out.println("테스트 값: "+test);
	    
   		 	String t = request.getParameter("test");
   		 	System.out.println("테스트 패러미터"+t);
   		 	
   		 	%>
   	
   			//김리나 23.07.14
   			//if(a2!=null){
   				//response.sendRedirect("quest.do?what=    "1"");
   			//}
   		
  
   			/*var d = document.getElementsByTagName("div")[12];
   			console.log(d);
   			var d_a = d.getElementsByTagName("a")[0];
   			console.log(d_a);
   			d_a.addEventListener("click", function(){
   				console.log("클릭되었습니다.");
   				fo.submit();
   			});*/
   			
   		</script>
   		
    </body>
    
</html>