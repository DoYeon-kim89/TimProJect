<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    
    %>
        <div id="wrap">
           <jsp:include page="header.jsp"></jsp:include>
                
            <div class="contents">
                    <div class="inside">  
                    	         
                        <form method="post" action="join.do" name="frm">
                            <h2>회원가입을 진행합니다.</h2>
                            <span>아이디</span>
                            <input type="email" name="id" placeholder="이메일 형식으로 써주세요.">
                            <input type="hidden" name="reid">
                            <input type="button" value="아이디 중복 확인" onclick="idCheck()"><br>
                            <span>비밀번호</span><input type="password" name="pw" placeholder="비밀번호를 입력하세요."><br>
                            <span>비밀번호확인</span><input type="password" name="pw_check"><br>
                            <span>이름</span><input type="text" name="nm" placeholder="이름을 입력하세요."><br>
                            <span>생년월일</span><input type="date" name="bt"><br>
                            <span>전화번호</span><input type="tel" name="hp" placeholder="전화번호를 입력하세요."><br>
                            <div class="lnj">                    
                                <div class="login"><a href="#"><input type="submit"  onclick="return joinCheck()" style="opacity:0;">회원가입</a></div>                  
                            </div>
                        </form>
              
                </div>
            </div>
            <div class="side">
            </div>
            <div class="footer">
            </div>
        </div>
        <script>
        	
        	function idCheck() {
        		var url="idCheck.doo?userid="+document.frm.id.value;// 현재 페이지 다큐먼트에서 frm안의 userid의 벨류값을 가져온나
        		var popupX = (window.screen.width/2) - (400/2);
        		var popupY = (window.screen.height/2) - (200/2);
        		
        		window.open(url, "_blank_1", " toolbar=no, menubar=no, scrollbar=yes, width=400, height=200 left="+popupX+", top="+popupY);
        		//window.open을 하면, 위에 만들어준 url로 접속하고, 조건도 맞춰줄 수 있다.
        		
        	}
        	function joinCheck() {
        		
        		if(document.frm.nm.value.length == 0) {
        			alert("키미노 나마에와.?");
        			frm.nm.focus();
        			return false;
        		}
        		if(document.frm.id.value.length==0) {
        			alert("필수입력란입니다.");
        			frm.id.focus();
        			return false;
        		}
        	/*	if(document.frm.userid.value.length<4) {
					alert("아이디는 4 문자 이상이어야 합니다.");
					frm.userid.focus();
					return false;
				}
        	*/
        		if(document.frm.pw.value==""){
					alert("비밀번호 필수입력란입니다.");
					frm.pw.focus();
					return false;
				}
	        	if(document.frm.pw.value != document.frm.pw_check.value) {
					alert("암호가 일치하지 않습니다.비밀번호를 다시 설정해주세요.");
					frm.pw.focus();
					return false;
				}
	        	if(document.frm.reid.value.length==0){
	        		alert("아이디 중복체크가 이루어지지 않았습니다.");
	        		System.out.println("아이디 중복체크하시오.");
	        		frm.id.focus();
	        		return false;
	        	}
	        	return true;
        	}
        	
        </script>
    </body>
</html>