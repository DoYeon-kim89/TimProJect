<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>아이디 중복확인(새창)</title>
	</head>
	<body>
		<h1>아이디 중복확인</h1>
		<form method="get" action="idCheck.doo" name="frm">
			아이디<input type="text" name="userid" value="${userid }">
			<input type="submit" value="중복체크">
			<br>
			<c:if test="${result ==1 }">
				<script>
					opener.document.frm.reid.value="";
				</script>
				${userid }는 이미 사용중인 아이디입니다.
			</c:if>
			<c:if test="${result == -1 }">
				${userid }는 사용이 가능한 아이디입니다.
				<input type="button" value="사용하기" onclick="idok()">
				
			</c:if>
		</form>
		<script>
			function idok(){
				//opener니까 여기 idcheck.jsp을 낳아준 idcheck.do를 의미한다.
				opener.document.frm.id.value=document.frm.userid.value;//팝업창에서 사용허용이된 아디값을 부모창의 벨류로옮김
				opener.document.frm.reid.value=document.frm.userid.value//이렇게 팝업에서 중복체크된 아이디를 받아와 부모창에 대려왔고, 또 수정될 가능성을 염두해, 이녀석과 숨어있는 reid에도 벨류값을 지정하고 둘을 비교해 같으..
				self.close();
			}
		</script>
	</body>
</html>