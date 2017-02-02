<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<title>Add new client</title>
</head>
<body>
<img src="images/logo.png">
		<a href="ClientsServlet?action=listUser" class="button">All clients</a>

	<form method="POST" action='ClientsServlet' name="frmAddDestination">
		<table>
			<tr>
				<td>Destination Id:</td>
				<td><input type="text" readonly="readonly" name="destinationId"
					value="<c:out value="${destination.destinationId}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Destination Name :</td>
				<td><input type="text" name="destinationName"
					value="<c:out value="${destination.destinationName}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Cost :</td>
				<td><input type="text" name="costDestination"
					value="<c:out value="${destination.cost}" />" /> <br /></td>
			</tr>
		</table>

		<input type="submit" value="Submit" />
	</form>
</body>
</html>