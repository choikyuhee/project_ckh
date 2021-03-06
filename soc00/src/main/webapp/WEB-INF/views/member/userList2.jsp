<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("utf-8");
%>

<html>
<head>
	<meta charset="utf-8">
	<title>회원 정보 출력창</title>
</head>
<body>
<div class="container">
	<table border="1" align="center" width="80%">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>주소</b></td>
			<td><b>번호</b></td>
			<td><b>삭제</b></td>
		</tr>
		<c:forEach var="member" items="${membersList }">
			<tr align="center">
				<td>${member.u_id }</td>
				<td>${member.u_pw }</td>
				<td>${member.u_name }</td>
				<td>${member.u_email}</td>
				<td>${member.u_address }</td>
				<td>${member.u_phone }</td>
				<td><a href="${contextPath }/member/deleteMember.do?action=deleteMember&u_id=${member.u_id}">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${contextPath }/member/joinForm.do"><h1 style="text-align:center">회원가입</h1></a>
</div>
</body>
</html>