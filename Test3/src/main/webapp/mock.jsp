<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.quest" %>
   
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>드래그로 보기</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style9.css">
        <script src="js/script2.js"></script>
    </head>
    <body>
        
                <jsp:include page="header.jsp"></jsp:include>
               
           
            <div class="contents">
                
                <div class="many">
                    
                    <div class="contents_1">
                        한문제씩 보기
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
                    <%
                    	
                    	
                    %>
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
                    
                    <div class="one">
                    	1. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex1() }
                    </div>
                    <div class="two">
                   		2. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex2()	 }
                    </div>
                    <div class="three">
                        3. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex3() }
                    </div>
                    <div class="four">
                        4. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex4() }
                    </div>
                    <div class="five">
                        5. ${questList.get((randomNumber.get(pageNum))-1).getQuest_ex5() }
                    </div>
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
                
            </div>
            
       
    </body>
   
</html>