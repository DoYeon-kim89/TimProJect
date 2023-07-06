<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.quest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>랜덤</title>
</head>
<body>
<%	
			ArrayList<Integer> RandomQuestNum = new ArrayList<Integer>();
			
			int [] r = new int[40];
			
			for (int i=0; i<40; i++) {	  
				 r[i]=(int)((Math.random() * 500) +1);	
				 for (int j=0; j<i; j++) { //중복번호 제거
					  if(r[i] == r[j]){
						  i--;
						  break;
					  }  
					  
				  }
				  System.out.println(i+"번째 : "+r[i]); 
				  	  
			}
			
			for (int i=0; i<40; i++) {
				RandomQuestNum.add(r[i]);
			}
			System.out.println("랜던넘버 : "+RandomQuestNum);
			
				
				
%>


</body>
</html>