<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--<c:if test="${empty param.txtUser}">
		<jsp:forward page="error.jsp"/>
	</c:if>
	<c:if test="${not empty param.txtPassword}">
		<c:if test="${param.txtPassword == 'admin' and param.txtPassword == 'admin'}" />
		<jsp:forward page="/ClientsServlet?action=listUser"/>
	</c:if>-->
	<form action="ClientsServlet" method="post">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="txtUser" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="txtPassword" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="Submit" value="Login" /></td>
			</tr>
		</table>
	</form>
</body>
</html>