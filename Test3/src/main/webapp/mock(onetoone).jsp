<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <!--드래그로 보기 페이지입니다-->
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
               
            </div>
            <div class="contents">
                
                <div class="many">
                    <!--<div class="fourty">
                            총 40문제/40분
                    </div>-->
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
                    <div class="problem_group">
                        <div class="number" name="">
                            문제번호/
                        </div>
                        <div class="problem">
                            ${quest_script }
                        </div>
                    </div>
                </div>
                <div class="example">
                    
                    <div class="one">
                    	1. ${sessionScope.quest_ex1 } 
                    </div>
                    <div class="two">
                   		2.  ${quest_ex2 }
                    </div>
                    <div class="three">
                        3. ${quest_ex3 }
                    </div>
                    <div class="four">
                        4. ${quest_ex4 }
                    </div>
                    <div class="five">
                        5. ${quest_ex5 }
                    </div>
                </div>
                <div class="la">
                    <a href="#"><img src="images/LA.png" alt="왼쪽 화살표"></a>
                </div>
                <div class="ra">
                    <a href="#"><img src="images/RA.png" alt="오른쪽 화살표"></a>
                </div>
                <div class="csa">
                    <div class="current">
                        1
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
            
        </div>
    </body>
   
</html>